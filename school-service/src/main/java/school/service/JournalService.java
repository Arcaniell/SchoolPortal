package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import school.dto.JournalStudentDto;
import school.dto.JournalTeacherDto;
import school.model.Journal;

public interface JournalService {

	Set<Date> getDates(String dateFrom, String dateTo) throws ParseException;

	Map<Long, List<Journal>> getStudentsWithMarks(String groupNumber,
			String groupLetter);

	JournalTeacherDto getTeacherInfo(long userId);

	Set<JournalStudentDto> getStudentsInfo(String groupNumber,
			String groupLetter, String course, String dateFrom, String dateTo)
			throws ParseException;

}
