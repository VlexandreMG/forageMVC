package com.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.app.model.District;
import com.app.repository.DistrictRepository;

@Service
public class DistrictService {

    private DistrictRepository districtRepository;

    public DistrictService(DistrictRepository districtRepository) {
        this.districtRepository = districtRepository;
    }

    public List<District> getDistrictsByRegionId(Integer regionId) {
        return districtRepository.findByRegionId(regionId);
    }
}