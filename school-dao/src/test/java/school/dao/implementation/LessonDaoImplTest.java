package school.dao.implementation;

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

import school.dao.LessonDao;
import school.model.Lesson;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class LessonDaoImplTest extends DBUnitConfig {

	public LessonDaoImplTest() {
		super("LessonDaoImplTest");
	}

	@Autowired
	private LessonDao lessonDao;
	private Lesson lesson;
	private Date dateN;
	private Date dateStart;
	private Date dateFinish;

	@Before
	public void setUp() throws Exception {
		String str2 = "2014-10-23 12:20:00.0";
		dateFinish = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str2);
		String str1 = "2014-10-23 11:30:00.0";
		dateStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str1);

		lesson = new Lesson();
		lesson.setId(1L);
		String str = "2014-10-23 08:30:00.0";
		dateN = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str);
		lesson.setStartTime(dateN);
		lesson.setFinishTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S")
				.parse("2014-10-23 09:15:00.0"));

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
				"/xml-data-sets/lesson.xml"));
	}

	@Test
	public void testFindById() {
		Lesson newLesson = lessonDao.findById(1L);
		Assert.assertEquals(lesson.getId(), newLesson.getId());

	}

	@Test
	public void testSave() {
		Lesson newLesson = new Lesson();
		newLesson.setStartTime(dateStart);
		newLesson.setFinishTime(dateFinish);
		lessonDao.save(newLesson);
		List<Lesson> lessons = lessonDao.findAll();
		Assert.assertTrue(lessons.size() == 7);

	}

	@Test
	public void testRemove() {
		lessonDao.remove(lesson);
		Assert.assertNull(lessonDao.findById(1L));

	}

	@Test
	public void testUpdate() {
		Lesson newLesson = lessonDao.findById(1L);
		Assert.assertEquals(lesson.getStartTime(),
				newLesson.getStartTime());
		lesson.setStartTime(dateStart);
		;
		newLesson = lessonDao.update(newLesson);
		Assert.assertNotEquals(lesson.getStartTime(),
				newLesson.getStartTime());

	}

	@Test()
	public void testFindAll() {
		List<Lesson> lessons = lessonDao.findAll();
		Assert.assertTrue(lessons.size() == 6);
		;

	}

	@Test
	public void testFindByStartTime() {
		Lesson newLesson = lessonDao.findByStartTime(lesson.getStartTime());
		Assert.assertEquals(lesson, newLesson);
	}

}

/*

package school.dao.implementation;

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

import school.dao.LessonDao;
import school.model.Lesson;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class LessonDaoImplTest  extends DBUnitConfig {

	public LessonDaoImplTest() {
		super("LessonDaoImplTest");
	}

	@Autowired
	private LessonDao lessonDao;
	private Lesson lesson;
	private Date dateN;
	private Date dateStart;
	private Date dateFinish;

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
				"/xml-data-sets/lesson.xml"));
	}

	@Test
	public void testFindById() {
		Lesson newLesson = lessonDao.findById(1L);
		Assert.assertEquals(lesson.getLesId(), newLesson.getLesId());
		
	}

	@Test
	public void testSave() {
		Lesson newLesson = new Lesson();
		newLesson.setLesStartTime(dateStart);
		newLesson.setLesFinishTime(dateFinish);
		lessonDao.save(newLesson);
		List<Lesson> lessons = lessonDao.findAll();
		Assert.assertTrue(lessons.size() == 7);
		
	}

	@Test
	public void testRemove() {
		lessonDao.remove(lesson);
		Assert.assertNull(lessonDao.findById(1L));
		
	}

	@Test
	public void testUpdate() {
		Lesson newLesson = lessonDao.findById(1L);
		Assert.assertEquals(lesson.getLesStartTime(), newLesson.getLesStartTime());
		lesson.setLesStartTime(dateStart);;
		newLesson = lessonDao.update(newLesson);
		Assert.assertNotEquals(lesson.getLesStartTime(), newLesson.getLesStartTime());
		
	}

	@Test()
	public void testFindAll() {
		List<Lesson> lessons = lessonDao.findAll();
		Assert.assertTrue(lessons.size() == 6);;

	}
	
	
	@Test
	public void testFindByStartTime() {
		Lesson newLesson = lessonDao.findByStartTime(lesson.getLesStartTime());
		Assert.assertEquals( lesson, newLesson);
	}


}
*/
