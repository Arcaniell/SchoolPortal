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

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.GroupDao;
import school.dao.JournalDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.model.Group;
import school.model.Journal;
import school.model.Schedule;
import school.model.Student;
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

	@Transactional
	public List<Journal> findByInterval(Date from, Date till) {
		return journalDao.findByInterval(from, till);
	}

	@Transactional
	public List<Journal> findByStudentId(long studentId) {
		return journalDao.findByStudentId(studentId);
	}

	@Transactional
	public List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till) {
		return journalDao.findByIntervalAndStudentId(studentId, from, till);
	}

	// @Transactional
	// public List<Group> findByNumber(byte number) {
	// return groupDao.findByNumber(number);
	// }

	@Transactional
	public Group findByNumberAndLetter(byte number, char letter) {
		return groupDao.findByNumberAndLetter(number, letter);
	}

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
}
