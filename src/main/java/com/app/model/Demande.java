package com.app.model;

import java.util.ArrayList;
import java.util.List;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "demande")
public class Demande {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idClient")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "idCommune")
    private Commune commune;

    @Column(name = "lieu")
    private String lieu;

    @Column(name="duree_travail")
    private int dureeTravail;

    
    @OneToMany(mappedBy = "demande")
    private List<DemandeStatut> demandeStatut = new ArrayList<>();
    
    @Transient
    private DemandeStatut currentStatut;
    
    @OneToMany(mappedBy = "demande")
    private List<Devis> devis = new ArrayList<>();
    
    public int getDureeTravail() {
        return dureeTravail;
    }

    public void setDureeTravail(int dureeTravail) {
        this.dureeTravail = dureeTravail;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Commune getCommune() {
        return commune;
    }

    public void setCommune(Commune commune) {
        this.commune = commune;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public List<DemandeStatut> getDemandeStatut() {
        return demandeStatut;
    }

    public void setDemandeStatut(List<DemandeStatut> demandeStatut) {
        this.demandeStatut = demandeStatut;
    }

    public DemandeStatut getCurrentStatut() {
        return currentStatut;
    }

    public void setCurrentStatut(DemandeStatut currentStatut) {
        this.currentStatut = currentStatut;
    }

    public List<Devis> getDevis() {
        return devis;
    }

    public void setDevis(List<Devis> devis) {
        this.devis = devis;
    }

    public Demande(String lieu) {
        this.lieu = lieu;
    }

    public Demande() {

    }

}
