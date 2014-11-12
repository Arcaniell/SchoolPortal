package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.JournalStudentDto;
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
	private TeacherDao teacherDao;
	@Inject
	private UserDao userDao;

	@Transactional
	public Set<JournalStudentDto> getStudentsInfo(String groupNumber,
			String groupLetter, String course, String dateFrom, String dateTo)
			throws ParseException {

		byte number = Byte.parseByte(groupNumber);
		char letter = groupLetter.charAt(0);
		long courseId = Long.parseLong(course);

		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

		Date from = dateFormat.parse(dateFrom);
		Date to = dateFormat.parse(dateTo);

		Group group = groupDao.findByNumberAndLetter(number, letter);

		List<Student> students = group.getStudent();
		List<Schedule> schedules = scheduleDao.findByGroupCourseInterval(
				group.getId(), courseId, from, to);

		Set<JournalStudentDto> studentDtos = new TreeSet<JournalStudentDto>();

		Map<Date, String> marks = null;
		for (Student student : students) {
			marks = new HashMap<Date, String>();
			for (Schedule schedule : schedules) {
				Journal journal = journalDao.findByScheduleAndStudent(
						schedule.getId(), student.getId());
				if (journal != null) {
					marks.put(schedule.getDate(),
							Byte.toString(journal.getMark()));
				} else if (journal == null) {
					marks.put(schedule.getDate(), " ");
				}
			}
			studentDtos.add(new JournalStudentDto(student.getId(),
					getWholeUserName(student.getUser().getId()), marks));

		}

		return studentDtos;
	}

	@Transactional
	public JournalTeacherDto getTeacherInfo(long userId) {

		Teacher teacher = teacherDao.findByUserId(userId);
		List<Schedule> schedules = scheduleDao.findByTeacher(teacher);

		Set<Byte> groupNumbers = new TreeSet<Byte>();
		Set<Character> groupLetters = new TreeSet<Character>();
		Set<Course> courses = new TreeSet<Course>();

		for (Schedule schedule : schedules) {
			groupNumbers.add(schedule.getGroup().getNumber());
			groupLetters.add(schedule.getGroup().getLetter());
			courses.add(schedule.getCourse());
		}

		return new JournalTeacherDto(teacher.getId(), getWholeUserName(userId),
				groupNumbers, groupLetters, courses);
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
