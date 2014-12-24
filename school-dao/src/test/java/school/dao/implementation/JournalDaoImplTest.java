package school.dao.implementation;

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.junit.After;
import org.junit.Before;
import org.junit.Assert;
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
	public void testFindByStudentAndSchedule() {
		Journal journal = journalDao.findByStudentAndSchedule(1, 1);
		Assert.assertTrue(journal.getMark() == 10);
	}

}
