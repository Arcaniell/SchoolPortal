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
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.SalaryCourseDTO;
import school.dto.SalaryDTO;
import school.dto.SalaryHistoryDTO;
import school.dto.SalaryPayrollDTO;
import school.model.Role;
import school.service.SalaryService;

@Controller
public class SalaryController {
	private static final String PAYROLL = "payrolls";
	private static final int THREE_MONTHS_IN_DAYS = 90;
	private static final boolean FORWARD_TRUE = true;
	private static final boolean FORWARD_FALSE = false;
	private static final String DATE_FROM = "dateFrom";
	private static final String DATE_UNTIL = "dateUntil";
	private static final String SALARIES = "salaries";
	private static final String CURRENT = "current";
	private static final String CURRENT_MONTH = "currentMonth";
	private static final String COURSES = "courses";
	private SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");

	@Autowired
	private SalaryService salaryService;

	@RequestMapping(value = "/history")
	public String getSalaryHistory(
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateUntil", required = false) String dateUntil,
			Model model, HttpServletRequest request, Principal principal) {
		if ((principal == null || request.isUserInRole(Role.Secured.TEACHER) != true)) {
			return ControllersUtil.URL_REDIRECT + ControllersUtil.URL_LOGIN;
		}
			Date from = ControllersUtil.dateProceed(dateFrom, formatterDate,
					THREE_MONTHS_IN_DAYS, FORWARD_TRUE);
			Date until = ControllersUtil.dateProceed(dateUntil, formatterDate,
					0, FORWARD_FALSE);
			if (from.after(until)) {
				Date swap = from;
				from = until;
				until = swap;
			}
			List<SalaryHistoryDTO> list = salaryService.getHistoryInfo(
					principal, from, until);
			model.addAttribute(DATE_FROM, formatterDate.format(from));
			model.addAttribute(DATE_UNTIL, formatterDate.format(until));
			model.addAttribute(SALARIES, list);
			model.addAttribute(CURRENT, "history");
			return "salary-history";
	}

	@RequestMapping(value = "/salary")
	public String getCurrent(Model model, HttpServletRequest request,
			Principal principal) throws ParseException {
		if ((principal == null || request.isUserInRole(Role.Secured.TEACHER) != true)) {
			return ControllersUtil.URL_REDIRECT + ControllersUtil.URL_LOGIN;
		}
		SalaryDTO salary = salaryService.getCurrentMonthInfo(principal);
		List<SalaryCourseDTO> courses = salaryService
				.getCourseOfTeacherInfo(principal);
		model.addAttribute(CURRENT_MONTH, salary);
		model.addAttribute(COURSES, courses);
		model.addAttribute(CURRENT, "salary");
		return "salary-current";
	}
	
	@RequestMapping(value = "/payroll")
	public String getPayrollInfo(Model model, HttpServletRequest request,
			Principal principal) throws ParseException {
		if ((principal == null || request.isUserInRole(Role.Secured.DIRECTOR) != true)) {
			return ControllersUtil.URL_REDIRECT + ControllersUtil.URL_LOGIN;
		}
		List<SalaryPayrollDTO> payrolls = salaryService.getPayrollInfo();
		model.addAttribute(PAYROLL, payrolls);
		model.addAttribute(CURRENT, "payroll");
		return "salary-payroll";
	}
	
	@RequestMapping(value = "/payrollConfirm")
	public String payrollConfirmed(Model model, HttpServletRequest request,
			Principal principal) throws ParseException {
		if (principal == null
				|| request.isUserInRole(Role.Secured.DIRECTOR) != true) {
			return ControllersUtil.URL_REDIRECT + ControllersUtil.URL_LOGIN;
		}
		String[] additionalPay = request.getParameterValues("inputArray");
		salaryService.addSalary(additionalPay);
		return "salary-payrollConfirmed";
	}
}
