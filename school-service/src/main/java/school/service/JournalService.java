package school.service;

import java.text.ParseException;
import java.util.List;

import school.dto.journal.StudentMarksDTO;
import school.dto.journal.JournalTeacherDTO;

public interface JournalService {

	JournalTeacherDTO getTeacherInfo(String userId);

	List<StudentMarksDTO> getMarksOfGroup(String quarter, String idGroup,
			String course) throws ParseException;

}
