package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.SalaryDTO;
import school.model.Role;
import school.service.SalaryService;
import school.service.utils.DateUtil;

@Controller
public class SalaryController {
	private final int THREE_MONTHS_IN_DAYS = 90;
	private final boolean FORWARD_TRUE = true;
	private final boolean FORWARD_FALSE = false;
	SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");

	@Autowired
	private SalaryService salaryService;

	@RequestMapping(value = "/history")
	public String getSalary(
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateUntil", required = false) String dateUntil,
			Model model, HttpServletRequest request, Principal user) {
		if (user == null) {
			return "redirect:/login";
		}
		if (request.isUserInRole(Role.Secured.TEACHER)) {
			Date from = DateUtil.dateProceed(dateFrom, formatterDate,
					THREE_MONTHS_IN_DAYS, FORWARD_TRUE);
			Date until = DateUtil.dateProceed(dateUntil, formatterDate,
					0, FORWARD_FALSE);
			if (from.after(until)) {
				Date swap = from;
				from = until;
				until = swap;
			}
			List<SalaryDTO> list = salaryService.getHistoryInfo(user, from,
					until);
			model.addAttribute("dateFrom", formatterDate.format(from));
			model.addAttribute("dateUntil", formatterDate.format(until));
			model.addAttribute("salaries", list);
			model.addAttribute("current", "salary");
			return "salary-history";
		}
		return "redirect:/login";
	}

	@RequestMapping(value = "/salary")
	public String getCurrent(Model model, HttpServletRequest request,
			Principal user) throws ParseException {
		if (request.isUserInRole(Role.Secured.TEACHER)) {
			if (user == null) {
				return "redirect:/login";
			}
			SalaryDTO salary = salaryService.getCurrentMonthInfo(user);
			model.addAttribute("currentMonth", salary);
			model.addAttribute("current", "salary");
			return "salary-current";
		}
		return "redirect:/login";
	}
}
