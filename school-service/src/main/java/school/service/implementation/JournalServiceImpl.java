package school.service.implementation;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.EventDao;
import school.dao.GroupDao;
import school.dao.HomeTaskDao;
import school.dao.JournalDao;
import school.dao.LessonDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.journal.EditMarkDTO;
import school.dto.journal.EditDateDTO;
import school.dto.journal.JournalSearch;
import school.dto.journal.MarkDTO;
import school.dto.journal.JournalStaffDTO;
import school.dto.journal.StudentWithMarksDTO;
import school.model.Event;
import school.model.Group;
import school.model.HomeTask;
import school.model.Journal;
import school.model.Role;
import school.model.Schedule;
import school.model.Student;
import school.model.Teacher;
import school.model.User;
import school.service.JournalService;
import school.service.ScheduleService;
import school.service.utils.DateUtil;
import school.service.utils.JournalUtil;

/**
 * This class realizes all journal possibilities:
 * 
 * - getting current teacher's lesson (or closest one);
 * 
 * - getting all info about teacher (subjects, groups that he deals with);
 * 
 * - editing student's marks (add/delete);
 * 
 * - editing date events and home tasks to some group(add/delete);
 *
 * @author Ihor Uksta
 * 
 */
@Service
public class JournalServiceImpl implements JournalService {

