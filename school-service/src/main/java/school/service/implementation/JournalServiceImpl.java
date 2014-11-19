package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.inject.Inject;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.GroupDao;
import school.dao.JournalDao;
import school.dao.LessonDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.journal.StudentMarksDTO;
import school.dto.journal.JournalTeacherDTO;
import school.dto.journal.MarkDTO;
import school.model.Group;
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
	private LessonDao lessonDao;
	@Inject
	private StudentDao studentDao;

	@Secured(Role.Secured.TEACHER)
	@Transactional
	public JournalTeacherDTO getTeacherInfo(String id) {

		long userId = Long.parseLong(id);
		Teacher teacher = teacherDao.findByUserId(userId);
		List<Schedule> schedules = scheduleDao.findByTeacher(teacher);

		Set<Group> groups = new TreeSet<Group>();
		Set<String> courses = new TreeSet<String>();

		for (Schedule schedule : schedules) {
			groups.add(schedule.getGroup());
			courses.add(schedule.getCourse().getCourseName());
		}

		return new JournalTeacherDTO(teacher.getId(), getWholeUserName(userId),
				groups, courses);
	}

	public List<StudentMarksDTO> getByCurrentLesson(String id, Date currentDate)
			throws ParseException {

		long userId = Long.parseLong(id);
		Teacher teacher = teacherDao.findByUserId(userId);
		Lesson currentLesson = lessonDao.findByCurrentTime(currentDate);

		return null;
	}

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR, Role.Secured.ADMIN })
	@Transactional
	public List<StudentMarksDTO> getMarksOfGroup(String quarter,
			String idGroup, String courseName) throws ParseException {

		long groupId = Long.parseLong(idGroup);
		Group group = groupDao.findById(groupId);
		Date from = getDatesByQuarter(quarter)[JournalUtil.FIRST_DATE_OF_QUARTER];
		Date to = getDatesByQuarter(quarter)[JournalUtil.LAST_DATE_OF_QUARTER];

		List<Schedule> schedules = scheduleDao.findByGroupCourseInterval(
				groupId, courseName, from, to);
		Collections.sort(schedules);
		List<StudentMarksDTO> studentsWithMarks = new ArrayList<StudentMarksDTO>();
		Set<MarkDTO> marks = new TreeSet<MarkDTO>();

		int countId = 0;
		for (Student student : group.getStudent()) {
			marks = new TreeSet<MarkDTO>();
			for (Schedule schedule : schedules) {
				countId++;
				Journal journal = journalDao.findByStudentAndSchedule(
						student.getId(), schedule.getId());
				if (journal != null) {
					marks.add(new MarkDTO(countId, schedule, journal));
				} else if (journal == null) {
					marks.add(new MarkDTO(countId, schedule, new Journal()));
				}
			}
			studentsWithMarks.add(new StudentMarksDTO(student.getId(),
					getWholeUserName(student.getUser().getId()), group, marks));
		}
		return studentsWithMarks;
	}

	public List<StudentMarksDTO> addMark(String studentAndSchedule,
			String mark, String note, String coefficient) throws ParseException {

		String[] studAndSched = studentAndSchedule.split(";");

		Student student = studentDao.findById(Long.parseLong(studAndSched[0]));

		Schedule schedule = scheduleDao.findById(Long
				.parseLong(studAndSched[1]));

		Journal journal = new Journal();
		journal.setSchedule(schedule);
		journal.setStudent(student);
		journal.setMark(Byte.parseByte(mark));
		journal.setDate(schedule.getDate());
		journal.setCoefficient(Byte.parseByte(coefficient));

		journalDao.update(journal);

		return getMarksOfGroup(getQuarterByDate(schedule.getDate()),
				String.valueOf(student.getGroup().getId()), schedule
						.getCourse().getCourseName());
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
