package com.app.dto;

import com.app.model.TypeDevis;

public class TypeDevisDto {

    private Integer id;
    private String libelle;

    public TypeDevisDto(TypeDevis td) {
        this.id = td.getId();
        this.libelle = td.getLibelle();
    }

    public Integer getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }
}