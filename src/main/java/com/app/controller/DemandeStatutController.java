package com.app.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.model.Demande;
import com.app.model.DemandeStatut;
import com.app.model.Statut;
import com.app.model.User;
import com.app.repository.DemandeStatutRepository;
import com.app.service.DemandeService;
import com.app.service.DemandeStatutService;
import com.app.service.StatutService;
import jakarta.servlet.http.HttpSession;

@Controller
public class DemandeStatutController {

    @Autowired
    private DemandeStatutService demandeStatutService;
    @Autowired
    private DemandeService demandeService;
    @Autowired
    private StatutService statutService;
    @Autowired
    private DemandeStatutRepository demandeStatutRepository;

    @GetMapping("/formUpdateStatut")
    public String formUpdateStatut(Model model) {

        List<Demande> demandes = demandeService.getAllDemandes();
        List<Statut> statuts = statutService.getAllStatut();

        model.addAttribute("demandes", demandes);
        model.addAttribute("statuts", statuts);
        model.addAttribute("createForm", true);

        return "updateStatut";
    }

    @PostMapping("statut/update")
    public String updateStatut(@ModelAttribute DemandeStatut demandeStatut, HttpSession session) {

        User user = (User) session.getAttribute("user");
        Integer id = demandeStatut.getDemande().getId();
        LocalDateTime oldDate = demandeService.getCurrentStatut(id).getDate();
        LocalDateTime newDate = demandeStatut.getDate();
        double DT = demandeStatutService.DtMinute(oldDate, newDate);
        demandeStatut.setDT(DT);

        demandeStatutService.addDemandeStatut(demandeStatut, user);
        return "redirect:/formUpdateStatut";
    }

    @GetMapping("/statut/listStatut")
    public String getListStatut(Model model) {

        List<DemandeStatut> demandeStatut = demandeStatutRepository.findAll();

        model.addAttribute("demandeStatut", demandeStatut);

        return "listeStatut";
    }

    @GetMapping("/statut/showFormEdit/{id}")
    public String showEditForm(Model model, @PathVariable Integer id) {

        DemandeStatut demandeStatut = demandeStatutService.findById(id);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        List<Demande> demandes = demandeService.getAllDemandes();
        List<Statut> statuts = statutService.getAllStatut();

        model.addAttribute("demandes", demandes);
        model.addAttribute("statuts", statuts);
        model.addAttribute("dateFormatee", demandeStatut.getDate().format(formatter));
        model.addAttribute("createForm", false);
        model.addAttribute("demandeStatut", demandeStatut);

        return "updateStatut";
    }

    @PostMapping("/statut/edit")
    public String editStatut(@ModelAttribute DemandeStatut demandeStatut) {

        demandeStatutService.editAndRecalculate(demandeStatut);

        return "redirect:/statut/showFormEdit/" + demandeStatut.getId();
    }

}