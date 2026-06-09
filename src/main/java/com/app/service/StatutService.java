package com.app.service;

import java.util.List;
import com.app.model.Statut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.repository.StatutRepository;

@Service
public class StatutService {

    @Autowired
    public StatutRepository statutRepository;

    public List<Statut> getAllStatut() {
        return statutRepository.findAll();
    }
}
