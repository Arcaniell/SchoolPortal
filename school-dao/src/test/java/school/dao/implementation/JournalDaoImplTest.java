package school.dao.implementation;

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

import school.dao.JournalDao;
import school.model.Journal;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class JournalDaoImplTest extends DBUnitConfig {

	@Autowired
	private JournalDao journalDao;
	private List<Journal> journals;

	public JournalDaoImplTest() {
		super("JournalDaoImplTest");
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
				"/xml-data-sets/journal.xml"));
	}

	@Test
	public void testFindByStudentId() {
		journals = journalDao.findByStudentId(1L);
		Assert.assertTrue(journals.size() == 1);
	}

	@Test
	public void testFindByInterval() throws ParseException {
		Date from = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-21 09:00:00");
		Date till = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-22 11:00:00");
		journals = journalDao.findByInterval(from, till);
		Assert.assertTrue(journals.size() == 2);
	}

	@Test
	public void testFindByIntervalAndStudentId() throws ParseException {
		Date from = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-21 09:00:00");
		Date till = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-10-22 11:00:00");
		journals = journalDao.findByIntervalAndStudentId(1, from, till);
		Assert.assertTrue(journals.size() == 1);
	}

}