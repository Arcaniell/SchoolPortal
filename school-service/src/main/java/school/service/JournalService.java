package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import school.dto.journal.EditMarkDTO;
import school.dto.journal.EditDateDTO;
import school.dto.journal.JournalSearch;
import school.dto.journal.JournalStaffDTO;
import school.dto.journal.StudentWithMarksDTO;

public interface JournalService {

	JournalStaffDTO getTeacherInfo(String userId);

	JournalStaffDTO seniorStaffInfo(String id);

	List<StudentWithMarksDTO> getMarksOfGroup(JournalSearch search)
			throws ParseException;

	void editMark(EditMarkDTO addMarkDTO) throws ParseException;

	void editDate(EditDateDTO event);

	Set<String> getGroupLetters(String userId, String number);

	Set<String> getGroupNumbers(String id, String subject);

	JournalSearch getDeafaultData(String id, Date currentDate)
			throws ParseException;
}