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
import school.dto.SalaryDTO;
import school.model.Salary;
import school.model.Teacher;
import school.service.SalaryService;
import school.service.utils.SalaryUtil;

@Service
public class SalaryServiceImpl implements SalaryService {
	SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
	@Autowired
	private SalaryDao salaryDao;
	@Autowired
	private TeacherDao teacherDao;

	@Transactional
	@Override
	public SalaryDTO getCurrentMonthInfo(Principal user) throws ParseException {
		long userId = Long.parseLong(user.getName());
		Teacher teacher = teacherDao.findByUserId(userId);
		if (teacher == null)
			return null;

		Date lastSalaryDateDate = salaryDao
				.findByLastIssueDate(teacher.getId()).getIssueDate();

		Calendar currentDate = Calendar.getInstance();
		String modifiedDate = formatterDate.format(currentDate.getTime());
		Date formattedCurrentDate = formatterDate.parse(modifiedDate);

		long hours = salaryDao.findHoursByPeriod(teacher.getId(),
				lastSalaryDateDate, formattedCurrentDate);
		long balance = hours * 50;

		int currentMonth = currentDate.get(Calendar.MONTH);
		Calendar lastSalaryDate = Calendar.getInstance();
		lastSalaryDate.setTime(lastSalaryDateDate);
		int lastSalaryMonth = lastSalaryDate.get(Calendar.MONTH);
		Date nextCalculationDate = new Date();
		if (lastSalaryMonth != 11) {
			if (lastSalaryMonth == currentMonth) {
				nextCalculationDate = formatterDate.parse(""
						+ (currentMonth + 2) + "/10/"
						+ currentDate.get(Calendar.YEAR));
			} else if (lastSalaryMonth < currentMonth)
				nextCalculationDate = formatterDate.parse(""
						+ (currentMonth + 1) + "/10/"
						+ currentDate.get(Calendar.YEAR));
		} else
			nextCalculationDate = formatterDate.parse(""
					+ (Calendar.JANUARY + 1) + "/10/"
					+ (currentDate.get(Calendar.YEAR) + 1));
		String nextCalculation = formatterDate.format(nextCalculationDate);

		return new SalaryDTO(hours, balance, nextCalculation);
	}

	@Transactional
	@Override
	public List<SalaryDTO> getHistoryInfo(Principal user, Date from, Date until) {
		long userId = Long.parseLong(user.getName());
		Teacher teacher = teacherDao.findByUserId(userId);
		if (teacher == null)
			return null;
		List<SalaryDTO> salariesDTO = new ArrayList<SalaryDTO>();
		List<Salary> salaries = salaryDao.findByTeacherIdAndPeriod(
				teacher.getId(), from, until);
		for (Salary salary : salaries) {
			Date issueDateDate = salary.getIssueDate();
			Calendar issueDateCalendar = Calendar.getInstance();
			issueDateCalendar.setTime(issueDateDate);
			int salaryMonth = issueDateCalendar.get(Calendar.MONTH);
			int year = issueDateCalendar.get(Calendar.YEAR);

			String issueDate = SalaryUtil.getMonth(salaryMonth) + " " + year;
			salariesDTO.add(new SalaryDTO(salary.getHours(), salary.getSum(),
					issueDate));
		}
		return salariesDTO;
	}

}
