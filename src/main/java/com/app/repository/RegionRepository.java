package com.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.Region;

public interface RegionRepository extends JpaRepository<Region, Integer> {

}