
package com.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.Demande;

public interface DemandeRepository extends JpaRepository<Demande, Integer> {

}