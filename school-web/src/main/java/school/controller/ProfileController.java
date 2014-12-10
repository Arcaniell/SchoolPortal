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

	private static final String PROFILE_INFORMATION_PAGE = "profile_information";
	private static final String URL_PROFILE = "/profile";
	private static final String PROFILE = "profile";
	private static final String URL_PROFILE_INFORMATION = "profile/information";
	private static final String URL_PHOTO_ID = "/photo/{id}";
	private static final String URL_PROFILE_UPLOAD_AVATAR = "profile/upload_avatar";
	@Inject
	ProfileService profileService;
	@Inject
	UserService userService;

	@RequestMapping(value = URL_PHOTO_ID, method = RequestMethod.GET)
	public @ResponseBody byte[] getPhoto(@PathVariable String id,
			HttpServletRequest request) {
		/* Local service method */
		return userService.getAvatar(id, request.getServletContext()
				.getRealPath(""));
		/* OpenShift service method */
		// return userService.getAvatar(id);
	}

	@RequestMapping(value = URL_PROFILE_INFORMATION)
	public String profileInformation(Model model,
			@RequestParam(value = "id") Long id) {
		model.addAttribute(PROFILE, profileService.loadProfile(id));
		return PROFILE_INFORMATION_PAGE;
	}

	@RequestMapping(value = URL_PROFILE)
	public String profile(Model model, Principal principal) {
		if (principal == null) {
			return "redirect:/login";
		}
		model.addAttribute(PROFILE,
				profileService.loadProfile(Long.parseLong(principal.getName())));
		return PROFILE;
	}

	@RequestMapping(value = URL_PROFILE_UPLOAD_AVATAR, method = RequestMethod.POST)
	public String profileUploadAvatar(HttpServletRequest request,
			Principal principal, Model model,
			@ModelAttribute("file") UploadedFile uploadedFile) {
		if (principal == null) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}
		/* Local service method */
		userService.setAvatar(Long.parseLong(principal.getName()), uploadedFile
				.getFile(), request.getServletContext().getRealPath(""));
		/* OpenShift service method */
		// userService.setAvatar(Long.parseLong(principal.getName()),
		// uploadedFile.getFile());

		return URLContainer.URL_REDIRECT + URL_PROFILE;
	}

}
