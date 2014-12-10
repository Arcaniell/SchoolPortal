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
import school.model.Group;
import school.model.HomeTask;
import school.model.Journal;
import school.model.Parent;
import school.model.Role;
import school.model.Schedule;
import school.model.Student;
import school.model.User;
import school.service.DiaryService;
import school.service.utils.DiaryUtil;

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

		Date from = currentWeek.get(DiaryUtil.FIRST_DATE_OF_WEEK);
		Date to = currentWeek.get(DiaryUtil.LAST_DATE_OF_WEEK);

		Student student = studentDao.findByUserId(userId);
		Group group = student.getGroup();
		List<Schedule> schedules = scheduleDao.findByGroupInterval(
				group.getId(), from, to);
		List<Journal> journals = journalDao.findByIntervalAndStudentId(
				student.getId(), from, to);
		List<StudentWithMarksDTO> diaryMarksDTO = new ArrayList<>();

		for (Date date : currentWeek) {
			Set<MarkDTO> markDTOs = new TreeSet<>();

			for (Schedule schedule : schedules) {
				if (date.equals(schedule.getDate())) {
					HomeTask homeTask = homeTaskDao.findBySchedule(schedule
							.getId());
					Event event = eventDao
							.findEventBySchedule(schedule.getId());

					for (Journal journal : journals) {
						if (journal.getSchedule().getId() == schedule.getId()) {

							markDTOs.add(new MarkDTO(schedule.getLesson()
									.getLesId(), schedule.getId(), schedule
									.getCourse().getCourseName(), homeTask
									.getTask(), date, journal.getMark(),
									journal.getCoefficient()));
						}
					}
					markDTOs.add(new MarkDTO(schedule.getLesson().getLesId(),
							schedule.getId(), schedule.getCourse()
									.getCourseName(), homeTask.getTask(), date,
							event.getType()));
				}
			}
			diaryMarksDTO.add(new StudentWithMarksDTO(student.getId(),
					getWholeUserName(userId), date, markDTOs));
		}

		return diaryMarksDTO;
	}

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
