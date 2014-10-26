package school.dao.sessionfactory.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.hibernate.Session;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import school.model.Group;

public class GroupDaoImplTest extends DBUnitConfig {

	public GroupDaoImplTest() {
		super("GroupDaoImplTest");
	}

	private GroupDaoImpl groupDaoImpl;
	private Group group;
	private List<Group> groups;

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
		groupDaoImpl = new GroupDaoImpl();
		IDataSet messageDataSet = getDataSet();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
				.getConnection(), messageDataSet);
	}

	@After
	public void tearDown() throws Exception {
		IDataSet messageDataSet = getDataSet();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
				.getConnection(), messageDataSet);
	}

	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream(
				"/group.xml"));
	}

	@Test
	public void testFindByStartDate() throws ParseException {
		Date date = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
				.parse("2014-09-01 09:00:00");
		groups = groupDaoImpl.findByStartDate(date);

		Assert.assertTrue(groups.size() == 3);
	}

	@Test
	public void testFindAllActiveGroups() throws ParseException {
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse("2015-01-01 09:00:00");
		groups = groupDaoImpl.findAllActiveGroups(date);
		Assert.assertTrue(groups.size() == 3);
	}

	@Test
	public void testFindAll() {
		groups = groupDaoImpl.findAll();
		Assert.assertTrue(groups.size() == 4);
	}

	@Test
	public void testFindByTeacherId() {
		group = groupDaoImpl.findByTeacherId(1L);
		Assert.assertEquals(group.getId(), 1L);
	}

	@Test
	public void testFindByNumberAndLetter() {
		group = groupDaoImpl.findByNumberAndLetter((byte) 7, 'a');
		Assert.assertEquals(group.getId(), 1L);
	}

	@Test
	public void testFindByNumber() {
		groups = groupDaoImpl.findByNumber((byte) 7);
		Assert.assertTrue(groups.size() == 3);
	}

	@Test
	public void testFindAllNotAdditional() {
		groups = groupDaoImpl.findAllNotAdditional();
		Assert.assertTrue(groups.size() == 3);
	}

	@Test
	public void testFindAllAdditional() {
		groups = groupDaoImpl.findAllAdditional();
		Assert.assertTrue(groups.size() == 1);
	}

}
