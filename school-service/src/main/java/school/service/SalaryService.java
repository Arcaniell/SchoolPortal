package school.service;



import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import school.dto.SalaryCourseDTO;
import school.dto.SalaryDTO;
import school.dto.SalaryHistoryDTO;
import school.dto.SalaryPayrollDTO;


public interface SalaryService {

	SalaryDTO getCurrentMonthInfo(Principal user) throws ParseException;

	List<SalaryHistoryDTO> getHistoryInfo(Principal user, Date from, Date until);
	
	List<SalaryCourseDTO> getCourseOfTeacherInfo(Principal user);
	
	List<SalaryPayrollDTO> getPayrollInfo() throws ParseException;
	
	void addSalary(String[] additionalPay) throws ParseException;

}
