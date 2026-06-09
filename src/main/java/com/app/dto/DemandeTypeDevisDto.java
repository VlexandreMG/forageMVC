package com.app.dto;

import java.util.List;

import com.app.model.Demande;
import com.app.model.TypeDevis;

public class DemandeTypeDevisDto {
    private Integer id;
    private String client;
    private String commune;
    private String statutActuel;
    private String date;
    private String lieu;
    private List<TypeDevisDto> typesDevis;

    public DemandeTypeDevisDto(Demande demande, List<TypeDevis> typesDevis) {
        this.id = demande.getId();
        this.statutActuel = demande.getCurrentStatut().getStatut().getLibelle();
        this.date = demande.getCurrentStatut().getDate().toString();
        this.client = demande.getClient().getNom() + " " + demande.getClient().getPrenom();
        this.commune = demande.getCommune().getLibelle();
        this.lieu = demande.getLieu();
        this.typesDevis = typesDevis.stream().map(TypeDevisDto::new).toList();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getCommune() {
        return commune;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public List<TypeDevisDto> getTypesDevis() {
        return typesDevis;
    }

    public void setTypesDevis(List<TypeDevisDto> typesDevis) {
        this.typesDevis = typesDevis;
    }

    public String getStatutActuel() {
        return statutActuel;
    }

    public void setStatutActuel(String statutActuel) {
        this.statutActuel = statutActuel;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
