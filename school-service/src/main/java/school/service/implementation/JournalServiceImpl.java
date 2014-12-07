package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.inject.Inject;

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
import school.dto.journal.Mark2DTO;
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

	@Inject
	private JournalDao journalDao;
	@Inject
	private ScheduleDao scheduleDao;
	@Inject
	private UserDao userDao;
	@Inject
	private TeacherDao teacherDao;
	@Inject
	private GroupDao groupDao;
	@Inject
	private StudentDao studentDao;
	@Inject
	private EventDao eventDao;
	@Inject
	private HomeTaskDao homeTaskDao;

	@Secured(Role.Secured.TEACHER)
	@Transactional
	public JournalStaffDTO getTeacherInfo(String id) {

		long userId = Long.parseLong(id);
		Teacher teacher = teacherDao.findByUserId(userId);
		List<Schedule> schedules = scheduleDao.findByTeacher(teacher);

		Set<String> courses = new TreeSet<String>();
		Set<Byte> groupNumbers = new TreeSet<Byte>();
		Set<Character> groupLetters = new TreeSet<Character>();

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
		List<StudentWithMarksDTO> studentsWithMarks = new ArrayList<StudentWithMarksDTO>();
		Set<Mark2DTO> marks = new HashSet<Mark2DTO>();

		for (Student student : group.getStudent()) {
			marks = new TreeSet<Mark2DTO>();
			for (Schedule schedule : schedules) {

				Journal journal = journalDao.findByStudentAndSchedule(
						student.getId(), schedule.getId());

				Event event = eventDao.findEventBySchedule(schedule.getId());

				if (journal != null) {
					marks.add(new Mark2DTO(schedule.getId(),
							schedule.getDate(), journal.getMark(), journal
									.getCoefficient()));
				} else if (journal == null) {
					marks.add(new Mark2DTO(schedule.getId(),
							schedule.getDate(), event.getType()));
				}
			}
			studentsWithMarks.add(new StudentWithMarksDTO(student.getId(),
					getWholeUserName(student.getUser().getId()), new Date(),
					marks));
		}
		Collections.sort(studentsWithMarks);
		return studentsWithMarks;
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER })
	public void editMark(EditMarkDTO editMarkDTO) throws ParseException {

		String[] studentAndSchedule = editMarkDTO.getStudentAndSchedule()
				.split("j");

		Student student = studentDao.findById(Long
				.parseLong(studentAndSchedule[0]));
		Schedule schedule = scheduleDao.findById(Long
				.parseLong(studentAndSchedule[1]));

		if (editMarkDTO.getMark() == 0) {
			journalDao.remove(journalDao.findByStudentAndSchedule(
					student.getId(), schedule.getId()));
		} else {
			Event event = eventDao.findEventBySchedule(schedule.getId());
			byte coefficient = 0;
			if (event == null) {
				coefficient = 1;
			} else {
				coefficient = event.getType();
			}
			journalDao.save(new Journal(student, schedule, editMarkDTO
					.getMark(), coefficient, schedule.getDate()));
		}

	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR })
	public void editDate(EditDateDTO editedDateDTO) {

		Schedule schedule = scheduleDao.findById(editedDateDTO.getScheduleId());

		if (editedDateDTO.getEventType() != 0) {
			eventDao.save(new Event(schedule, editedDateDTO.getEventType(),
					editedDateDTO.getEventDescription()));
		}
		
		if (editedDateDTO.getHomeTask() != "") {
			homeTaskDao.save(new HomeTask(schedule.getGroup(), editedDateDTO
					.getHomeTask(), schedule));
		}

	}

	public JournalStaffDTO seniorStaffInfo(String id) {

		long userId = Long.parseLong(id);

		List<Schedule> schedules = scheduleDao.findAll();

		Set<Group> groups = new TreeSet<Group>();
		Set<String> courses = new TreeSet<String>();

		for (Schedule schedule : schedules) {
			groups.add(schedule.getGroup());
			courses.add(schedule.getCourse().getCourseName());
		}

		return new JournalStaffDTO(userId, getWholeUserName(userId), groups,
				courses);
	}

	public Set<String> getGroupNumbers(String id, String subject) {

		List<Schedule> schedules = scheduleDao.findByTeacher(teacherDao
				.findByUserId(Long.parseLong(id)));
		Set<String> groupNumbers = new TreeSet<String>();
		for (Schedule schedule : schedules) {
			if (schedule.getCourse().getCourseName()
					.equals(subject.substring(0, subject.length() - 1))) {
				groupNumbers.add(String
						.valueOf(schedule.getGroup().getNumber()));
			}
		}
		return groupNumbers;
	}

	public Set<String> getGroupLetters(String id, String number) {

		List<Schedule> schedules = scheduleDao.findByTeacher(teacherDao
				.findByUserId(Long.parseLong(id)));
		Set<String> groupLetters = new TreeSet<String>();
		for (Schedule schedule : schedules) {
			if (schedule.getGroup().getNumber() == Byte.parseByte(number
					.substring(0, number.length() - 1))) {
				groupLetters.add(String
						.valueOf(schedule.getGroup().getLetter()));
			}
		}
		return groupLetters;
	}

	public JournalSearch getDeafaultData(String id, Date currentDate)
			throws ParseException {

		long userId = Long.parseLong(id);
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd:MM:yyyy");
		Teacher teacher = teacherDao.findByUserId(userId);
		String quarter = getQuarterByDate(currentDate);
		Date from = getDatesByQuarter(quarter)[JournalUtil.FIRST_DATE_OF_QUARTER];
		Date to = getDatesByQuarter(quarter)[JournalUtil.LAST_DATE_OF_QUARTER];
		List<Long> datesValues = new ArrayList<Long>();

		for (Schedule schedule : scheduleDao.findByTeacherInterval(
				teacher.getId(), from, to)) {
			datesValues.add(schedule.getDate().getTime());
		}

		Date closestDate = new Date(JournalUtil.getClosestValue(
				currentDate.getTime(), datesValues));

		List<Lesson> lessons = new ArrayList<Lesson>();

		for (Schedule schedule : scheduleDao.findByTeacherInterval(
				teacher.getId(),
				dateFormat.parse(dateFormat.format(closestDate)),
				dateFormat.parse(dateFormat.format(closestDate)))) {
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

		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

		List<Long> lessonsValues = new ArrayList<Long>();
		for (Lesson lesson : lessons) {
			lessonsValues.add(lesson.getLesId());
		}

		return JournalUtil.getClosestValue(
				dateFormat.parse(dateFormat.format(date)).getTime(),
				lessonsValues);
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
		return "0";
	}

	private Date[] getDatesByQuarter(String quarter) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.UI_DATE_FORMAT);
		Date[] dates = new Date[JournalUtil.FIRST_AND_LAST_DATE_OF_QUARTER];

		if (quarter.equals(JournalUtil.FIRST_QUARTER)) {
			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_FIRST_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_FIRST_QUARTER);
		} else if (quarter.equals(JournalUtil.SECOND_QUARTER)) {
			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_SECOND_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_SECOND_QUARTER);
		} else if (quarter.equals(JournalUtil.THIRD_QUARTER)) {
			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_THIRD_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_THIRD_QUARTER);
		} else if (quarter.equals(JournalUtil.FOURTH_QUARTER)) {
			dates[JournalUtil.FIRST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.FIRST_DAY_FOURTH_QUARTER);
			dates[JournalUtil.LAST_DATE_OF_QUARTER] = dateFormat
					.parse(JournalUtil.LAST_DAY_FOURTH_QUARTER);
		}
		return dates;
	}

}
