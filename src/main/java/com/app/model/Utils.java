package com.app.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.app.repository.StatutRepository;
import com.app.repository.TypeDevisRepository;

@Component
public class Utils {

    public Map<String, Statut> statutBySigle = new HashMap<>();
    public Map<Integer, String> sigleStatutByTypeDevis = new HashMap<>();
    private Map<Integer, TypeDevis> typesDevisById = new HashMap<>();

    public Utils(StatutRepository statutRepository, TypeDevisRepository typeDevisRepository) {
        List<Statut> statut = statutRepository.findAll();
        List<TypeDevis> typesDevis = typeDevisRepository.findAll();

        for (Statut s : statut) {
            statutBySigle.put(s.getSigle(), s);
        }

        for (TypeDevis td : typesDevis) {
            typesDevisById.put(td.getId(), td);
        }

        sigleStatutByTypeDevis.put(1, "DEC");
        sigleStatutByTypeDevis.put(2, "DFC");

    }

    public Statut getStatutBySigle(String sigle) {
        return statutBySigle.get(sigle);
    }

    public Statut getStatutByTypeDevis(TypeDevis typeDevis) {
        String sigle = sigleStatutByTypeDevis.get(typeDevis.getId());
        return statutBySigle.get(sigle);
    }

    public TypeDevis getTypeDevisById(Integer id) {
        return typesDevisById.get(id);
    }

}
