package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.SousDevis;

public interface SousDevisRepository
                extends JpaRepository<SousDevis, Integer> {
        List<SousDevis> findSousDevisByDevisId(Integer id);

}