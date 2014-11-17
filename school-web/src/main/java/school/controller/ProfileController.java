package school.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import school.service.UserService;

@Controller
public class ProfileController {
	
	@Inject
	UserService userService;
	
	@RequestMapping("profile")
	public String loadProfile(){
		userService.test403();
		return "home";
	}

}
