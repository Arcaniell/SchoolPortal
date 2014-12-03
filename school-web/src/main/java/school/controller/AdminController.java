package school.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "admin")
	public String index(Model model, Principal principal) {
//		model.addAttribute("newsList", homeService.findAllNews());
//		HttpSession session = request.getSession(false);
//		if (principal != null && session.getAttribute("user_name") == null){
//			User user = userService.loadUser(Integer.parseInt(principal.getName()));
//			session.setAttribute("user_name", user.getFirstName() + " " +user.getLastName());
//			long userId = Long.valueOf(principal.getName());
//			int newMessages = messagesService.countOfNewMessages(userId);
//			session.setAttribute("newMessages", newMessages);
//		}
		return "admin";
	}

}
