
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

import school.dao.ScheduleDao;
import school.model.Course;
import school.model.Group;
import school.model.Lesson;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;
import school.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/dao-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class ScheduleDaoImplTest extends DBUnitConfig{



	public ScheduleDaoImplTest() {
		super("ScheduleDaoImplTest");
	}

	@Autowired
	private ScheduleDao scheduleDao;
	private Schedule schedule;
	private Date dateN;
	private Date from;
	private Date till;

	@Before
	public void setUp() throws Exception {
		String str = "2014-11-21 09:30:00.0";
		dateN = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str);
		String str1 = "2014-10-23 08:08:10.0";
		from = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str1);
		String str2 = "2014-10-25 08:08:10.0";
		till = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str2);
		
		User user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		String oldstringReg = "2001-09-01 08:08:10.0";
		Date dateReg = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstringReg);
		user.setRegistration(dateReg);
		user.setSex(User.SexType.MALE);
		Teacher teacher = new Teacher();
		teacher.setId(1L);
		teacher.setRate(100000);
		teacher.setUser(user);
		Group group = new Group();
		group.setId(1L);
		group.setAdditional(false);
		group.setLetter('A');
		group.setNumber((byte)5);
		String oldstringSD = "2010-09-01 08:30:00.0";
		Date dateSD = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstringSD);
		group.setStartDate(dateSD);
		String oldstringED = "2020-05-31 10:30:00.0";
		Date dateED = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstringED);
		group.setEndDate(dateED);
		group.setTeacher(teacher);
		Lesson lesson = new Lesson();
		lesson.setLesId(1L);
		String oldstringStart = "2014-10-23 09:15:00.0";
		Date dateStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstringStart);
		lesson.setLesStartTime(dateStart);
		String oldstringFinish = "2014-10-23 09:15:00.0";
		Date dateFinish = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstringFinish);
		lesson.setLesFinishTime(dateFinish);
		Course course = new Course();
		course.setId(1L);
		course.setAdditional(false);
		course.setCoeficient(75);
		course.setCourseName("Math");
		course.setGroupNumber(5);
		course.setPrice(0);
		Room room = new Room();
		room.setId(1);
		room.setAvailable(true);
		room.setRoomNumber(110);
		room.setSize(25);
		schedule = new Schedule();
		schedule.setId(1L);
		String oldstring = "2014-10-23 08:08:10.0";
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(oldstring);
		schedule.setDate(date);
		schedule.setGroup(group);
		schedule.setCourse(course);
		schedule.setLesson(lesson);
		schedule.setRoom(room);
		schedule.setTeacher(teacher);
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
				"/xml-data-sets/schedule.xml"));
	}

	@Test
	public void testFindById() {
		Schedule newSchedule = scheduleDao.findById(1L);
		Assert.assertEquals(schedule.getId(), newSchedule.getId());
	}

	@Test
	public void testSave() {
		User newUser= new User();
		newUser.setId(1L);
		Teacher newTeacher = new Teacher();
		newTeacher.setId(1L);
		Group newGroup = new Group();
		newGroup.setId(1L);
		Lesson newLesson = new Lesson();
		newLesson.setLesId(1L);
		Room newRoom = new Room();
		newRoom.setId(1);
		Course newCourse = new Course();
		newCourse.setId(2L);
		Schedule newSchedule = new Schedule();
		newSchedule.setDate(new Date());
		newSchedule.setGroup(newGroup);
		newSchedule.setLesson(newLesson);
		newSchedule.setTeacher(newTeacher);
		newSchedule.setRoom(newRoom);
		newSchedule.setCourse(newCourse);
		scheduleDao.save(newSchedule);
		List<Schedule> schedules = scheduleDao.findAll();
		Assert.assertTrue(schedules.size()==11);

	}

	@Test
	public void testRemove() {
		schedule = scheduleDao.findById(1L);
		scheduleDao.remove(schedule);
		Assert.assertNull(scheduleDao.findById(1L));
	}

	@Test
	public void testUpdate() {		
		Schedule newSchedule = scheduleDao.findById(1L);
		Assert.assertEquals(schedule.getDate(), newSchedule.getDate());
		newSchedule.setDate(dateN);;
		newSchedule = scheduleDao.update(newSchedule);
		Assert.assertNotEquals(schedule.getDate(), newSchedule.getDate());
	}

	@Test()
	public void testFindAll() {
		List<Schedule> schedules = scheduleDao.findAll();
		Assert.assertTrue(schedules.size() == 10);
	}

	
	
	@Test
	public void testFindByDates(){
		List<Schedule> actual = scheduleDao.findByDates(from, till);
		Assert.assertTrue(actual.size() == 7);
	}
	
	@Test
	public void testFindByGroup(){
		schedule= scheduleDao.findById(1L);
		List<Schedule> actual = scheduleDao.findByGroup(schedule.getGroup());
		Assert.assertTrue(actual.size()==6);
	}
	
	
	@Test
	public void testFindByRoom(){
		schedule= scheduleDao.findById(1L);
		List<Schedule> actual = scheduleDao.findByRoom(schedule.getRoom());
		Assert.assertTrue(actual.size()==3);
	}
	
	@Test
	public void testFindByTacher(){
		schedule= scheduleDao.findById(1L);
		List<Schedule> actual = scheduleDao.findByTeacher(schedule.getTeacher());
		Assert.assertTrue(actual.size()==3);
	 }
	 

	 @Test
	 public void testFindByTeacherInterval(){
		List<Schedule> actual = scheduleDao.findByTeacherInterval(1,from,till);
		Assert.assertTrue(actual.size()==2);
	 }
	 
	 @Test
	 public void testFindByRoomInterval(){
		List<Schedule> actual = scheduleDao.findByRoomInterval(1,from,till);
		Assert.assertTrue(actual.size()==2);
	 }
	 
	 @Test
	 public void testFindByGroupInterval(){
		List<Schedule> actual = scheduleDao.findByGroupInterval(1,from,till);
		Assert.assertTrue(actual.size()==4);
	 }
	 

	 
	}

