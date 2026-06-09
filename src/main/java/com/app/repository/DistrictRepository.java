
package com.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.model.District;

public interface DistrictRepository extends JpaRepository<District, Integer> {

    public List<District> findByRegionId(Integer regionId);
}