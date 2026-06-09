package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.app.model.Demande;
import com.app.model.User;
import com.app.service.DemandeService;
import com.app.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private DemandeService demandeService;

    @GetMapping("/")
    public String showFormLogin(Model model) {

        return "formLogin";
    }

    @PostMapping("/connexion")
    public String login(@RequestParam("nom") String nom, @RequestParam("password") String password, Model model,
            HttpSession session) {

        User user = userService.findbyNomandPassword(nom, password);
        if (user == null) {
            model.addAttribute("error", "Nom ou mot de passe incorrect");
            return "formLogin";
        }
        List<Demande> demandes = demandeService.getAllDemandes();
        model.addAttribute("demandes", demandes);
        session.setAttribute("user", user);
        return "listDemande";
    }
}
