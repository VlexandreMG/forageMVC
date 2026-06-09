package com.app.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "parametres")
public class Parametres {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "idStatut1")
    private Integer idStatut1;

    @Column(name = "idStatut2")
    private Integer idStatut2;

    @Column(name = "DT")
    private Double DT;

    @Column(name="DT2")
    private Double DT2;

    @Column(name = "alerte")
    private String alerte;
    
    public Parametres() {
    }
    public Double getDT2() {
        return DT2;
    }

    public void setDT2(Double dT2) {
        DT2 = dT2;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdStatut1() {
        return idStatut1;
    }

    public void setIdStatut1(Integer idStatut1) {
        this.idStatut1 = idStatut1;
    }

    public Integer getIdStatut2() {
        return idStatut2;
    }

    public void setIdStatut2(Integer idStatut2) {
        this.idStatut2 = idStatut2;
    }

    public Double getDT() {
        return DT;
    }

    public void setDT(Double dT) {
        DT = dT;
    }

    public String getAlerte() {
        return alerte;
    }

    public void setAlerte(String alerte) {
        this.alerte = alerte;
    }

}