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
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "password")
    private String password;

    @OneToMany(mappedBy = "user")
    private List<DemandeStatut> demandeStatutes = new ArrayList<>();

    public User() {

    }

    public User(String nom, String password) {
        this.nom = nom;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<DemandeStatut> getDemandeStatutes() {
        return demandeStatutes;
    }

    public void setDemandeStatutes(List<DemandeStatut> demandeStatutes) {
        this.demandeStatutes = demandeStatutes;
    }


}
