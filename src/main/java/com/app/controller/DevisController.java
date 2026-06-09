package com.app.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.model.Demande;
import com.app.model.Devis;
import com.app.model.User;
import com.app.service.DevisService;
import com.app.service.DemandeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DevisController {

    private final DevisService devisService;
    private final DemandeService demandeService;

    public DevisController(DevisService devisService, DemandeService demandeService) {
        this.devisService = devisService;
        this.demandeService = demandeService;

    }

    @GetMapping("/devis/formDevis")
    public String formDevis(Model model) {

        List<Demande> demandes = demandeService.getAllDemandes();
        model.addAttribute("demandes", demandes);
        model.addAttribute("isCreateForm", true);

        return "formDevis";
    }

    @PostMapping("/devis/create")
    public String createDevis(@ModelAttribute Devis devis, HttpSession session,
            @RequestParam("date") LocalDateTime date) {

        User user = (User) session.getAttribute("user");

        devisService.createDevis(devis, user, date);

        return "redirect:/devis/listDevis";
    }

    // @GetMapping(path = "/devis/showFormEdit/{id}")
    // public String showEditForm(Model model, @PathVariable Long id) {
    // // Devis devis = devisService.getById(id);
    // // devis.getDetails().size();
    // model.addAttribute("isCreateForm", false);
    // // model.addAttribute("devis", devis);
    // // model.addAttribute("typesDemandes",
    // // devisService.getCreatableTypesForDemande(devis.getDemande()));
    // return "formDevis";
    // }

    @PostMapping(path = "/devis/edit/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Devis devis) {
        // devisService.update(devis);
        return "redirect:/devis/listDevis";
    }

    @GetMapping("/devis/listDevis")
    public String listDevis(Model model) {

        model.addAttribute("devis", devisService.getListDevis());

        return "listDevis";
    }

    // @GetMapping("/devis/accepter/{id}")
    // public String accepterDevis(
    // @PathVariable("id") Integer id,
    // HttpSession session) {

    // User user = (User) session.getAttribute("user");

    // return "redirect:/devis/details/" + id;
    // }

    // @GetMapping("/devis/refuser/{id}")
    // public String refuserDevis(
    // @PathVariable("id") Integer id,
    // HttpSession session) {

    // User user = (User) session.getAttribute("user");

    // return "redirect:/devis/details/" + id;
    // }

}