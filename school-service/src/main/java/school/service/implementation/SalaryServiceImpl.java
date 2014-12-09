package school.service.implementation;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.SalaryDao;
import school.dao.TeacherDao;
import school.dto.SalaryCourseDTO;
import school.dto.SalaryDTO;
import school.dto.SalaryHistoryDTO;
import school.dto.SalaryPayrollDTO;
import school.model.Course;
import school.model.Salary;
import school.model.Teacher;
import school.service.SalaryService;
import school.service.utils.SalaryUtil;

@Service
public class SalaryServiceImpl implements SalaryService {
	SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
	private final String ISSUE_DAY = "/10/";
	private final int INITIAL_RATE = 15;
	@Autowired
	private SalaryDao salaryDao;
	@Autowired
	private TeacherDao teacherDao;

	public Date getCurrentDate() throws ParseException {
		Calendar currentDate = Calendar.getInstance();
		String modifiedDate = formatterDate.format(currentDate.getTime());
		Date formattedCurrentDate = formatterDate.parse(modifiedDate);
		return formattedCurrentDate;
	}

	public long getHours(Date lastSalaryDate, Teacher teacher)
			throws ParseException {
		Date currentDate = getCurrentDate();
		long hours = salaryDao.findHoursByPeriod(teacher.getId(),
				lastSalaryDate, currentDate);
		return hours;
	}

	@Transactional
	@Override
	public SalaryDTO getCurrentMonthInfo(Principal principal)
			throws ParseException {
		long userId = Long.parseLong(principal.getName());
		Teacher teacher = teacherDao.findByUserId(userId);
		if (teacher == null)
			return null;

		Date lastSalaryDateDate = salaryDao
				.findByLastIssueDate(teacher.getId()).getIssueDate();

		Calendar currentDate = Calendar.getInstance();
		int hours = (int) getHours(lastSalaryDateDate, teacher);
		int balance = hours * INITIAL_RATE * teacher.getRate();

		int currentMonth = currentDate.get(Calendar.MONTH);
		Calendar lastSalaryDate = Calendar.getInstance();
		lastSalaryDate.setTime(lastSalaryDateDate);
		int lastSalaryMonth = lastSalaryDate.get(Calendar.MONTH);
		Date nextCalculationDate = new Date();
		if (lastSalaryMonth != 11) {
			if (lastSalaryMonth == currentMonth) {
				nextCalculationDate = formatterDate.parse(""
						+ (currentMonth + 2) + ISSUE_DAY
						+ currentDate.get(Calendar.YEAR));
			} else if (lastSalaryMonth < currentMonth)
				nextCalculationDate = formatterDate.parse(""
						+ (currentMonth + 1) + ISSUE_DAY
						+ currentDate.get(Calendar.YEAR));
		} else
			nextCalculationDate = formatterDate.parse(""
					+ (Calendar.JANUARY + 1) + ISSUE_DAY
					+ (currentDate.get(Calendar.YEAR) + 1));
		String nextCalculation = formatterDate.format(nextCalculationDate);

		return new SalaryDTO(hours, balance, nextCalculation);
	}

	@Transactional
	@Override
	public List<SalaryHistoryDTO> getHistoryInfo(Principal principal,
			Date from, Date until) {
		long userId = Long.parseLong(principal.getName());
		Teacher teacher = teacherDao.findByUserId(userId);
		if (teacher == null)
			return null;
		List<SalaryHistoryDTO> salariesHistoryDTO = new ArrayList<SalaryHistoryDTO>();
		List<Salary> salaries = salaryDao.findByTeacherIdAndPeriod(
				teacher.getId(), from, until);
		for (Salary salary : salaries) {
			Date issueDateDate = salary.getIssueDate();
			Calendar issueDateCalendar = Calendar.getInstance();
			issueDateCalendar.setTime(issueDateDate);
			int salaryMonth = issueDateCalendar.get(Calendar.MONTH);
			int year = issueDateCalendar.get(Calendar.YEAR);

			String issueDate = SalaryUtil.getMonth(salaryMonth) + " " + year;
			salariesHistoryDTO.add(new SalaryHistoryDTO(salary.getHours(),
					salary.getSalary(), issueDate, salary.getAdditional(),
					salary.getSum()));
		}
		return salariesHistoryDTO;
	}

	@Transactional
	@Override
	public List<SalaryCourseDTO> getCourseOfTeacherInfo(Principal principal) {
		long userId = Long.parseLong(principal.getName());
		Teacher teacher = teacherDao.findByUserId(userId);
		if (teacher == null)
			return null;
		List<SalaryCourseDTO> coursesDTO = new ArrayList<SalaryCourseDTO>();
		List<Course> courses = teacher.getCourse();
		for (Course course : courses) {
			String courseName = course.getCourseName() + " ("
					+ course.getGroupNumber() + ")";
			int sumPerHour = INITIAL_RATE * course.getCoeficient();
			coursesDTO.add(new SalaryCourseDTO(courseName, course
					.getCoeficient(), sumPerHour));
		}
		return coursesDTO;
	}

	@Transactional
	@Override
	public List<SalaryPayrollDTO> getPayrollInfo() throws ParseException {
		List<SalaryPayrollDTO> payrolls = new ArrayList<SalaryPayrollDTO>();
		List<Teacher> teachers = teacherDao.findAll();
		for (Teacher teacher : teachers) {
			long teacherId = teacher.getId();
			String teacherName = teacher.getUser().getFirstName() + " "
					+ teacher.getUser().getLastName();
			int teacherRate = teacher.getRate();

			Date lastSalaryDate = salaryDao
					.findByLastIssueDate(teacher.getId()).getIssueDate();
			int hours = (int) getHours(lastSalaryDate, teacher);

			int salary = hours * INITIAL_RATE;

			payrolls.add(new SalaryPayrollDTO(teacherId, teacherName,
					teacherRate, salary, hours));
		}
		return payrolls;
	}

	@Override
	public void addSalary(String[] additionalPay) throws ParseException {
		List<SalaryPayrollDTO> payrolls = getPayrollInfo();
		int i = 0;
		for (SalaryPayrollDTO payroll : payrolls) {
			Date currentDate = getCurrentDate();
			int additional = Integer.parseInt(additionalPay[i]);
			i++;
			int salary = payroll.getSalary();
			int hours = payroll.getHours();
			int sum = salary + additional;
			Salary monthSalary = new Salary();
			monthSalary.setAdditional(additional);
			monthSalary.setHours(hours);
			monthSalary.setIssueDate(currentDate);
			monthSalary.setSalary(salary);
			monthSalary.setSum(sum);
			monthSalary.setTeacher(teacherDao.findById(payroll.getTeacherId()));
			salaryDao.save(monthSalary);
		}
	}
}
