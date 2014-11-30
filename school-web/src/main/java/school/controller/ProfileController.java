package school.controller;


import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.service.ProfileService;
import school.service.UserService;
import school.service.utils.UploadedFile;

@Controller
public class ProfileController {

	@Inject
	ProfileService profileService;
	@Inject
	UserService userService;
	
	@RequestMapping(value = "/photo/{photo}", method = RequestMethod.GET)
	public @ResponseBody byte[] getPhoto(@PathVariable String photo, HttpServletRequest request) {
//		return userService.getAvatar(photo, request.getServletContext().getRealPath(""));
		return userService.getAvatar(photo);
	}


	@RequestMapping(value = "profile/information")
	public String profileInformation(Model model,
			@RequestParam(value = "id") Long id) {
		model.addAttribute("profile", profileService.loadProfile(id));
		return "profile_information";
	}

	@RequestMapping(value = "profile")
	public String profile(Model model, Principal principal) {
		if (principal == null) {
			return "redirect:/login";
		}
		model.addAttribute("profile",
				profileService.loadProfile(Long.parseLong(principal.getName())));
		return "profile";
	}

	
	@RequestMapping(value = "profile/upload_avatar", method = RequestMethod.POST)
	public String profileUploadAvatar(HttpServletRequest request,
			Principal principal, Model model,
			@ModelAttribute("file") UploadedFile uploadedFile) {
		if (principal == null) {
			return "redirect:/login";
		}
//		userService.setAvatar(Long.parseLong(principal.getName()), uploadedFile.getFile(), request.getServletContext().getRealPath(""));
		userService.setAvatar(Long.parseLong(principal.getName()), uploadedFile.getFile());
		
		return "redirect:/profile";
	}
	
	
}
