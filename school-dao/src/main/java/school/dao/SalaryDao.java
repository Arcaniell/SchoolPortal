package school.dao;

import java.util.Date;
import java.util.Set;

import school.model.Salary;

public interface SalaryDao extends BaseDao<Salary>{
	Set<Salary> findByTeacherId (long teacherId);
	Set<Salary> findByDate (Date date);
	Set<Salary> findByPeriod (Date from, Date until);
}
