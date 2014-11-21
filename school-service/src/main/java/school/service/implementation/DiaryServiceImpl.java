package school.service.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.inject.Inject;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.JournalDao;
import school.dao.ParentDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.UserDao;
import school.dto.journal.StudentMarksDTO;
import school.dto.journal.MarkDTO;
import school.model.Group;
import school.model.Journal;
import school.model.Parent;
import school.model.Role;
import school.model.Schedule;
import school.model.Student;
import school.model.User;
import school.service.DiaryService;
import school.service.utils.JournalUtil;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Inject
	private JournalDao journalDao;
	@Inject
	private ScheduleDao scheduleDao;
	@Inject
	private UserDao userDao;
	@Inject
	private StudentDao studentDao;
	@Inject
	private ParentDao parentDao;

	@Secured({ Role.Secured.STUDENT, Role.Secured.PARENT })
	@Transactional
	public List<StudentMarksDTO> getDiaryMarks(String id, List<Date> currentWeek) {

		Date from = currentWeek.get(JournalUtil.FIRST_DATE_OF_WEEK);
		Date to = currentWeek.get(JournalUtil.LAST_DATE_OF_WEEK);

		long userId = Long.parseLong(id);

		Student student = studentDao.findByUserId(userId);
		Group group = student.getGroup();
		List<Schedule> schedules = scheduleDao.findByGroupInterval(
				group.getId(), from, to);
		List<Journal> journals = journalDao.findByIntervalAndStudentId(
				student.getId(), from, to);
		List<StudentMarksDTO> diaryMarksDTO = new ArrayList<StudentMarksDTO>();

		for (Date date : currentWeek) {
			Set<MarkDTO> markDTOs = new TreeSet<MarkDTO>();

			for (Schedule schedule : schedules) {
				if (date.equals(schedule.getDate())) {

					for (Journal journal : journals) {
						if (journal.getSchedule().getId() == schedule.getId()) {

							markDTOs.add(new MarkDTO(schedule.getLesson()
									.getLesId(), schedule, journal));
						}
					}
					markDTOs.add(new MarkDTO(schedule.getLesson().getLesId(),
							schedule, new Journal()));
				}
			}
			diaryMarksDTO.add(new StudentMarksDTO(student.getId(),
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
