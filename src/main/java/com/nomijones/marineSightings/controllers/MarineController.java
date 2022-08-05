package com.nomijones.marineSightings.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.nomijones.marineSightings.models.LoginUser;
import com.nomijones.marineSightings.models.Sighting;
import com.nomijones.marineSightings.models.User;
import com.nomijones.marineSightings.services.SightingService;
import com.nomijones.marineSightings.services.UserService;

@Controller
public class MarineController {
	
	@Autowired
	private UserService users;
	@Autowired
	private SightingService sightings;
	
//START OF LOGIN AND REGISTRATION
	@GetMapping("/")
	public String index(Model model) {
		
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	User user = users.register(newUser, result);
    	
        
        if(result.hasErrors()) {

            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        User user = users.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
//END OF LOGIN AND REGISTRATION
    
//START OF DASHBOARD
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		model.addAttribute("sightings", sightings.all());
		model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
		return "home.jsp";
		}
//END OF DASHBOARD
    
//START OF ADD PAGE
	@GetMapping("/addPage")
	public String addPage(@ModelAttribute("sighting") Sighting sighting, Model model, HttpSession session) {
		
		User user = users.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		
		return "addPage.jsp";
	}
	@PostMapping("/sightings")
	public String createSighting(@Valid @ModelAttribute("sighting") Sighting sighting, BindingResult result) {
	
		if (result.hasErrors()) {
			return "addPage.jsp";
		}
		
		sightings.create(sighting);
		
		return "redirect:/home";
	}
//END OF ADD PAGE
	
//START OF EDITPAGE and SHOWPAGE
    @GetMapping("/sightings/{id}/edit")
    public String editPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	Sighting sighting = sightings.findById(id);
    	model.addAttribute("sighting", sighting);
    	
    	return "editPage.jsp";
    }
    
    @GetMapping("/sightings/{id}")
    public String showPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Sighting sighting = sightings.findById(id);
    	model.addAttribute("sighting", sighting);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "sighting.jsp";
    }
    @PutMapping("/sightings/{id}")
    public String updateSighting(@Valid @ModelAttribute("sighting") Sighting sighting, BindingResult result, Model model) {
    	
    	if (result.hasErrors()) {
    		return "editPage.jsp";
    	}
    	
    	System.out.println("Sighting to be saved to DB: " + sighting.getId());

        sightings.update(sighting);
        
    	
    	return "redirect:/home";
    }
    
    
//START OF DELETE METHOD
    @DeleteMapping("/sightings/{id}")
    public String deleteSighting(@Valid @ModelAttribute("sighting") Sighting sighting, BindingResult result, Model model) {

        sightings.delete(sighting);

    	return "redirect:/home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
	
}

