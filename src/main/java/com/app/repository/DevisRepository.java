package com.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.Devis;

public interface DevisRepository extends JpaRepository<Devis, Integer> {

    public Devis findDevisById(Integer id);

    public Devis findByDemandeId(Integer id);
}