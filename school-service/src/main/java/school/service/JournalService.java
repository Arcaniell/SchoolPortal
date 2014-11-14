package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.Set;

import school.dto.journal.JournalParentDTO;
import school.dto.journal.JournalStudentDTO;
import school.dto.journal.JournalStudentWithMarksDTO;
import school.dto.journal.JournalTeacherDTO;

public interface JournalService {

	JournalTeacherDTO getTeacherInfo(String userId);

	JournalStudentDTO getStudentInfo(String userId);

	JournalParentDTO getParentInfo(String userId);

	Set<Date> getDates(String dateFrom, String dateTo) throws ParseException;

	Set<JournalStudentWithMarksDTO> getStudentsWithMarks(String student,
			String groupNumber, String groupLetter, String course,
			String dateFrom, String dateTo) throws ParseException;

}
