package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.Commune;

public interface CommuneRepository extends JpaRepository<Commune, Integer> {

    public List<Commune> findByDistrictId(Integer districtId);
}