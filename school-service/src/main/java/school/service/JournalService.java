package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import school.model.Group;
import school.model.Journal;

public interface JournalService {

	List<Journal> findByInterval(Date from, Date till);

	List<Journal> findByStudentId(long studentId);

	List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till);

	Group findByNumberAndLetter(byte number, char letter);

	Set<Date> getDates(String dateFrom, String dateTo) throws ParseException;

	Map<Long, List<Journal>> getStudentsWithMarks(String groupNumber,
			String groupLetter);

}
