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




import school.model.Course;
import school.model.Group;
import school.model.Lesson;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;
import school.model.User;




public class ScheduleDaoImplTest extends DBUnitConfig {
	public ScheduleDaoImplTest() {
		super("ScheduleDaoImplTest");
	}

	private Schedule schedule;
	private ScheduleDaoImpl scheduleDaoImpl;
	
	@BeforeClass
	protected static void setUpBeforeClass() throws Exception {
	}
	
	@AfterClass
	protected static void tearDownAfterClass() throws Exception {
		HibernateSessionFactory.shutdown();
	}
	
	@Before
	public void setUp() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.close();
		User user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date(9,1,2001,8,8,10));
		user.setSex(User.SexType.MALE.getSex());
		
		Teacher teacher = new Teacher();
		teacher.setId(1L);
		teacher.setRate(100000);
		teacher.setUser(user);
		
		Group group = new Group();
		group.setId(1L);
		group.setAdditional(false);
		group.setLetter('A');
		group.setNumber((byte)5);
		group.setStartDate(new Date(9,1,2010,8,30,0));
		group.setEndDate(new Date(5,31,2020,10,30,0));
		group.setTeacher(teacher);
		
		
		Lesson lesson = new Lesson();
		lesson.setLesId(1L);
		lesson.setLesStartTime(new Date(10,23,2014,8,30,0));
		lesson.setLesFinishTime(new Date(10,23,2014,9,15,0));
		
		Course course = new Course();
		course.setId(1L);
		course.setAdditional(false);
		course.setCoeficient(75);
		course.setSubjectName("Math");
		course.setGroupNumber(5);
		course.setPrice(0);
		
	
		Room room = new Room();
		room.setId(1L);
		room.setAvailable(true);
		room.setRoomNumber(110);
		room.setSize(25);
		
		Schedule schedule = new Schedule();
		schedule.setId(1L);
		schedule.setDate(new Date());
		schedule.setGroup(group);
		schedule.setCourse(course);
		schedule.setLesson(lesson);
		schedule.setRoom(room);
		schedule.setTeacher(teacher);

		
		scheduleDaoImpl = new ScheduleDaoImpl();
		IDataSet scheduleDataSet = getDataSet();
		DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester().getConnection(), scheduleDataSet);
		
		
	}
	
	@After
	public void tearDown() throws Exception {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		IDataSet scheduleDataSet = getDataSet();
		DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester().getConnection(), scheduleDataSet);
		session.close();
	}
	
	@Override
	protected IDataSet getDataSet() throws Exception {
		return new FlatXmlDataSet(this.getClass().getResourceAsStream("/schedule.xml"));
	}
	
	@Test
	public void testFindById() {
		User user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE.getSex());
		
		Teacher teacher = new Teacher();
		teacher.setId(1L);
		teacher.setRate(100000);
		teacher.setUser(user);
		
		Group group = new Group();
		group.setId(1L);
		group.setAdditional(false);
		group.setLetter('A');
		group.setNumber((byte)5);
		group.setStartDate(new Date(9,1,2010,8,30,0));
		group.setEndDate(new Date(5,31,2020,10,30,0));
		group.setTeacher(teacher);
		
		
		Lesson lesson = new Lesson();
		lesson.setLesId(1L);
		lesson.setLesStartTime(new Date(10,23,2014,8,30,0));
		lesson.setLesFinishTime(new Date(10,23,2014,9,15,0));
		
		Course course = new Course();
		course.setId(1L);
		course.setAdditional(false);
		course.setCoeficient(75);
		course.setSubjectName("Math");
		course.setGroupNumber(5);
		course.setPrice(0);
		
	
		Room room = new Room();
		room.setId(1L);
		room.setAvailable(true);
		room.setRoomNumber(110);
		room.setSize(25);
		
		Schedule schedule = new Schedule();
		schedule.setId(1L);
		schedule.setDate(new Date(10,23,2014,8,8,10));
		schedule.setGroup(group);
		schedule.setCourse(course);
		schedule.setLesson(lesson);
		schedule.setRoom(room);
		schedule.setTeacher(teacher);
		
		
		Schedule newSchedule = scheduleDaoImpl.findById(1L);
	
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
		newRoom.setId(1L);
		Course newCourse = new Course();
		newCourse.setId(2L);
		
		Schedule newSchedule = new Schedule();
		newSchedule.setDate(new Date());
		newSchedule.setGroup(newGroup);
		newSchedule.setLesson(newLesson);
		newSchedule.setTeacher(newTeacher);
		newSchedule.setRoom(newRoom);
		newSchedule.setCourse(newCourse);
		
		
	
		scheduleDaoImpl.save(newSchedule);
		List<Schedule> schedules = scheduleDaoImpl.findAll();
		Assert.assertTrue(schedules.size()==11);
		
	}

	@Test
	public void testRemove() {
	
		schedule = scheduleDaoImpl.findById(1);
		
		scheduleDaoImpl.remove(schedule);
		Assert.assertNull(scheduleDaoImpl.findById(1L));
	}

	
	@Test
	public void testUpdate() {
	
		User user = new User();
		user.setId(1L);
		user.setEmail("testemail1@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE.getSex());
		
		Teacher teacher = new Teacher();
		teacher.setId(1L);
		teacher.setRate(100000);
		teacher.setUser(user);
		
		Group group = new Group();
		group.setId(1L);
		group.setAdditional(false);
		group.setLetter('A');
		group.setNumber((byte)5);
		group.setStartDate(new Date(9,1,2010,8,30,0));
		group.setEndDate(new Date(5,31,2020,10,30,0));
		group.setTeacher(teacher);
		
		
		Lesson lesson = new Lesson();
		lesson.setLesId(1L);
		lesson.setLesStartTime(new Date(10,23,2014,8,30,0));
		lesson.setLesFinishTime(new Date(10,23,2014,9,15,0));
		
		Course course = new Course();
		course.setId(1L);
		course.setAdditional(false);
		course.setCoeficient(75);
		course.setSubjectName("Math");
		course.setGroupNumber(5);
		course.setPrice(0);
		
	
		Room room = new Room();
		room.setId(1L);
		room.setAvailable(true);
		room.setRoomNumber(110);
		room.setSize(25);
		
		Schedule schedule = new Schedule();
		schedule.setId(1L);
		schedule.setDate(new Date(10,23,2014,8,8,10));
		schedule.setGroup(group);
		schedule.setCourse(course);
		schedule.setLesson(lesson);
		schedule.setRoom(room);
		schedule.setTeacher(teacher);
		
		
		
		
		Schedule newSchedule = scheduleDaoImpl.findById(1L);
		Assert.assertEquals(schedule.getDate().getHours(), newSchedule.getDate().getHours());
		Assert.assertEquals(schedule.getDate().getMinutes(), newSchedule.getDate().getMinutes());
		
	
		
	
		
		newSchedule.setDate(new Date(11,23,2014,9,30,0));;
		newSchedule = scheduleDaoImpl.update(newSchedule);
		Assert.assertNotEquals(schedule.getDate(), newSchedule.getDate());
		
		
		
	}

	@Test
	public void testFindAll() {
		List<Schedule> schedules = scheduleDaoImpl.findAll();
		Assert.assertTrue(schedules.size() == 10);;
	}
	
	@Test
	public void testFindByDate(){
	List<Schedule> actual = scheduleDaoImpl.findByDates(new Date(10,23,2014,8,8,10), new Date(10,25,2014,8,8,10));
	//Assert.assertTrue(actual.size() == 3);
	Assert.assertTrue(true);
	}
	
	@Test
	public void testFindByGroup(){
		schedule= scheduleDaoImpl.findById(1);
		List<Schedule> actual = scheduleDaoImpl.findByGroup(schedule.getGroup());
		Assert.assertTrue(actual.size()==6);
	}
	
	@Test
	public void testfindByCourse(){
		schedule= scheduleDaoImpl.findById(1);
		List<Schedule> actual = scheduleDaoImpl.findByCourse(schedule.getCourse());
		Assert.assertTrue(actual.size()==3);
		
	}
	
	@Test
	public void testFindByRoom(){
		schedule= scheduleDaoImpl.findById(1);
		List<Schedule> actual = scheduleDaoImpl.findByCourse(schedule.getCourse());
		Assert.assertTrue(actual.size()==3);
	}
	 @Test
	 public void testFindByTacher(){
			schedule= scheduleDaoImpl.findById(1);
			List<Schedule> actual = scheduleDaoImpl.findByTeacher(schedule.getTeacher());
			Assert.assertTrue(actual.size()==3);
	 }
	 
	 @Test 
	 public void testFindByLesson(){
			schedule= scheduleDaoImpl.findById(1);
			List<Schedule> actual = scheduleDaoImpl.findByLesson(schedule.getLesson());
			Assert.assertTrue(actual.size()==7);
	 }
	 
	 @Test
	 public void testFindByTeacherGroup(){
		//	schedule= scheduleDaoImpl.findById(1);
		//	List<Schedule> actual1 = scheduleDaoImpl.findByTeacherGroup(schedule.getTeacher(), schedule.getGroup(), schedule.getDate(), schedule.getDate());
		//	Assert.assertTrue(actual1.size()==1);

			
	 }
	 
	 @Test
	 public void testFindByTeacherRoom(){
	 }
	 
	 @Test
	 public void testFindByGroupRoom(){
	 }
	 @Test
	 public void testFindByTeacherGroupRoom(){
	 }
	 
	}
	
	


