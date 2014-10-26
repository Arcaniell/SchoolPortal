package school.dao.sessionfactory.implementation;

import java.io.IOException;
import java.util.List;

import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import school.model.Journal;

public class JournalDaoImplTest extends DBUnitConfig {

	private Journal journal;
	private JournalDaoImpl journalDaoImpl;
	private List<Journal> journals;

	public JournalDaoImplTest() {
		super("JournalDaoImplTest");
	}

	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}

	@Before
	public void setUp() throws Exception {
		super.setUp();
		journalDaoImpl = new JournalDaoImpl();
		IDataSet messageDataSet = getDataSet();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
				.getConnection(), messageDataSet);
	}

	@After
	public void tearDown() throws Exception {
		IDataSet messageDataSet = getDataSet();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
				.getConnection(), messageDataSet);
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
	}

	private IDataSet getBlank() throws DataSetException, IOException {
	    return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/blank.xml"));
    }

    @Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/journal.xml"));
	}

	@Test
	public void testFindByStudentId() {
		journals = journalDaoImpl.findByStudentId(1L);
		Assert.assertEquals(journals.size(), 1);
	}

}
