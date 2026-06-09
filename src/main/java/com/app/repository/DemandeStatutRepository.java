package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.model.DemandeStatut;

public interface DemandeStatutRepository extends JpaRepository<DemandeStatut, Integer> {

    DemandeStatut findTopByDemandeIdOrderByIdDesc(Integer id);

    List<DemandeStatut> findByDemandeIdOrderByDateAsc(Integer id);

    @Query("Select count( DISTINCT d.demande.id) from DemandeStatut d")
    Integer nombreDemande();
}