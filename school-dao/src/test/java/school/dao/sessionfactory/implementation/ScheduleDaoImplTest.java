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
	private Date dateN;
	private Date from;
	private Date till;
	
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
		course.setSubjectName("Math");
		course.setGroupNumber(5);
		course.setPrice(0);
		Room room = new Room();
		room.setId(1L);
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
		Schedule newSchedule = scheduleDaoImpl.findById(1L);
		Assert.assertEquals(schedule.getDate(), newSchedule.getDate());
		newSchedule.setDate(dateN);;
		newSchedule = scheduleDaoImpl.update(newSchedule);
		Assert.assertNotEquals(schedule.getDate(), newSchedule.getDate());
	}

	@Test
	public void testFindAll() {
		List<Schedule> schedules = scheduleDaoImpl.findAll();
		Assert.assertTrue(schedules.size() == 10);;
	}
	
	@Test
	public void testFindByDates(){
		List<Schedule> actual = scheduleDaoImpl.findByDates(from, till);
		Assert.assertTrue(actual.size() == 7);
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
	 public void testFindByTeacherGroupInterval(){
		List<Schedule> actual = scheduleDaoImpl.findByTeacherGroupInterval(1,1,from,till);
		Assert.assertTrue(actual.size()==2);
	 }
	 
	 @Test
	 public void testFindByTeacherRoomInterval(){
		List<Schedule> actual = scheduleDaoImpl.findByTeacherRoomInterval(1,1,from,till);
		Assert.assertTrue(actual.size()==2);
	 }
	 
	 @Test
	 public void testFindByGroupRoomInterval(){
		List<Schedule> actual = scheduleDaoImpl.findByGroupRoomInterval(1,1,from,till);
		Assert.assertTrue(actual.size()==2);
	 }
	 
	 @Test
	 public void testFindByTeacherGroupRoomInterval(){
		List<Schedule> actual = scheduleDaoImpl.findByTeacherGroupRoomInterval(1,1,1,from,till);
		Assert.assertTrue(actual.size()==2);
	 }
	 
	}
	
	


