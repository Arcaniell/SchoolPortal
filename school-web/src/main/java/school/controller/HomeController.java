package school.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.RegistrationDTO;
import school.model.RegistrationData;
import school.model.User;
import school.service.HomeService;
import school.service.MessagesService;
import school.service.UserService;

@Controller
public class HomeController {

	private static final String ROOT_ACTION = "root_action";
	private static final String VISIBLE_FORBIDEN = "visible_forbiden";
	private static final String NEW_MESSAGES = "newMessages";
	private static final String USER_NAME = "user_name";
	private static final String NEWS_LIST = "newsList";
	private static final String HOME_PAGE = "home";
	private static final String SIGNINFAILURE_PAGE = "signinfailure";
	private static final String REGISTRATION_GROUPS_PAGE = "registration_groups";
	@Autowired
	private HomeService homeService;
	@Autowired
	private UserService userService;
	@Autowired
	private MessagesService messagesService;

	@RequestMapping(value = URLContainer.URL_HOME)
	public String index(Model model, Principal principal,
			HttpServletRequest request) {
		model.addAttribute(NEWS_LIST, homeService.findAllNews());
		HttpSession session = request.getSession(false);
		if (principal != null && session.getAttribute(USER_NAME) == null) {
			User user = userService.loadUser(Integer.parseInt(principal
					.getName()));
			session.setAttribute(USER_NAME,
					user.getFirstName() + " " + user.getLastName());
			long userId = Long.valueOf(principal.getName());
			int newMessages = messagesService.countOfNewMessages(userId);
			session.setAttribute(NEW_MESSAGES, newMessages);
		}
		return HOME_PAGE;
	}

	@RequestMapping(value = URLContainer.URL_LOGIN, method = RequestMethod.GET)
	public String logIn(Model model) {
		model.addAttribute(NEWS_LIST, homeService.findAllNews());
		model.addAttribute(VISIBLE_FORBIDEN, VISIBLE_FORBIDEN);
		return SIGNINFAILURE_PAGE;
	}

	@RequestMapping(value = URLContainer.URL_SIGNIN_FAILURE, method = RequestMethod.GET)
	public String signinFailure(Model model) {
		model.addAttribute(NEWS_LIST, homeService.findAllNews());
		model.addAttribute(SIGNINFAILURE_PAGE, SIGNINFAILURE_PAGE);
		return SIGNINFAILURE_PAGE;
	}

	@RequestMapping(value = URLContainer.URL_REGISTRATION, method = RequestMethod.GET)
	public String registrationConfirm(Model model,
			@ModelAttribute(value = "u") long userId,
			@ModelAttribute(value = "c") int code) {
		User user = homeService.confirmUser(userId, code);
		model.addAttribute(NEWS_LIST, homeService.findAllNews());
		model.addAttribute(ROOT_ACTION, "../");
		if (user != null)
			model.addAttribute("user_email", user.getEmail());
		return SIGNINFAILURE_PAGE;
	}

	@RequestMapping(value = URLContainer.URL_FORGOTPASSWORD, method = RequestMethod.GET)
	public String forgotpasswordConfirm(Model model,
			@ModelAttribute(value = "u") long userId,
			@ModelAttribute(value = "c") int code) {
		User user = homeService.confirmPassword(userId, code);
		model.addAttribute(NEWS_LIST, homeService.findAllNews());
		model.addAttribute(ROOT_ACTION, "../");
		if (user != null)
			model.addAttribute("user_email", user.getEmail());
		return SIGNINFAILURE_PAGE;
	}

	@RequestMapping(value = URLContainer.URL_FORGOTPASSWORD, method = RequestMethod.POST)
	public @ResponseBody boolean forgotpassword(
			@RequestBody RegistrationData registrationData,
			HttpServletRequest request) {
		return homeService.forgotAPassword(registrationData,
				request.getContextPath());
	}

	@RequestMapping(value = URLContainer.URL_REGISTRATION, method = RequestMethod.POST)
	public @ResponseBody boolean registration(
			@RequestBody RegistrationDTO registrationDTO,
			HttpServletRequest request) {
		return homeService.registrateUser(registrationDTO,
				request.getContextPath());
	}

	@RequestMapping(value = URLContainer.URL_EMAIL_CHECK, method = RequestMethod.GET)
	public @ResponseBody boolean check(
			@RequestParam(value = "email") String email) {
		return userService.isEmailAviable(email);
	}

	@RequestMapping(value = URLContainer.URL_REGISTRATION_GROUPS)
	public String profile(Model model) {
		model.addAttribute("groups", homeService.findAllNotAdditionalGroups());
		return REGISTRATION_GROUPS_PAGE;
	}

}
