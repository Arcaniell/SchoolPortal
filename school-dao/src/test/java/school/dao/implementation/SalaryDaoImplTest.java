package school.dao.implementation;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import school.dao.SalaryDao;
import school.model.Salary;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class SalaryDaoImplTest extends DBUnitConfig {

	@Autowired
	private SalaryDao salaryDao;
	private List<Salary> salaries;

	public SalaryDaoImplTest() {
		super("SalaryDaoImplTest");
	}

	@Before
	public void setUp() throws Exception {
		super.setUp();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
				.getConnection(), getDataSet());
	}

	@After
	public void tearDown() throws Exception {
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
				.getConnection(), getDataSet());
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/xml-data-sets/salary.xml"));
	}

	@Test
	public void testFindByTeacherId() throws Exception {
		salaries = salaryDao.findByTeacherId(2);
		Assert.assertEquals(1, salaries.size());
	}

	@Test
	public void testFindByPeriod() throws ParseException {
		Date from = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-10 09:00:00");
		Date until = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-12-22 11:00:00");
		salaries = salaryDao.findByPeriod(from, until);
		Assert.assertTrue(salaries.size() == 3);
	}

	@Test
	public void testFindByDate() throws ParseException {
		Date issueDate = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-13 09:00:00");
		salaries = salaryDao.findByDate(issueDate);
		Assert.assertTrue(salaries.size() == 1);
	}

	@Test
	public void testFindHours() throws Exception {
		Date from = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-23 08:08:10");
		Date until = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-25 09:08:10");
		long actual = salaryDao.findHoursByPeriod(1, from, until);
		Assert.assertEquals(2, actual);
	}

	@Test
	public void testFindByTeacherAndPeriod() throws Exception {
		Date from = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-10 09:00:00");
		Date until = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-12-22 11:00:00");
		salaries = salaryDao.findByTeacherIdAndPeriod(1, from, until);
		Assert.assertEquals(2, salaries.size());
	}
	
	@Test
	public void testFindByLastIssueDate() throws Exception {
		Salary salary = salaryDao.findByLastIssueDate(1);
		Date date = new SimpleDateFormat("yyyy-M-dd").parse("2014-11-11");
		Assert.assertEquals(date, salary.getIssueDate());
	}
}
