package school.service.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.EventDao;
import school.dao.HomeTaskDao;
import school.dao.JournalDao;
import school.dao.ParentDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.UserDao;
import school.dto.journal.MarkDTO;
import school.dto.journal.StudentWithMarksDTO;
import school.model.Event;
import school.model.HomeTask;
import school.model.Journal;
import school.model.Parent;
import school.model.Role;
import school.model.Schedule;
import school.model.Student;
import school.model.User;
import school.service.DiaryService;
import school.service.utils.DateUtil;
import school.service.utils.JournalUtil;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private JournalDao journalDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private ParentDao parentDao;
	@Autowired
	private HomeTaskDao homeTaskDao;
	@Autowired
	private EventDao eventDao;

	@Secured({ Role.Secured.STUDENT, Role.Secured.PARENT })
	@Transactional
	public List<StudentWithMarksDTO> getDiaryMarks(long userId,
			List<Date> currentWeek) {
		Student student = studentDao.findByUserId(userId);
		List<StudentWithMarksDTO> diaryMarksDTO = new ArrayList<>();
		for (Date date : currentWeek) {
			Set<MarkDTO> marks = new TreeSet<>();
			for (Schedule schedule : scheduleDao.findByGroupDate(student
					.getGroup().getId(), date)) {
				HomeTask homeTask = homeTaskDao
						.findBySchedule(schedule.getId());
				Event event = eventDao.findEventBySchedule(schedule.getId());
				Journal journal = journalDao.findByStudentAndSchedule(
						student.getId(), schedule.getId());
				marks.add(new MarkDTO(schedule.getLesson().getId(), schedule
						.getId(), schedule.getCourse().getCourseName(),
						homeTask.getTask(), date, journal.getMark(), event
								.getType()));
			}
			diaryMarksDTO.add(new StudentWithMarksDTO(student.getId(),
					getWholeUserName(userId),
					JournalUtil.getQuarterMark(marks), date, marks));
		}
		return diaryMarksDTO;
	}

	@Secured(Role.Secured.PARENT)
	public List<Student> getKids(String id) {
		long userId = Long.parseLong(id);
		Parent parent = parentDao.findByUserId(userId);
		return parent.getStudents();
	}

	private String getWholeUserName(long userId) {
		User user = userDao.findById(userId);
		return user.getFirstName() + " " + user.getLastName();
	}
}