	@Autowired
	private JournalDao journalDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private TeacherDao teacherDao;
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private EventDao eventDao;
	@Autowired
	private HomeTaskDao homeTaskDao;
	@Autowired
	private LessonDao lessonDao;
	@Autowired
	private ScheduleService scheduleService;

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public JournalStaffDTO getStaffInfo(long userId, String role) {

		Set<String> courses = new TreeSet<>();
		Set<Byte> groupNumbers = new TreeSet<>();
		Set<Character> groupLetters = new TreeSet<>();

		for (Schedule schedule : scheduleService.getSchedulesByRole(userId,
				role)) {
			groupNumbers.add(schedule.getGroup().getNumber());
			groupLetters.add(schedule.getGroup().getLetter());
			courses.add(schedule.getCourse().getCourseName());
		}
		return new JournalStaffDTO(userId, getWholeUserName(userId),
				groupNumbers, groupLetters, courses);
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR, Role.Secured.ADMIN })
	@Transactional
	public List<StudentWithMarksDTO> getMarksOfGroup(JournalSearch search) {
		Group group = groupDao.findByNumberAndLetter(search.getGroupNumber(),
				search.getGroupLetter());

		List<StudentWithMarksDTO> studentsWithMarks = new ArrayList<>();
		for (Student student : group.getStudent()) {

			Set<MarkDTO> marks = getStudentsMarks(
					scheduleService.getSchedulesForStudentMarks(search, group),
					student);

			studentsWithMarks.add(new StudentWithMarksDTO(student.getUser()
					.getId(), student.getId(), getWholeUserName(student
					.getUser().getId()), JournalUtil.getQuarterMark(marks),
					new Date(), marks));
		}
		Collections.sort(studentsWithMarks);
		return studentsWithMarks;
	}

	/**
	 * @author Ihor Uksta
	 * 
	 *         This method gets all marks, home tasks and events of some chosen
	 *         student by chosen schedules.
	 * 
	 * @param schedules
	 * @param student
	 * @return Set<MarkDTO>
	 * @throws Exception
	 */
	private Set<MarkDTO> getStudentsMarks(List<Schedule> schedules,
			Student student) {
		Set<MarkDTO> marks = new TreeSet<>();
		for (Schedule schedule : schedules) {
			Journal journal = journalDao.findByStudentAndSchedule(
					student.getId(), schedule.getId());
			HomeTask homeTask = homeTaskDao.findBySchedule(schedule.getId());
			Event event = eventDao.findEventBySchedule(schedule.getId());
			marks.add(new MarkDTO(schedule.getLesson().getId(), schedule
					.getId(), schedule.getCourse().getCourseName(), homeTask
					.getTask(), schedule.getDate(), journal.getMark(), event
					.getType()));
		}
		return marks;
	}

	private EditMarkDTO reCalculateQuarterMark(EditMarkDTO editMarkDTO,
			Student student) {
		List<Schedule> schedules = scheduleService.getSchedulesForStudentMarks(
				editMarkDTO.getSearchData(), student.getGroup());
		Set<MarkDTO> marks = getStudentsMarks(schedules, student);
		editMarkDTO.setStudentId(student.getId());
		editMarkDTO.setQuarterMark(JournalUtil.getQuarterMark(marks));
		return editMarkDTO;
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public EditMarkDTO editMark(EditMarkDTO editMarkDTO) {

		String[] studentAndSchedule = editMarkDTO.getStudentAndSchedule()
				.split(JournalUtil.SPLITTER);
		Student student = studentDao.findById(Long
				.parseLong(studentAndSchedule[0]));
		Schedule schedule = scheduleDao.findById(Long
				.parseLong(studentAndSchedule[1]));

		if (editMarkDTO.getMark() == JournalUtil.NOTHING) {
			journalDao.remove(journalDao.findByStudentAndSchedule(
					student.getId(), schedule.getId()));
		} else {
			Event event = eventDao.findEventBySchedule(schedule.getId());
			journalDao.save(new Journal(student, schedule, editMarkDTO
					.getMark(), event.getType(), schedule.getDate()));
		}
		return reCalculateQuarterMark(editMarkDTO, student);
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public void editDate(EditDateDTO editedDateDTO) {
		Schedule schedule = scheduleDao.findById(editedDateDTO.getScheduleId());

		if (editedDateDTO.getEventType() != JournalUtil.NOTHING) {
			eventDao.save(new Event(schedule, editedDateDTO.getEventType(),
					editedDateDTO.getEventDescription()));
		}
		if (editedDateDTO.getHomeTask() != JournalUtil.EMPTY) {
			homeTaskDao.save(new HomeTask(schedule.getGroup(), editedDateDTO
					.getHomeTask(), schedule));
		}
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	public void deleteEvent(EditDateDTO editedDateDTO) {
		eventDao.remove(eventDao.findEventBySchedule(scheduleDao.findById(
				editedDateDTO.getScheduleId()).getId()));
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	public void deleteHomeTask(EditDateDTO editedDateDTO) {
		homeTaskDao.remove(homeTaskDao.findBySchedule(scheduleDao.findById(
				editedDateDTO.getScheduleId()).getId()));
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public Set<Byte> getGroupNumbers(long userId, String role, String subject) {

		List<Schedule> schedules = scheduleService
				.getSchedulesByRoleAndSubject(userId, role, subject);

		Set<Byte> groupNumbers = new TreeSet<>();
		for (Schedule schedule : schedules) {
			groupNumbers.add(schedule.getGroup().getNumber());
		}
		return groupNumbers;
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public Set<Character> getGroupLetters(long userId, String role,
			String subject, byte number) {

		List<Schedule> schedules = scheduleService
				.getSchedulesByRoleAndSubject(userId, role, subject);

		Set<Character> groupLetters = new TreeSet<>();
		for (Schedule schedule : schedules) {
			if (schedule.getGroup().getNumber() == number) {
				groupLetters.add(schedule.getGroup().getLetter());
			}
		}
		return groupLetters;
	}

	@Secured({ Role.Secured.TEACHER })
	@Transactional
	public JournalSearch getDeafaultData(long userId, Date currentDate)
			throws ParseException {
		Teacher teacher = teacherDao.findByUserId(userId);
		Date closestDate = getClosestDate(
				JournalUtil.getDateWithoutHours(currentDate), teacher.getId());
		Schedule schedule = getClosestSchedule(currentDate, closestDate,
				teacher.getId());

		return new JournalSearch(schedule.getCourse().getCourseName(), schedule
				.getGroup().getNumber(), schedule.getGroup().getLetter(),
				JournalUtil.getQuarterByDate(currentDate));
	}

	private Schedule getClosestSchedule(Date currentDate, Date closestDate,
			long teacherId) throws ParseException {
		if (closestDate.before(JournalUtil.getDateWithoutHours(currentDate))) {
			return scheduleDao.findByTeacherDateLesson(teacherId, closestDate,
					getClosestLesson(8, closestDate, teacherId));
		} else if (closestDate.after(JournalUtil
				.getDateWithoutHours(currentDate))) {
			return scheduleDao.findByTeacherDateLesson(teacherId, closestDate,
					getClosestLesson(0, closestDate, teacherId));
		} else {
			return scheduleDao.findByTeacherDateLesson(
					teacherId,
					closestDate,
					getClosestLesson(JournalUtil.getHoursOfDate(currentDate)
							.getTime(), closestDate, teacherId));
		}
	}

	private Date getClosestDate(Date currentDate, long teacherId) {

		Date from = DateUtil.addOrDelDays(currentDate, JournalUtil.DAYS_DEFORE);
		Date to = DateUtil.addOrDelDays(currentDate, JournalUtil.DAYS_AFTER);
		List<Long> datesValues = new ArrayList<Long>();
		for (Schedule schedule : scheduleDao.findByTeacherInterval(teacherId,
				from, to)) {
			datesValues.add(schedule.getDate().getTime());
		}
		return new Date(JournalUtil.getClosestValue(currentDate.getTime(),
				datesValues));
	}

	private long getClosestLesson(long currentDate, Date closestDate,
			long teacherId) {
		List<Long> lessonsValues = new ArrayList<>();
		for (Schedule schedule : scheduleDao.findByTeacherInterval(teacherId,
				closestDate, closestDate)) {
			lessonsValues.add(schedule.getLesson().getId());
		}
		return JournalUtil.getClosestValue(currentDate, lessonsValues);
	}

	/**
	 * This method unites user's first and last names to one string.
	 * 
	 * @param userId
	 * @return String - user name
	 */
	private String getWholeUserName(long userId) {
		User user = userDao.findById(userId);
		return user.getFirstName() + " " + user.getLastName();
	}
}
