package com.app.dto;

import com.app.model.Parametres;

public class AlertesDto {

    private Integer idStatut1;
    private Integer idStatut2;
    private Double DT;
    private String alerte;

    public AlertesDto(Parametres parametres, Double DT) {
        this.idStatut1 = parametres.getIdStatut1();
        this.idStatut2 = parametres.getIdStatut2();
        this.alerte = parametres.getAlerte();
        this.DT = DT;
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
