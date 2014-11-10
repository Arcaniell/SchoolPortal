package school.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import school.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	@RequestMapping(value="home")
	public String index(Model model){
		model.addAttribute("newsList", homeService.findAllNews());
		return "home";
	}

}
