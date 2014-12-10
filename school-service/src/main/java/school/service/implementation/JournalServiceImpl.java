package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import school.model.Lesson;
import school.model.Role;
import school.model.Schedule;
import school.model.Student;
import school.model.Teacher;
import school.model.User;
import school.service.JournalService;
import school.service.utils.JournalUtil;

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

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public JournalStaffDTO getStaffInfo(long userId, String role) {

		List<Schedule> schedules = null;

		if (role.equals(Role.Secured.TEACHER)) {

			schedules = scheduleDao.findByTeacher(teacherDao
					.findByUserId(userId));

		} else if (role.equals(Role.Secured.HEAD_TEACHER)
				|| role.equals(Role.Secured.DIRECTOR)) {

			schedules = scheduleDao.findAll();
		}

		Set<String> courses = new TreeSet<>();
		Set<Byte> groupNumbers = new TreeSet<>();
		Set<Character> groupLetters = new TreeSet<>();

		for (Schedule schedule : schedules) {
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
	public List<StudentWithMarksDTO> getMarksOfGroup(JournalSearch search)
			throws ParseException {

		Group group = groupDao.findByNumberAndLetter(search.getGroupNumber(),
				search.getGroupLetter());
		Date from = getDatesByQuarter(search.getQuarter())[JournalUtil.FIRST_DATE_OF_QUARTER];
		Date to = getDatesByQuarter(search.getQuarter())[JournalUtil.LAST_DATE_OF_QUARTER];

		List<Schedule> schedules = scheduleDao.findByGroupCourseInterval(
				group.getId(), search.getSubject(), from, to);
		Collections.sort(schedules);

		List<StudentWithMarksDTO> studentsWithMarks = new ArrayList<>();
		Set<MarkDTO> marks;

		for (Student student : group.getStudent()) {
			marks = new TreeSet<>();
			for (Schedule schedule : schedules) {

				Journal journal = journalDao.findByStudentAndSchedule(
						student.getId(), schedule.getId());

				HomeTask homeTask = homeTaskDao
						.findBySchedule(schedule.getId());

				Event event = eventDao.findEventBySchedule(schedule.getId());

				if (journal != null) {
					marks.add(new MarkDTO(schedule.getLesson().getId(),
							schedule.getId(), homeTask.getTask(), schedule
									.getDate(), journal.getMark(), journal
									.getCoefficient()));
				} else if (journal == null) {
					marks.add(new MarkDTO(schedule.getLesson().getId(),
							schedule.getId(), homeTask.getTask(), schedule
									.getDate(), event.getType()));
				}
			}
			studentsWithMarks.add(new StudentWithMarksDTO(student.getUser()
					.getId(), student.getId(), getWholeUserName(student
					.getUser().getId()), new Date(), marks));
		}
		Collections.sort(studentsWithMarks);
		return studentsWithMarks;
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	@Transactional
	public void editMark(EditMarkDTO editMarkDTO) {

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
			byte coefficient = JournalUtil.NOTHING;
			if (event == null) {
				coefficient = JournalUtil.REGULAR_MARK;
			} else {
				coefficient = event.getType();
			}
			journalDao.save(new Journal(student, schedule, editMarkDTO
					.getMark(), coefficient, schedule.getDate()));
		}

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

		List<Schedule> schedules = getSchedulesByRoleAndSubject(userId, role,
				subject);

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

		List<Schedule> schedules = getSchedulesByRoleAndSubject(userId, role,
				subject);

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

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.DATE_FORMAT);
		Teacher teacher = teacherDao.findByUserId(userId);
		String quarter = getQuarterByDate(currentDate);
		Date from = getDatesByQuarter(quarter)[JournalUtil.FIRST_DATE_OF_QUARTER];
		Date to = getDatesByQuarter(quarter)[JournalUtil.LAST_DATE_OF_QUARTER];
		List<Long> datesValues = new ArrayList<Long>();

		for (Schedule schedule : scheduleDao.findByTeacherInterval(
				teacher.getId(), from, to)) {
			datesValues.add(schedule.getDate().getTime());
		}

		Date closestDate = new Date(JournalUtil.getClosestValue(dateFormat
				.parse(dateFormat.format(currentDate)).getTime(), datesValues));

		List<Lesson> lessons = new ArrayList<>();

		for (Schedule schedule : scheduleDao.findByTeacherInterval(
				teacher.getId(), closestDate, closestDate)) {
			lessons.add(schedule.getLesson());
		}

		Schedule schedule = scheduleDao.findByTeacherDateLesson(
				teacher.getId(), closestDate,
				getClosestLesson(currentDate, lessons));
		return new JournalSearch(schedule.getCourse().getCourseName(), schedule
				.getGroup().getNumber(), schedule.getGroup().getLetter(),
				quarter);

	}

	private long getClosestLesson(Date date, List<Lesson> lessons)
			throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.HOURS_OF_DATE);

		List<Long> lessonsValues = new ArrayList<>();
		for (Lesson lesson : lessons) {
			lessonsValues.add(lesson.getId());
		}

		return JournalUtil.getClosestValue(
				dateFormat.parse(dateFormat.format(date)).getTime(),
				lessonsValues);
	}

	private List<Schedule> getSchedulesByRoleAndSubject(long userId,
			String role, String subject) {

		if (role.equals(Role.Secured.TEACHER)) {

			return scheduleDao.findByTeacherAndCourse(
					teacherDao.findByUserId(userId).getId(), subject);

		}
		if (role.equals(Role.Secured.HEAD_TEACHER)
				|| role.equals(Role.Secured.DIRECTOR)) {

			return scheduleDao.findByCourse(subject);

		}
		return null;
	}

	private String getWholeUserName(long userId) {

		User user = userDao.findById(userId);

		return user.getFirstName() + " " + user.getLastName();
	}

	private String getQuarterByDate(Date date) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.UI_DATE_FORMAT);

		if (date.before(dateFormat.parse(JournalUtil.FIRST_DAY_SECOND_QUARTER))) {
			return JournalUtil.FIRST_QUARTER;
		} else if (date.after(dateFormat
				.parse(JournalUtil.LAST_DAY_FIRST_QUARTER))
				&& date.before(dateFormat
						.parse(JournalUtil.FIRST_DAY_THIRD_QUARTER))) {
			return JournalUtil.SECOND_QUARTER;
		} else if (date.after(dateFormat
				.parse(JournalUtil.LAST_DAY_SECOND_QUARTER))
				&& date.before(dateFormat
						.parse(JournalUtil.FIRST_DAY_FOURTH_QUARTER))) {
			return JournalUtil.THIRD_QUARTER;
		} else if (date.after(dateFormat
				.parse(JournalUtil.LAST_DAY_THIRD_QUARTER))) {
			return JournalUtil.FOURTH_QUARTER;
		}
		return null;
	}

	private Date[] getDatesByQuarter(String quarter) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.UI_DATE_FORMAT);
		Date[] dates = new Date[JournalUtil.FIRST_AND_LAST_DATE_OF_QUARTER];

		switch (quarter) {

		case JournalUtil.FIRST_QUARTER:

			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_FIRST_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_FIRST_QUARTER);
			break;

		case JournalUtil.SECOND_QUARTER:

			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_SECOND_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_SECOND_QUARTER);
			break;

		case JournalUtil.THIRD_QUARTER:

			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_THIRD_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_THIRD_QUARTER);
			break;

		case JournalUtil.FOURTH_QUARTER:

			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_FOURTH_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_FOURTH_QUARTER);
			break;
		}
		//
		// if (quarter.equals(JournalUtil.FIRST_QUARTER)) {
		// dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.FIRST_DAY_FIRST_QUARTER);
		// dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.LAST_DAY_FIRST_QUARTER);
		// } else if (quarter.equals(JournalUtil.SECOND_QUARTER)) {
		// dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.FIRST_DAY_SECOND_QUARTER);
		// dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.LAST_DAY_SECOND_QUARTER);
		// } else if (quarter.equals(JournalUtil.THIRD_QUARTER)) {
		// dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.FIRST_DAY_THIRD_QUARTER);
		// dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.LAST_DAY_THIRD_QUARTER);
		// } else if (quarter.equals(JournalUtil.FOURTH_QUARTER)) {
		// dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.FIRST_DAY_FOURTH_QUARTER);
		// dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
		// .parse(JournalUtil.LAST_DAY_FOURTH_QUARTER);
		// }
		return dates;
	}

}
