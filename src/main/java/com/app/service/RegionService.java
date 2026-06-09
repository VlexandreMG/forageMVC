package com.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.app.model.Region;
import com.app.repository.RegionRepository;

@Service
public class RegionService {

    private RegionRepository regionRepository;

    public RegionService(RegionRepository regionRepository) {
        this.regionRepository = regionRepository;
    }

    public List<Region> getAllRegions() {
        return regionRepository.findAll();
    }

}