package com.app.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.app.model.Commune;
import com.app.model.District;
import com.app.service.CommuneService;
import com.app.service.DistrictService;

@RestController
public class AjaxController {

    private DistrictService districtService;
    private CommuneService communeService;

    public AjaxController(DistrictService districtService,
            CommuneService communeService) {

        this.districtService = districtService;
        this.communeService = communeService;
    }

    @GetMapping("/district/region/{id}")
    public List<District> getDistricts(@PathVariable("id") Integer id) {

        return districtService.getDistrictsByRegionId(id);

    }

    @GetMapping("/commune/district/{id}")
    public List<Commune> getCommunes(@PathVariable("id") Integer id) {

        return communeService.getCommunesByDistrictId(id);

    }
}