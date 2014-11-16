package school.service.implementation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.UserDao;
import school.dto.journal.StudentMarksDTO;
import school.dto.journal.MarkDTO;
import school.model.Group;
import school.model.Journal;
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

	// TODO make current week by default and add week changer by arrows

	@Secured({ Role.Secured.STUDENT, Role.Secured.PARENT })
	@Transactional
	public List<StudentMarksDTO> getDiaryMarks(String id) throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat(
				JournalUtil.UI_DATE_FORMAT);

		Date from = dateFormat.parse("09/01/2014");
		Date to = dateFormat.parse("09/05/2014");

		long userId = Long.parseLong(id);

		Student student = studentDao.findByUserId(userId);

		Group group = student.getGroup();

		List<Schedule> schedules = scheduleDao.findByGroupInterval(
				group.getId(), from, to);

		Set<Date> dates = getDates("09/01/2014", "09/05/2014");
		List<Journal> journals = journalDao.findByIntervalAndStudentId(
				student.getId(), from, to);
		List<StudentMarksDTO> diaryMarksDTO = new ArrayList<StudentMarksDTO>();

		for (Date date : dates) {
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
					getWholeUserName(userId), markDTOs));
		}

		return diaryMarksDTO;
	}

	private Set<Date> getDates(String dateFrom, String dateTo)
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

	private String getWholeUserName(long userId) {
		User user = userDao.findById(userId);
		return user.getFirstName() + " " + user.getLastName();
	}

}
