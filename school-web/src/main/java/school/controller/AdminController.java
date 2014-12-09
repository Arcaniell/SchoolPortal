package school.controller;

import java.security.Principal;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.service.AdminService;

@Controller
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	@RequestMapping(value = "admin")
	public String index(Model model, Principal principal) {
		model.addAttribute("role_requsts", adminService.findAllNotConfirmedRoleRequests());
		return "admin";
	}

	@RequestMapping(value = "/role_confirmation", method = RequestMethod.GET)
	public String roleRequestInfo(Model model, @RequestParam(value = "id") long id) {
				model.addAttribute("role_request", adminService.findRoleRequest(id));
		return "role_confirmation";
	}
	
	@RequestMapping(value = "/confirm_role", method = RequestMethod.GET)
	public @ResponseBody boolean check(@RequestParam(value = "roleRequestId") long roleRequestId,
			@RequestParam(value = "studentId") long studentId) {
		return adminService.addRoleToUser(roleRequestId, studentId);
	}
}
