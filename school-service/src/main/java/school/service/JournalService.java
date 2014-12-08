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

	// JournalStaffDTO getTeacherInfo(long userId);

	JournalStaffDTO getStaffInfo(long userId, String role);

	List<StudentWithMarksDTO> getMarksOfGroup(JournalSearch search)
			throws ParseException;

	void editMark(EditMarkDTO addMarkDTO) throws ParseException;

	void editDate(EditDateDTO event);

	Set<Character> getGroupLetters(long userId, String role, String subject, byte number);

	Set<Byte> getGroupNumbers(long userId, String role, String subject);

	JournalSearch getDeafaultData(long userId, Date currentDate)
			throws ParseException;
}