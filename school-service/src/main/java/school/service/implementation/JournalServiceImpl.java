package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.inject.Inject;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.GroupDao;
import school.dao.JournalDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.JournalTeacherDto;
import school.model.Course;
import school.model.Group;
import school.model.Journal;
import school.model.Schedule;
import school.model.Student;
import school.model.Teacher;
import school.model.User;
import school.service.JournalService;

@Service
public class JournalServiceImpl implements JournalService {

	@Inject
	private JournalDao journalDao;
	@Inject
	private ScheduleDao scheduleDao;
	@Inject
	private GroupDao groupDao;
	@Inject
	private StudentDao studentDao;
	@Inject
	private TeacherDao teacherDao;
	@Inject
	UserDao userDao;

	@Transactional
	public List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till) {
		return journalDao.findByIntervalAndStudentId(studentId, from, till);
	}

	@Transactional
	public Group findByNumberAndLetter(byte number, char letter) {
		return groupDao.findByNumberAndLetter(number, letter);
	}

	@Transactional
	public List<Schedule> getSchedulesByTeacherId(Teacher teacher) {
		return scheduleDao.findByTeacher(teacher);
	}

	@Transactional
	public Teacher getTeacherByUserId(long userId) {
		return teacherDao.findByUserId(userId);
	}

	@Transactional
	public JournalTeacherDto getTeacherInfo(long userId) {

		Teacher teacher = teacherDao.findByUserId(userId);
		List<Schedule> schedules = scheduleDao.findByTeacher(teacher);

		Set<Course> teacherCourses = new TreeSet<Course>();
		Set<Group> teacherGroups = new TreeSet<Group>();

		for (Schedule schedule : schedules) {
			teacherCourses.add(schedule.getCourse());
			teacherGroups.add(schedule.getGroup());
		}

		return new JournalTeacherDto(teacher.getId(), getWholeUserName(userId),
				teacherCourses, teacherGroups);
	}

	@Secured("ROLE_TEACHER")
	@Transactional
	public Set<Date> getDates(String dateFrom, String dateTo)
			throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

		Date from = dateFormat.parse(dateFrom);
		Date to = dateFormat.parse(dateTo);

		List<Schedule> schedules = scheduleDao.findByDates(from, to);

		Set<Date> dates = new TreeSet<Date>();

		for (Schedule schedule : schedules) {
			dates.add(schedule.getDate());
		}
		return dates;
	}

	@Transactional
	public Map<Long, List<Journal>> getStudentsWithMarks(String groupNumber,
			String groupLetter) {

		byte number = Byte.parseByte(groupNumber);
		char letter = groupLetter.charAt(0);

		Group group = groupDao.findByNumberAndLetter(number, letter);

		List<Student> students = group.getStudent();
		Map<Long, List<Journal>> map = new HashMap<Long, List<Journal>>();

		for (Student student : students) {
			map.put(student.getId(),
					journalDao.findByStudentId(student.getId()));
		}
		return map;
	}

	private String getWholeUserName(long userId) {
		User user = userDao.findById(userId);
		return user.getFirstName() + " " + user.getLastName();
	}

}
