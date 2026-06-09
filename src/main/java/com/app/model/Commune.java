package com.app.model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "commune")
public class Commune {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "libelle")
    private String libelle;

    @ManyToOne
    @JoinColumn(name = "idDistrict")
    @JsonIgnore
    private District district;

    @OneToMany(mappedBy = "commune")
    @JsonIgnore
    private List<Demande> demandes = new ArrayList<>();

    public Commune() {

    }

    public Commune(String libelle) {
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

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    public void setDemandes(List<Demande> demandes) {
        this.demandes = demandes;
    }

    public List<Demande> getDemandes() {
        return demandes;
    }
}
