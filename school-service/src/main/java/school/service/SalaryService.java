package school.service;



import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import school.dto.SalaryCourseDTO;
import school.dto.SalaryDTO;
import school.dto.SalaryHistoryDTO;
import school.dto.SalaryPayrollDTO;
import school.model.Teacher;


public interface SalaryService {
	
	/**
	 * This method gets data about teacher`s current month salary situation (hours, 
	 * current salary and next calculation date).
	 * 
	 * @param user
	 * @return SalaryDto
	 */
	SalaryDTO getCurrentMonthInfo(Principal user);
	
	/**
	 * This method gets data about previous months salary.
	 * 
	 * @param user
	 * @param from
	 * @param until
	 * @return List<SalaryHistoryDTO>
	 */
	List<SalaryHistoryDTO> getHistoryInfo(Principal user, Date from, Date until);
	
	/**
	 * This method returns information about teacher`s groups in salary context.
	 * 
	 * @param user
	 * @return List<SalaryCourseDTO>
	 */
	List<SalaryCourseDTO> getCourseOfTeacherInfo(Principal user);
	
	/**
	 * This method gets information for director about payroll for teachers.
	 * 
	 * @return List<SalaryPayrollDTO>
	 */
	List<SalaryPayrollDTO> getPayrollInfo();
	
	/**
	 * This method calculates salary for teachers.
	 * 
	 * @param additionalPay
	 */
	void addSalary(String[] additionalPay);
	
	/**
	 * This method checks if last salary month is current month.
	 * 
	 * @return Boolean
	 */
	Boolean isCurrentMonth();

	/**
	 * This method returns count of hours worked from last salary date until now.
	 * 
	 * @param lastSalaryDate
	 * @param teacher
	 * @return int
	 */
	
	int getHours(Date lastSalaryDate, Teacher teacher);
	
	/**
	 * This method determines next calculation date.
	 * 
	 * @param lastSalaryMonth
	 * @param currentMonth
	 * @param currentDate
	 * @return Date
	 */
	Date predictNextMonth(int lastSalaryMonth, int currentMonth,
			Calendar currentDate);

}
