package school.service.implementation;

import static org.mockito.Mockito.when;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import school.dao.EventDao;
import school.dao.GroupDao;
import school.dao.HomeTaskDao;
import school.dao.JournalDao;
import school.dao.LessonDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.journal.JournalStaffDTO;
import school.model.Course;
import school.model.Group;
import school.model.Role;
import school.model.Schedule;
import school.model.User;

public class JournalServiceImplTest {

	@InjectMocks
	private JournalServiceImpl journalService = new JournalServiceImpl();
	@Mock
	private JournalDao journalDao;
	@Mock
	private ScheduleDao scheduleDao;
	@Mock
	private UserDao userDao;
	@Mock
	private TeacherDao teacherDao;
	@Mock
	private GroupDao groupDao;
	@Mock
	private StudentDao studentDao;
	@Mock
	private EventDao eventDao;
	@Mock
	private HomeTaskDao homeTaskDao;
	@Mock
	private LessonDao lessonDao;
	@Mock
	private ScheduleServiceImpl scheduleService = new ScheduleServiceImpl();

	@Before
	public void initMocks() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testGetStaffInfo() throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		// Method tested = journalService.getClass().getDeclaredMethod(
		// "getWholeUserName", long.class);
		// tested.setAccessible(true);
		// tested.invok
		User user = new User();
		user.setFirstName("firstName");
		user.setLastName("lastName");
		when(userDao.findById(1L)).thenReturn(user);
		List<Schedule> schedules = new ArrayList<>();
		Schedule schedule = new Schedule();

		Course course = new Course();
		course.setCourseName("courseName");
		schedule.setCourse(course);

		Group group = new Group();
		group.setNumber((byte) 5);
		group.setLetter('B');
		schedule.setGroup(group);

		Set<String> courseNames = new TreeSet<>();
		courseNames.add(schedule.getCourse().getCourseName());
		Set<Byte> groupNumbers = new TreeSet<>();
		groupNumbers.add(schedule.getGroup().getNumber());
		Set<Character> groupLetters = new TreeSet<>();
		groupLetters.add(schedule.getGroup().getLetter());

		schedules.add(schedule);

		JournalStaffDTO actualStaffDTO = new JournalStaffDTO(1L,
				"firstName lastName", groupNumbers, groupLetters, courseNames);

		when(scheduleService.getSchedulesByRole(1L, Role.Secured.TEACHER))
				.thenReturn(schedules);
		JournalStaffDTO expecteStaffDTo = journalService.getStaffInfo(1L,
				Role.Secured.TEACHER);
		Assert.assertTrue(actualStaffDTO.getName().equals(
				expecteStaffDTo.getName()));
		Assert.assertTrue(actualStaffDTO.getId() == expecteStaffDTo.getId());
		Assert.assertTrue(actualStaffDTO.equals(expecteStaffDTo));
	}
	
}
