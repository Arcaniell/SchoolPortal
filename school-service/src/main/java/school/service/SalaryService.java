package school.service;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import school.dto.SalaryDTO;


public interface SalaryService {

	SalaryDTO getCurrentMonthInfo(Principal user) throws ParseException;

	List<SalaryDTO> getHistoryInfo(Principal user, Date from, Date until);

}
