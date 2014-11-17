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
import school.dao.ScheduleDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.journal.StudentMarksDTO;
import school.dto.journal.JournalTeacherDTO;
import school.dto.journal.MarkDTO;
import school.model.Group;
import school.model.Journal;
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

	@Secured({ Role.Secured.TEACHER, Role.Secured.HEAD_TEACHER,
			Role.Secured.DIRECTOR, Role.Secured.ADMIN })
	@Transactional
	public List<StudentMarksDTO> getMarksOfGroup(String quarter, String idGroup,
			String courseName) throws ParseException {

		long groupId = Long.parseLong(idGroup);
		Group group = groupDao.findById(groupId);
		Date from = getDatesByQuarter(quarter)[0];
		Date to = getDatesByQuarter(quarter)[1];

		List<Schedule> schedules = scheduleDao.findByGroupCourseInterval(
				groupId, courseName, from, to);
		Collections.sort(schedules);
		List<StudentMarksDTO> studentsWithMarks = new ArrayList<StudentMarksDTO>();
		Set<MarkDTO> marks = new TreeSet<MarkDTO>();

		int countId = 0;
		for (Student student : group.getStudent()) {
			marks = new TreeSet<MarkDTO>();
			for (Schedule schedule : schedules) {
				countId += 1;
				Journal journal = journalDao.findByStudentAndSchedule(
						student.getId(), schedule.getId());
				if (journal != null) {
					marks.add(new MarkDTO(countId, schedule, journal));
				} else if (journal == null) {
					marks.add(new MarkDTO(countId, schedule, new Journal()));
				}
			}
			studentsWithMarks.add(new StudentMarksDTO(student.getId(),
					getWholeUserName(student.getUser().getId()), marks));

		}
		return studentsWithMarks;

	}

	private Date[] getDatesByQuarter(String quarter) throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.UI_DATE_FORMAT);

		Date[] dates = new Date[2];

		if (quarter.equalsIgnoreCase("1")) {
			dates[0] = dateFormat.parse("09/01/2014");
			dates[1] = dateFormat.parse("10/31/2014");
		} else if (quarter.equalsIgnoreCase("2")) {
			dates[0] = dateFormat.parse("11/01/2014");
			dates[1] = dateFormat.parse("12/31/2014");
		} else if (quarter.equalsIgnoreCase("3")) {
			dates[0] = dateFormat.parse("02/01/2015");
			dates[1] = dateFormat.parse("03/31/2015");
		} else if (quarter.equalsIgnoreCase("4")) {
			dates[0] = dateFormat.parse("04/01/2015");
			dates[1] = dateFormat.parse("05/31/2015");
		}

		return dates;
	}

	private String getWholeUserName(long userId) {
		User user = userDao.findById(userId);
		return user.getFirstName() + " " + user.getLastName();
	}

}
