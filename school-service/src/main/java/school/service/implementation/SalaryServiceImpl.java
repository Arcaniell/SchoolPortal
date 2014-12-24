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
import school.service.utils.DateUtil;
import school.service.utils.SalaryUtil;

/**
 * This class realizes all salary methods from SalaryService interface.
 * 
 * @author Roman Zherebetskyi
 * 
 */
@Service
public class SalaryServiceImpl implements SalaryService {
	private final SimpleDateFormat formatterDate = new SimpleDateFormat(
			"MM/dd/yyyy");
	private final String ISSUE_DAY = "/10/";
	private final int INITIAL_RATE = 15;
	@Autowired
	private SalaryDao salaryDao;
	@Autowired
	private TeacherDao teacherDao;

	@Override
	public int getHours(Date lastSalaryDate, Teacher teacher) {
		Date currentDate = DateUtil.getCurrentDate(formatterDate);
		long hours = salaryDao.findHoursByPeriod(teacher.getId(),
				lastSalaryDate, currentDate);
		return (int) hours;
	}

	@Override
	public Boolean isCurrentMonth() {
		Calendar lastSalaryDate = Calendar.getInstance();
		lastSalaryDate.setTime(salaryDao.findLastDate());
		int lastSalaryMonth = lastSalaryDate.get(Calendar.MONTH);
		int currentMonth = Calendar.getInstance().get(Calendar.MONTH);
		return (lastSalaryMonth == currentMonth);
	}

	@Override
	public Date predictNextMonth(int lastSalaryMonth, int currentMonth,
			Calendar currentDate) {
		Date nextCalculationDate = new Date();
		if (lastSalaryMonth != 11) {
			if (lastSalaryMonth == currentMonth) {
				try {
					nextCalculationDate = formatterDate.parse(""
							+ (currentMonth + 2) + ISSUE_DAY

							+ currentDate.get(Calendar.YEAR));
				} catch (ParseException e) {

				}
			} else if (lastSalaryMonth < currentMonth)
				try {
					nextCalculationDate = formatterDate.parse(""
							+ (currentMonth + 1) + ISSUE_DAY
							+ currentDate.get(Calendar.YEAR));
				} catch (ParseException e) {

				}
		} else
			try {
				nextCalculationDate = formatterDate.parse(""
						+ (Calendar.JANUARY + 1) + ISSUE_DAY
						+ (currentDate.get(Calendar.YEAR) + 1));
			} catch (ParseException e) {

			}
		return nextCalculationDate;
	}

	@Transactional
	@Override
	public SalaryDTO getCurrentMonthInfo(Principal principal) {
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
		Date nextCalculationDate = predictNextMonth(lastSalaryMonth,
				currentMonth, currentDate);
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
	public List<SalaryPayrollDTO> getPayrollInfo() {
		List<SalaryPayrollDTO> payrolls = new ArrayList<SalaryPayrollDTO>();
		List<Teacher> teachers = teacherDao.findAll();
		for (Teacher teacher : teachers) {
			long userId = teacher.getUser().getId();
			long teacherId = teacher.getId();
			String teacherName = teacher.getUser().getFirstName() + " "
					+ teacher.getUser().getLastName();
			int teacherRate = teacher.getRate();

			Date lastSalaryDate = salaryDao
					.findByLastIssueDate(teacher.getId()).getIssueDate();
			int hours = (int) getHours(lastSalaryDate, teacher);

			int salary = hours * INITIAL_RATE * teacherRate;

			payrolls.add(new SalaryPayrollDTO(userId, teacherId, teacherName,
					teacherRate, salary, hours));
		}
		return payrolls;
	}

	@Transactional
	@Override
	public void addSalary(String[] additionalPay) {
		List<SalaryPayrollDTO> payrolls = getPayrollInfo();
		int i = 0;
		for (SalaryPayrollDTO payroll : payrolls) {
			Date currentDate = DateUtil.getCurrentDate(formatterDate);
			int additional = Integer.parseInt(additionalPay[i++]);
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
