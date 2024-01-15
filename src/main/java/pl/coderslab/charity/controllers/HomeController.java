package pl.coderslab.charity.controllers;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.entities.Category;
import pl.coderslab.charity.entities.Donation;
import pl.coderslab.charity.entities.Institution;
import pl.coderslab.charity.repositories.CategoryRepository;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.time.LocalDate;
import java.time.LocalTime;
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
    @RequestMapping("/form")
    public String formAction(Model model){
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "form/form";
    }
    @RequestMapping("/form/confirm")
    public String formActionConfirmed(@RequestParam String street,
                                      @RequestParam String city,
                                      @RequestParam String zipCode,
                                      @RequestParam Integer quantity,
                                      @RequestParam String phone,
                                      @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate pickUpDate,
                                      @RequestParam LocalTime pickUpTime,
                                      @RequestParam String pickUpComment,
                                      @RequestParam List<Category> categories,
                                      @RequestParam String institutionName){
        Donation donation = new Donation();
        Institution institution = institutionRepository.findInstitutionByName(institutionName);
        donation.setStreet(street);
        donation.setCity(city);
        donation.setZipCode(zipCode);
        donation.setQuantity(quantity);
//        donation.setPhone(phone);
        donation.setPickUpDate(pickUpDate);
        donation.setPickUpTime(pickUpTime);
        donation.setPickUpComment(pickUpComment);
        donation.setCategories(categories);
        donation.setInstitution(institution);
        donationRepository.save(donation);
        return "redirect:/form";
    }
}
