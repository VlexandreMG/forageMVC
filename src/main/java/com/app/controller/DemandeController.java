package com.app.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import com.app.dto.DemandeTypeDevisDto;
import com.app.dto.AlertesDto;
import com.app.model.Client;
import com.app.model.Demande;
import com.app.model.Region;
import com.app.model.TypeDevis;
import com.app.model.User;
import com.app.repository.ClientRepository;
import com.app.repository.CommuneRepository;
import com.app.service.DemandeService;
import com.app.service.DevisService;

import com.app.service.ClientService;
import com.app.service.RegionService;
import com.app.service.DistrictService;
import com.app.service.CommuneService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DemandeController {

    @Autowired
    private DemandeService demandeService;

    @Autowired
    private DevisService devisService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private RegionService regionService;

    @Autowired
    private DistrictService districtService;

    @Autowired
    private CommuneService communeService;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private CommuneRepository communeRepository;

    @GetMapping("/demande/form")
    public String showFormLogin(Model model) {

        List<Client> clients = clientService.getAllClients();
        List<Region> regions = regionService.getAllRegions();
        model.addAttribute("clients", clients);
        model.addAttribute("regions", regions);

        return "formDemande";
    }

    @PostMapping("/demande/save")
    public String addDemande(@RequestParam("lieu") String lieu,
            @RequestParam("observation") String observation,
            @RequestParam("idClient") Integer idClient, @RequestParam("idCommune") Integer idCommune,
            @RequestParam("date") LocalDateTime date,
            HttpSession session) {

        User user = (User) session.getAttribute("user");

        Demande demande = new Demande();
        demande.setLieu(lieu);
        demande.setClient(clientRepository.findById(idClient).orElse(null));
        demande.setCommune(communeRepository.findById(idCommune).orElse(null));

        demandeService.saveDemande(demande, observation, user, date);

        return "redirect:/listDemande";
    }

    @GetMapping("/listDemande")
    public String listDemande(Model model) {

        List<Demande> demandes = demandeService.getAllDemandes();
        model.addAttribute("demandes", demandes);

        return "listDemande";
    }

    @GetMapping("/demande/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        demandeService.delete(id);
        return "redirect:/listDemande";

    }

    @GetMapping("/demande/formUpdate/{id}")
    public String formUpdate(@PathVariable("id") Integer id, Model model) {

        Demande demande = demandeService.findById(id);

        model.addAttribute("demande", demande);

        model.addAttribute("clients",
                clientService.getAllClients());

        model.addAttribute("regions",
                regionService.getAllRegions());

        model.addAttribute("districts",
                districtService.getDistrictsByRegionId(
                        demande.getCommune()
                                .getDistrict()
                                .getRegion()
                                .getId()));

        model.addAttribute("communes",
                communeService.getCommunesByDistrictId(
                        demande.getCommune()
                                .getDistrict()
                                .getId()));

        return "formModification";
    }

    @PostMapping("/demande/update")
    public String update(
            @RequestParam("id") Integer id,
            @RequestParam("idClient") Integer idClient,
            @RequestParam("idCommune") Integer idCommune,
            @RequestParam("lieu") String lieu,
            @RequestParam("observation") String observation,
            @RequestParam("date") LocalDateTime date,
            @RequestParam("idStatut") Integer idStatut,
            HttpSession session) {

        User user = (User) session.getAttribute("user");

        demandeService.updateDemande(
                id,
                idClient,
                idCommune,
                lieu,
                observation,
                date,
                user,
                idStatut);

        return "redirect:/listDemande";
    }

    @GetMapping("/demande/detailsTypeDevis/{id}")
    @ResponseBody
    public DemandeTypeDevisDto getWithTypeDevis(@PathVariable Integer id) {
        Demande demande = demandeService.findById(id);
        List<TypeDevis> typesDevis = devisService.getCreatableTypesForDemande(demande);

        DemandeTypeDevisDto dtd = new DemandeTypeDevisDto(demande, typesDevis);
        return dtd;
    }

    @GetMapping("/api/alertes/{id}")
    @ResponseBody
    public List<AlertesDto> getAlertes(@PathVariable Integer id) {
        return demandeService.getAlertes(id);
    }
}