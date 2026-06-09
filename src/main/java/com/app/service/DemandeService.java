package com.app.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.AlertesDto;
import com.app.model.Demande;
import com.app.model.DemandeStatut;
import com.app.model.Parametres;
import com.app.model.User;
import com.app.repository.ClientRepository;
import com.app.repository.CommuneRepository;
import com.app.repository.DemandeRepository;
import com.app.repository.DemandeStatutRepository;
import com.app.repository.ParametresRepository;
import com.app.repository.StatutRepository;

@Service
public class DemandeService {

    @Autowired
    private DemandeRepository demandeRepository;

    @Autowired
    private DemandeStatutRepository demandeStatutRepository;

    @Autowired
    private StatutRepository statutRepository;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private CommuneRepository communeRepository;

    @Autowired
    private ParametresRepository parametresRepository;

    public List<Demande> getAllDemandes() {
        List<Demande> demandes = demandeRepository.findAll();

        for (Demande d : demandes) {
            DemandeStatut current = getCurrentStatut(d.getId());
            d.setCurrentStatut(current);
        }
        return demandes;

    }

    public void saveDemande(Demande demande, String observation, User user, LocalDateTime date) {
        demandeRepository.save(demande);

        DemandeStatut demandeStatut = new DemandeStatut();
        demandeStatut.setDemande(demande);
        demandeStatut.setStatut(statutRepository.findByLibelle("Demande créée"));
        demandeStatut.setDate(date);
        demandeStatut.setObservation(observation);
        demandeStatut.setUser(user);

        demande.getDemandeStatut().add(demandeStatut);
        demandeStatutRepository.save(demandeStatut);

    }

    public DemandeStatut getCurrentStatut(Integer idDemande) {
        return demandeStatutRepository.findTopByDemandeIdOrderByIdDesc(idDemande);
    }

    public void delete(Integer id) {
        demandeRepository.deleteById(id);
    }

    public Demande findById(Integer id) {

        Demande demande = demandeRepository.findById(id).orElse(null);

        demande.setCurrentStatut(getCurrentStatut(id));

        return demande;
    }

    public void updateDemande(Integer id, Integer idClient, Integer idCommune, String lieu, String observation,
            LocalDateTime date, User user, Integer idStatut) {

        Demande demande = demandeRepository.findById(id).orElse(null);
        if (demande != null) {
            demande.setLieu(lieu);
            demande.setClient(clientRepository.findById(idClient).orElse(null));
            demande.setCommune(communeRepository.findById(idCommune).orElse(null));
            demandeRepository.save(demande);

            DemandeStatut ds = getCurrentStatut(id);

            if (ds == null) {
                ds = new DemandeStatut();
                ds.setDemande(demande);
            }

            ds.setStatut(statutRepository.findById(idStatut).orElse(null));
            ds.setObservation(observation);
            ds.setDate(date);
            ds.setUser(user);

            demandeStatutRepository.save(ds);
        }
    }

    public int priorite(String alerte) {
        if ("Rouge".equalsIgnoreCase(alerte))
            return 2;
        if ("Jaune".equalsIgnoreCase(alerte))
            return 1;
        return 0;
    }

    public List<AlertesDto> garderPlusGrave(List<AlertesDto> list) {

        Map<String, AlertesDto> map = new HashMap<>();

        for (AlertesDto a : list) {

            String key = a.getIdStatut1() + "-" + a.getIdStatut2();

            if (!map.containsKey(key)) {
                map.put(key, a);
            } else {
                AlertesDto exist = map.get(key);

                if (priorite(a.getAlerte()) > priorite(exist.getAlerte())) {
                    map.put(key, a);
                }
            }
        }

        return new ArrayList<>(map.values());
    }

    public List<AlertesDto> getAlertes(Integer idDemande) {

        List<AlertesDto> result = new ArrayList<>();
        List<DemandeStatut> statuts = demandeStatutRepository.findByDemandeIdOrderByDateAsc(idDemande);
        List<Parametres> params = parametresRepository.findAll();

        for (Parametres p : params) {

            Integer start = p.getIdStatut1();
            Integer end = p.getIdStatut2();

            double totalDT = 0;

            boolean started = false;
            boolean reached = false;

            for (int i = 0; i < statuts.size() - 1; i++) {

                int s1 = statuts.get(i).getStatut().getId();
                int s2 = statuts.get(i + 1).getStatut().getId();

                if (s1 == start) {
                    started = true;
                }

                if (started) {
                    totalDT += statuts.get(i + 1).getDT();
                }

                if (s2 == end && started) {
                    reached = true;
                    break;
                }
            }

            if (started && reached) {

                if (totalDT > p.getDT()) {
                    result.add(new AlertesDto(p, totalDT));
                }
            }
        }
        return garderPlusGrave(result);
    }
}
