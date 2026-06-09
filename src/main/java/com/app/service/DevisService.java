package com.app.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.model.Devis;
import com.app.model.Utils;
import com.app.model.Statut;
import com.app.model.Demande;
import com.app.model.DemandeStatut;
import com.app.model.SousDevis;
import com.app.model.TypeDevis;
import com.app.model.User;
import com.app.repository.DevisRepository;
import com.app.repository.DemandeStatutRepository;
import com.app.repository.SousDevisRepository;

import jakarta.transaction.Transactional;

@Service
public class DevisService {

        @Autowired
        private DevisRepository devisRepository;

        @Autowired
        private DemandeService demandeService;

        @Autowired
        private DemandeStatutService demandeStatutService;

        @Autowired
        private SousDevisRepository sousDevisRepository;

        @Autowired
        private DemandeStatutRepository demandeStatutRepository;

        @Autowired
        private Utils utils;

        public List<TypeDevis> getCreatableTypesForDemande(Demande demande) {
                Statut currentStatut = demandeStatutRepository.findTopByDemandeIdOrderByIdDesc(demande.getId())
                                .getStatut();

                List<TypeDevis> typesDevis = new ArrayList<TypeDevis>();

                typesDevis.add(utils.getTypeDevisById(1));

                Statut statutDevisEtudeAccepte = utils.getStatutBySigle("DEA");
                if (currentStatut.getId() >= statutDevisEtudeAccepte.getId()) {
                        typesDevis.add(utils.getTypeDevisById(2));
                }

                return typesDevis;
        }

        @Transactional
        public void createDevis(Devis devis, User user, LocalDateTime date) {
                devisRepository.save(devis);
                for (SousDevis dd : devis.getSousDevis()) {
                        dd.setDevis(devis);
                        sousDevisRepository.save(dd);
                }

                Integer id = devis.getDemande().getId();
                LocalDateTime oldDate = demandeService.getCurrentStatut(id).getDate();
                LocalDateTime newDate = date;
                double DT = demandeStatutService.DtMinute(oldDate, newDate);

                DemandeStatut ds = new DemandeStatut();
                ds.setDemande(devis.getDemande());
                ds.setStatut(utils.getStatutByTypeDevis(devis.getTypeDevis()));
                ds.setDate(date);
                ds.setUser(user);
                ds.setDT(DT);
                demandeStatutRepository.save(ds);
        }

        // @Transactional
        // public void update(Devis devis) {
        // Devis ancienDevis = devisRepository.findById(devis.getId()).get();
        // for (SousDevis dd : ancienDevis.getSousDevis()) {
        // devisDetailsRepository.delete(dd);
        // }

        // devis.setDate(ancienDevis.getDate());
        // for (DevisDetails dd : devis.getDetails()) {
        // dd.setDevis(devis);
        // }
        // devisRepository.save(devis);

        // if (!ancienDevis.getType().equals(devis.getType())) {
        // DemandeStatut ds = new DemandeStatut();
        // ds.setDemande(devis.getDemande());
        // ds.setStatut(utils.getStatutByTypeDevis(devis.getType()));
        // ds.setDate(LocalDateTime.now());
        // demandeStatutRepository.save(ds);
        // }
        // }

        // @Transactional
        // public void deleteById(Long id) {
        // Devis devis = devisRepository.findById(id).get();
        // devisDetailsRepository.deleteByDevis(devis);
        // devisRepository.delete(devis);
        // }

        public List<Devis> getListDevis() {

                List<Devis> devis = devisRepository.findAll();

                for (Devis d : devis) {
                        DemandeStatut current = demandeService.getCurrentStatut(d.getDemande().getId());
                        d.getDemande().setCurrentStatut(current);
                }
                return devis;
        }

}