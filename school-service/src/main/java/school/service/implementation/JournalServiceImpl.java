package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import school.dao.ParentDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.journal.JournalParentDTO;
import school.dto.journal.JournalStudentDTO;
import school.dto.journal.JournalStudentWithMarksDTO;
import school.dto.journal.JournalTeacherDTO;
import school.model.Group;
import school.model.Journal;
import school.model.Parent;
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
	private StudentDao studentDao;
	@Inject
	private TeacherDao teacherDao;
	@Inject
	private GroupDao groupDao;
	@Inject
	private ParentDao parentDao;

	@Secured(Role.Secured.TEACHER)
	@Transactional
	public JournalTeacherDTO getTeacherInfo(String id) {

		long userId = Long.parseLong(id);
		Teacher teacher = teacherDao.findByUserId(userId);
		List<Schedule> schedules = scheduleDao.findByTeacher(teacher);

		Set<Byte> groupNumbers = new TreeSet<Byte>();
		Set<Character> groupLetters = new TreeSet<Character>();
		Set<String> courses = new TreeSet<String>();

		for (Schedule schedule : schedules) {
			groupNumbers.add(schedule.getGroup().getNumber());
			groupLetters.add(schedule.getGroup().getLetter());
			courses.add(schedule.getCourse().getCourseName());
		}

		return new JournalTeacherDTO(teacher.getId(), getWholeUserName(userId),
				groupNumbers, groupLetters, courses);
	}

	@Secured({ Role.Secured.STUDENT, Role.Secured.PARENT })
	@Transactional
	public JournalStudentDTO getStudentInfo(String id) {

		long userId = Long.parseLong(id);

		Student student = studentDao.findByUserId(userId);

		Group mainGroup = student.getGroup();
		List<Group> allGroups = student.getAdditionGroups();
		allGroups.add(mainGroup);

		List<Schedule> schedules = new ArrayList<Schedule>();

		for (Group group : allGroups) {
			schedules.addAll(scheduleDao.findByGroup(group));
		}

		Set<String> courseNames = new TreeSet<String>();

		for (Schedule schedule : schedules) {
			courseNames.add(schedule.getCourse().getCourseName());
		}

		return new JournalStudentDTO(student.getId(), getWholeUserName(userId),
				courseNames);
	}

	@Secured(Role.Secured.PARENT)
	@Transactional
	public JournalParentDTO getParentInfo(String id) {

		long userId = Long.parseLong(id);

		Parent parent = parentDao.findByUserId(userId);
		List<Student> students = parent.getStudents();

		Set<JournalStudentDTO> kids = new TreeSet<JournalStudentDTO>();
		for (Student student : students) {
			kids.add(getStudentInfo(String.valueOf(student.getUser().getId())));
		}

		return new JournalParentDTO(parent.getId(), getWholeUserName(userId),
				kids);
	}

	@Secured({ Role.Secured.PARENT, Role.Secured.STUDENT, Role.Secured.TEACHER,
			Role.Secured.HEAD_TEACHER, Role.Secured.DIRECTOR,
			Role.Secured.ADMIN })
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

	@Secured({ Role.Secured.PARENT, Role.Secured.STUDENT, Role.Secured.TEACHER,
			Role.Secured.HEAD_TEACHER, Role.Secured.DIRECTOR,
			Role.Secured.ADMIN })
	@Transactional
	public Set<JournalStudentWithMarksDTO> getStudentsWithMarks(String student,
			String groupNumber, String groupLetter, String course,
			String dateFrom, String dateTo) throws ParseException {

		byte number = Byte.parseByte(groupNumber);
		char letter = groupLetter.charAt(0);

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.UI_DATE_FORMAT);

		Date from = dateFormat.parse(dateFrom);
		Date to = dateFormat.parse(dateTo);

		Group group = groupDao.findByNumberAndLetter(number, letter);

		List<Student> students = new ArrayList<Student>();
		if (student.equalsIgnoreCase(JournalUtil.ALL)) {
			students = group.getStudent();
		} else {
			students.add(studentDao.findById(Long.parseLong(student)));
		}
		List<Schedule> schedules = scheduleDao.findByGroupCourseInterval(
				group.getId(), course, from, to);

		return getMarks(students, schedules);
	}

	private Set<JournalStudentWithMarksDTO> getMarks(List<Student> students,
			List<Schedule> schedules) {
		Set<JournalStudentWithMarksDTO> studentDtos = new TreeSet<JournalStudentWithMarksDTO>();

		Map<Date, String> marks = null;
		for (Student stud : students) {
			marks = new HashMap<Date, String>();
			for (Schedule schedule : schedules) {
				Journal journal = journalDao.findByScheduleAndStudent(
						schedule.getId(), stud.getId());
				if (journal != null) {
					marks.put(schedule.getDate(),
							Byte.toString(journal.getMark()));
				} else if (journal == null) {
					marks.put(schedule.getDate(), " ");
				}
			}
			studentDtos.add(new JournalStudentWithMarksDTO(stud.getId(),
					getWholeUserName(stud.getUser().getId()), marks));
		}
		return studentDtos;
	}

	private String getWholeUserName(long userId) {
		User user = userDao.findById(userId);
		return user.getFirstName() + " " + user.getLastName();
	}

}
