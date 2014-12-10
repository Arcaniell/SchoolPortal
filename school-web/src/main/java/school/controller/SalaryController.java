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
import school.service.utils.DateUtil;

@Controller
public class SalaryController {
	private final String PAYROLL = "payrolls";
	private final int THREE_MONTHS_IN_DAYS = 90;
	private final boolean FORWARD_TRUE = true;
	private final boolean FORWARD_FALSE = false;
	private final String DATE_FROM = "dateFrom";
	private final String DATE_UNTIL = "dateUntil";
	private final String SALARIES = "salaries";
	private final String CURRENT = "current";
	private final String CURRENT_MONTH = "currentMonth";
	private final String COURSES = "courses";
	private final String INPUT_DATE_FROM = "dateFrom";
	private final String INPUT_DATE_UNTIL = "dateUntil";
	private final String CURRENT_PAGE_HISTORY = "history";
	private final String CURRENT_PAGE_SALARY = "salary";
	private final String CURRENT_PAGE_PAYROLL = "payroll";
	private final String JSP_SALARY_HISTORY = "salary-history";
	private final String JSP_SALARY_CURRENT = "salary-current";
	private final String JSP_SALARY_PAYROLL = "salary-payroll";
	private final String JSP_SALARY_PAYROLL_CONFIRMED = "salary-payrollConfirmed";
	private final String INPUT_ADDITIONAL_PAY_ARRAY = "inputArray";
	private final String URL_SALARY_HISTORY = "/history";
	private final String URL_SALARY_CURRENT = "/salary";
	private final String URL_SALARY_PAYROLL = "/payroll";
	private final String URL_SALARY_PAYROLL_CONFIRMED = "/payrollConfirm";
	
	private SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");

	@Autowired
	private SalaryService salaryService;

	@RequestMapping(value = URL_SALARY_HISTORY)
	public String getSalaryHistory(
			@RequestParam(value = INPUT_DATE_FROM, required = false) String dateFrom,
			@RequestParam(value = INPUT_DATE_UNTIL, required = false) String dateUntil,
			Model model, HttpServletRequest request, Principal principal) {
		if ((principal == null || request.isUserInRole(Role.Secured.TEACHER) || request.isUserInRole(Role.Secured.HEAD_TEACHER)) != true) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}
			Date from = DateUtil.dateProceed(dateFrom, formatterDate,
					THREE_MONTHS_IN_DAYS, FORWARD_TRUE);
			Date until = DateUtil.dateProceed(dateUntil, formatterDate,
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
			model.addAttribute(CURRENT, CURRENT_PAGE_HISTORY);
			return JSP_SALARY_HISTORY;
	}

	@RequestMapping(value = URL_SALARY_CURRENT)
	public String getCurrent(Model model, HttpServletRequest request,
			Principal principal) throws ParseException {
		if ((principal == null || request.isUserInRole(Role.Secured.TEACHER) || request.isUserInRole(Role.Secured.HEAD_TEACHER)) != true) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}
		SalaryDTO salary = salaryService.getCurrentMonthInfo(principal);
		List<SalaryCourseDTO> courses = salaryService
				.getCourseOfTeacherInfo(principal);
		model.addAttribute(CURRENT_MONTH, salary);
		model.addAttribute(COURSES, courses);
		model.addAttribute(CURRENT, CURRENT_PAGE_SALARY);
		return JSP_SALARY_CURRENT;
	}
	
	@RequestMapping(value = URL_SALARY_PAYROLL)
	public String getPayrollInfo(Model model, HttpServletRequest request,
			Principal principal) throws ParseException {
		if ((principal == null || request.isUserInRole(Role.Secured.DIRECTOR) != true)) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}
		List<SalaryPayrollDTO> payrolls = salaryService.getPayrollInfo();
		model.addAttribute(PAYROLL, payrolls);
		model.addAttribute(CURRENT, CURRENT_PAGE_PAYROLL);
		return JSP_SALARY_PAYROLL;
	}
	
	@RequestMapping(value = URL_SALARY_PAYROLL_CONFIRMED)
	public String payrollConfirmed(Model model, HttpServletRequest request,
			Principal principal) throws ParseException {
		if (principal == null
				|| request.isUserInRole(Role.Secured.DIRECTOR) != true) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}
		String[] additionalPay = request.getParameterValues(INPUT_ADDITIONAL_PAY_ARRAY);
		salaryService.addSalary(additionalPay);
		return JSP_SALARY_PAYROLL_CONFIRMED;
	}
}
