
package com.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.Statut;

public interface StatutRepository extends JpaRepository<Statut, Integer> {
    public Statut findByLibelle(String libelle);

}