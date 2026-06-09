package com.app.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "demandeStatut")
public class DemandeStatut {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "idDemande")
    private Demande demande;

    @ManyToOne
    @JoinColumn(name = "idStatut")
    private Statut statut;

    @ManyToOne
    @JoinColumn(name = "idUser")
    private User user;

    @Column(name = "observation")
    private String observation;

    @Column(name = "date")
    private LocalDateTime date;

    @Column(name = "DT")
    private Double DT = 0.0;

    public DemandeStatut() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Statut getStatut() {
        return statut;
    }

    public void setStatut(Statut statut2) {
        this.statut = statut2;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Demande getDemande() {
        return demande;
    }

    public void setDemande(Demande demande) {
        this.demande = demande;
    }

    public Double getDT() {
        return DT;
    }

    public void setDT(Double dT) {
        DT = dT;
    }

}
