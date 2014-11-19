package school.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.SalaryDTO;
import school.service.SalaryService;

@Controller
public class SalaryController {
	private final int TWO_MONTHS_IN_DAYS = 60;
	private final boolean FORWARD_TRUE = true;
	private final boolean FORWARD_FALSE = false;
	SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");

	@Autowired
	private SalaryService salaryService;

	@RequestMapping(value = "/salary")
	public String getSalary(
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateUntil", required = false) String dateUntil,
			Model model, HttpServletRequest request, Principal user) {
		if (user == null) {
			return "redirect:/login";
		}
		Date from = ControllersUtil.dateProceed(dateFrom, formatterDate,
				TWO_MONTHS_IN_DAYS, FORWARD_TRUE);
		Date until = ControllersUtil.dateProceed(dateUntil, formatterDate,
				TWO_MONTHS_IN_DAYS, FORWARD_FALSE);
		if (from.after(until)) {
			Date swap = from;
			from = until;
			until = swap;
		}
		List <SalaryDTO> list = salaryService.getHistoryInfo(user, from, until);
		 model.addAttribute("dateFrom", formatterDate.format(from));
         model.addAttribute("dateUntil", formatterDate.format(until));
         model.addAttribute("salaries", list);
         return "salary-history";
	}
}
