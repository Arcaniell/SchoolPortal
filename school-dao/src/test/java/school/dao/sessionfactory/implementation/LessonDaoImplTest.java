package school.dao.sessionfactory.implementation;

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

import school.model.Lesson;





public class LessonDaoImplTest extends DBUnitConfig {
	public LessonDaoImplTest() {
		super("LessonDaoImplTest");
	}

	private Lesson lesson;
	private LessonDaoImpl lessonDaoImpl;
	
	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
	}
	
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}
	
	@Before
	public void setUp() throws Exception {
		lesson = new Lesson();
		lesson.setLesId(1L);
		
		//need fixing
		lesson.setLesStartTime(new Date(10,23,2014,8,30,00));
		lessonDaoImpl = new LessonDaoImpl();
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet lessonDataSet = getDataSet();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), lessonDataSet);
		session.close();
		
	}
	
	@After
	public void tearDown() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet lessonDataSet = getDataSet();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), lessonDataSet);
		session.close();
	}
	
	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/lesson.xml"));
	}
	
	@Test
	public void testFindById() {
		Lesson newLesson = lessonDaoImpl.findById(1L);
		Assert.assertEquals(lesson.getLesId(), newLesson.getLesId());
	}
	
	@Test
	public void testSave() {
		Lesson newLesson = new Lesson();
			
		//need fixing
		newLesson.setLesStartTime(new Date(10,23,2014,11,30,00));
		newLesson.setLesFinishTime(new Date(10,23,2014,12,20,00));
		lessonDaoImpl = new LessonDaoImpl();
		lessonDaoImpl.save(newLesson);
		List<Lesson> lessons = lessonDaoImpl.findAll();
		Assert.assertTrue(lessons.size() == 7);

	}

	@Test
	public void testRemove() {

		lessonDaoImpl.remove(lesson);
		Assert.assertNull(lessonDaoImpl.findById(1L));
	}

	@SuppressWarnings("deprecation")
	@Test
	public void testUpdate() {
		Lesson newLesson = lessonDaoImpl.findById(1L);
		Assert.assertEquals(lesson.getLesStartTime().getHours(), newLesson.getLesStartTime().getHours());
		Assert.assertEquals(lesson.getLesStartTime().getMinutes(), newLesson.getLesStartTime().getMinutes());
		
		//need fixing
		lesson.setLesStartTime(new Date(10,23,2014,13,20,00));;
		newLesson = lessonDaoImpl.update(newLesson);
		Assert.assertNotEquals(lesson.getLesStartTime(), newLesson.getLesStartTime());
	
	}

	@Test
	public void testFindAll() {
		List<Lesson> lessons = lessonDaoImpl.findAll();
		Assert.assertTrue(lessons.size() == 6);;
	}
	
}


