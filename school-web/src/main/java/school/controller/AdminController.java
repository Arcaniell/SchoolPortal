package school.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.service.AdminService;

@Controller
public class AdminController {

	private static final String ROLE_REQUEST = "role_request";
	private static final String ROLE_REQUSTS = "role_requsts";
	private static final String URL_CONFIRM_ROLE = "/confirm_role";
	private static final String URL_ROLE_CONFIRMATION = "/role_confirmation";
	private static final String URL_ADMIN = "admin";
	@Autowired
	AdminService adminService;

	@RequestMapping(value = URL_ADMIN)
	public String index(Model model, Principal principal) {
		model.addAttribute(ROLE_REQUSTS,
				adminService.findAllNotConfirmedRoleRequests());
		return URL_ADMIN;
	}

	@RequestMapping(value = URL_ROLE_CONFIRMATION, method = RequestMethod.GET)
	public String roleRequestInfo(Model model,
			@RequestParam(value = "id") long id) {
		model.addAttribute(ROLE_REQUEST, adminService.findRoleRequest(id));
		return "role_confirmation";
	}

	@RequestMapping(value = URL_CONFIRM_ROLE, method = RequestMethod.GET)
	public @ResponseBody boolean check(
			@RequestParam(value = "roleRequestId") long roleRequestId,
			@RequestParam(value = "studentId") long studentId) {
		return adminService.addRoleToUser(roleRequestId, studentId);
	}
}
