package school.dao.sessionfactory.implementation;

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

import school.model.Lesson;





public class LessonDaoImplTest extends DBUnitConfig {
	public LessonDaoImplTest() {
		super("LessonDaoImplTest");
	}

	private Lesson lesson;
	private LessonDaoImpl lessonDaoImpl;
	private Date dateN;
	private Date dateStart;
	private Date dateFinish;
	
	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
		
	}
	
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}
	
	@Before
	public void setUp() throws Exception {
		
		String str2 = "2014-10-23 12:20:00.0";
		dateFinish = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str2);
		String str1 = "2014-10-23 11:30:00.0";
		dateStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str1);
		
		lesson = new Lesson();
		lesson.setLesId(1L);
		String str = "2014-10-23 08:30:00.0";
		dateN = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str);
		lesson.setLesStartTime(dateN);
		lesson.setLesFinishTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse("2014-10-23 09:15:00.0"));
		
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

		newLesson.setLesStartTime(dateStart);
		newLesson.setLesFinishTime(dateFinish);
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


	@Test
	public void testUpdate() {
		Lesson newLesson = lessonDaoImpl.findById(1L);
		Assert.assertEquals(lesson.getLesStartTime(), newLesson.getLesStartTime());
		lesson.setLesStartTime(dateStart);;
		newLesson = lessonDaoImpl.update(newLesson);
		Assert.assertNotEquals(lesson.getLesStartTime(), newLesson.getLesStartTime());
	
	}

	@Test
	public void testFindAll() {
		List<Lesson> lessons = lessonDaoImpl.findAll();
		Assert.assertTrue(lessons.size() == 6);;
	}
	
	@Test
	public void testFindByStartTime() {
		Lesson newLesson = lessonDaoImpl.findByStartTime(lesson.getLesStartTime());
		Assert.assertEquals( lesson, newLesson);
	}
	
}


