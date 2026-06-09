package com.app.service;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.app.model.DemandeStatut;
import com.app.model.User;
import com.app.repository.DemandeStatutRepository;

import jakarta.transaction.Transactional;

@Service
public class DemandeStatutService {

    private final DemandeStatutRepository demandeStatutRepository;

    public DemandeStatutService(DemandeStatutRepository repository) {
        this.demandeStatutRepository = repository;
    }

    public void addDemandeStatut(DemandeStatut demandeStatut, User user) {
        demandeStatut.setUser(user);
        demandeStatutRepository.save(demandeStatut);
    }

    public DemandeStatut findById(Integer id) {

        DemandeStatut demande = demandeStatutRepository.findById(id).orElse(null);

        return demande;
    }

    public double DtMinute(LocalDateTime dateDebut, LocalDateTime dateFin) {
        double minutes = 0.0;
        LocalDate courant = dateDebut.toLocalDate();
        LocalDate fin = dateFin.toLocalDate();
        Integer heureDebutTravail = 8;
        Integer heureFinTravail = 16;

        while (!courant.isAfter(fin)) {

            DayOfWeek jour = courant.getDayOfWeek();

            if (jour != DayOfWeek.SATURDAY && jour != DayOfWeek.SUNDAY) {

                LocalDateTime debutTravail = courant.atTime(heureDebutTravail, 0);
                LocalDateTime finTravail = courant.atTime(heureFinTravail, 0);

                LocalDateTime debutCalcul = debutTravail;
                LocalDateTime finCalcul = finTravail;

                if (courant.equals(dateDebut.toLocalDate())) {
                    if (dateDebut.isAfter(debutCalcul)) {
                        debutCalcul = dateDebut;
                    }
                }
                if (courant.equals(dateFin.toLocalDate())) {
                    if (dateFin.isBefore(finCalcul)) {
                        finCalcul = dateFin;
                    }
                }

                if (debutCalcul.isBefore(finCalcul)) {
                    minutes += Duration.between(debutCalcul, finCalcul).toMinutes();
                }
            }
            courant = courant.plusDays(1);
        }
        return minutes;
    }

    public void recalculerDureeTravaillee() {
        Integer nbrDemande = demandeStatutRepository.nombreDemande();
        for (int j = 0; j < nbrDemande; j++) {
            List<DemandeStatut> listDemandeStatuts = demandeStatutRepository.findByDemandeIdOrderByDateAsc(j);
            for (int i = 0; i < listDemandeStatuts.size() - 1; i++) {

                LocalDateTime heureDebut = listDemandeStatuts.get(i).getDate();
                LocalDateTime heureFin = listDemandeStatuts.get(i + 1).getDate();
                Double dt = DtMinute(heureDebut, heureFin);
                listDemandeStatuts.get(i + 1).setDT(dt);
                demandeStatutRepository.save(listDemandeStatuts.get(i + 1));
            }
        }

    }

    @Transactional
    public void editAndRecalculate(DemandeStatut demandeStatut) {

        demandeStatutRepository.save(demandeStatut);

        recalculerDureeTravaillee();
    }

}