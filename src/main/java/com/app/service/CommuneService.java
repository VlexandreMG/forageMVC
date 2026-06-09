package com.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.app.model.Commune;
import com.app.repository.CommuneRepository;

@Service
public class CommuneService {

    private CommuneRepository communeRepository;

    public CommuneService(CommuneRepository communeRepository) {
        this.communeRepository = communeRepository;
    }

    public List<Commune> getCommunesByDistrictId(Integer districtId) {
        return communeRepository.findByDistrictId(districtId);
    }
}