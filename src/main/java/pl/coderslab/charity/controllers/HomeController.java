package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entities.Donation;
import pl.coderslab.charity.entities.Institution;
import pl.coderslab.charity.repositories.CategoryRepository;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.util.ArrayList;
import java.util.List;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, CategoryRepository categoryRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model){
        List<Donation> donations = donationRepository.findAll();
        List<Institution> institutions = institutionRepository.findAll();
        List<Institution> evenInstitutions = new ArrayList<>();
        List<Institution> oddInstitutions = new ArrayList<>();
        for (int i = 0; i < institutions.size(); i++) {
            if (i % 2 == 0){
                evenInstitutions.add(institutions.get(i));
            }else {
                oddInstitutions.add(institutions.get(i));
            }
        }
        model.addAttribute("evenInstitutions", evenInstitutions);
        model.addAttribute("oddInstitutions", oddInstitutions);
        model.addAttribute("countQuantity", donationRepository.countQuantity());
        model.addAttribute("countDonations", donationRepository.countDonations());
        return "index";
    }
}
