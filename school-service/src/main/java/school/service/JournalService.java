package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import school.dto.JournalTeacherDto;
import school.model.Course;
import school.model.Group;
import school.model.Journal;
import school.model.Schedule;
import school.model.Teacher;

public interface JournalService {

	List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till);

	Group findByNumberAndLetter(byte number, char letter);

	Set<Date> getDates(String dateFrom, String dateTo) throws ParseException;

	Map<Long, List<Journal>> getStudentsWithMarks(String groupNumber,
			String groupLetter);

	List<Schedule> getSchedulesByTeacherId(Teacher teacher);

	Teacher getTeacherByUserId(long userId);

	JournalTeacherDto getTeacherInfo(long userId);

}
