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

import school.model.Course;

public class CourseDaoImplTest extends DBUnitConfig {

	private CourseDaoImpl courseDaoImpl;
	private List<Course> courses;

	public CourseDaoImplTest() {
		super("CourseDaoImplTest");
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
		courseDaoImpl = new CourseDaoImpl();
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
				"/course.xml"));
	}

	@Test
	public void testFindByGroupNumber() {
		courses = courseDaoImpl.findByGroupNumber(5);
		Assert.assertTrue(courses.size() == 3);
	}

	@Test
	public void testFindByCoefficient() {
		courses = courseDaoImpl.findByCoefficient(1);
		Assert.assertTrue(courses.size() == 3);
	}

	@Test
	public void testFindCourseName() {
		courses = courseDaoImpl.findByCourseName("Math");
		Assert.assertTrue(courses.size() == 2);
	}

	@Test
	public void testFindByCourseNameAndGroupNumber() {
		courses = courseDaoImpl.findByCourseNameAndGroupNumber("Math", 5);
		Assert.assertTrue(courses.size() == 1);
	}

	@Test
	public void testFindByPrice() {
		courses = courseDaoImpl.findByPrice(2000);
		Assert.assertTrue(courses.size() == 1);
	}

	@Test
	public void testFindAllMandatory() {
		courses = courseDaoImpl.findAllMandatoryCourses();
		Assert.assertTrue(courses.size() == 2);
	}

	@Test
	public void testFindAllAddition() {
		courses = courseDaoImpl.findAllAddition();
		Assert.assertTrue(courses.size() == 3);
	}

	@Test
	public void testFindByPriceRange() {
		courses = courseDaoImpl.findByPriceRange(1000, 1500);
		Assert.assertTrue(courses.size() == 2);
	}

}
