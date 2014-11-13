package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.Set;

import school.dto.JournalParentDTO;
import school.dto.JournalStudentDTO;
import school.dto.JournalStudentWithMarksDTO;
import school.dto.JournalTeacherDTO;

public interface JournalService {

	JournalTeacherDTO getTeacherInfo(String userId);

	JournalStudentDTO getStudentInfo(String userId);

	JournalParentDTO getParentInfo(String userId);

	Set<Date> getDates(String dateFrom, String dateTo) throws ParseException;

	Set<JournalStudentWithMarksDTO> getStudentsWithMarks(String student,
			String groupNumber, String groupLetter, String course,
			String dateFrom, String dateTo) throws ParseException;
}
