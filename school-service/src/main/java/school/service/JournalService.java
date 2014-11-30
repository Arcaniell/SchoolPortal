package school.service;

import java.text.ParseException;
import java.util.List;
import java.util.Set;

import school.dto.EventDTO;
import school.dto.journal.AddMarkDTO;
import school.dto.journal.JournalStaffDTO;
import school.dto.journal.StudentWithMarksDTO;

public interface JournalService {

	JournalStaffDTO getTeacherInfo(String userId);

	JournalStaffDTO seniorStaffInfo(String id);

	List<StudentWithMarksDTO> getMarksOfGroup(String quarter,
			String groupNumber, String groupLetter, String course)
			throws ParseException;

	void addMark(AddMarkDTO addMarkDTO) throws ParseException;
	
	void addEvent(EventDTO event);

	Set<String> getGroupLetters(String userId, String number);

	Set<String> getGroupNumbers(String id, String subject);
}