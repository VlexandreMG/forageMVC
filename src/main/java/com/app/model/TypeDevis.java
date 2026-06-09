package com.app.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "typeDevis")
public class TypeDevis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "libelle")
    private String libelle;

    @OneToMany(mappedBy = "typeDevis")
    private List<Devis> devis = new ArrayList<>();

    public TypeDevis() {
    }

    public TypeDevis(String libelle) {
        this.libelle = libelle;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public List<Devis> getDevis() {
        return devis;
    }

    public void setDevis(List<Devis> devis) {
        this.devis = devis;
    }

}