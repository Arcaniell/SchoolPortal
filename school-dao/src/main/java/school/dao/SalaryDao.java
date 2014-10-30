package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Salary;

public interface SalaryDao extends BaseDao<Salary, Long>{
	List<Salary> findByTeacherId (long teacherId);
	List<Salary> findByDate (Date date);
	List<Salary> findByPeriod (Date from, Date until);
}
