package com.app.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "devis")
public class Devis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idDemande")
    private Demande demande;

    @ManyToOne
    @JoinColumn(name = "idTypeDevis")
    private TypeDevis typeDevis;

    @OneToMany(mappedBy = "devis")
    private List<SousDevis> sousDevis = new ArrayList<>();

    public Devis() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Demande getDemande() {
        return demande;
    }

    public void setDemande(Demande demande) {
        this.demande = demande;
    }

    public TypeDevis getTypeDevis() {
        return typeDevis;
    }

    public void setTypeDevis(TypeDevis typeDevis) {
        this.typeDevis = typeDevis;
    }

    public List<SousDevis> getSousDevis() {
        return sousDevis;
    }

    public void setSousDevis(List<SousDevis> sousDevis) {
        this.sousDevis = sousDevis;
    }

}