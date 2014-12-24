package school.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import school.dto.journal.EditMarkDTO;
import school.dto.journal.EditDateDTO;
import school.dto.journal.JournalSearch;
import school.dto.journal.JournalStaffDTO;
import school.dto.journal.MarkDTO;
import school.dto.journal.StudentWithMarksDTO;
import school.model.Schedule;
import school.model.Student;

public interface JournalService {

	/**
	 * This method gets data about teacher or other staff(subjects, groups,
	 * quarters that teacher deals with), to set this data into search selectors
	 * in UI.
	 *
	 * @param userId
	 * @param role
	 * @return JournalStaffDTO
	 */
	JournalStaffDTO getStaffInfo(long userId, String role);

	/**
	 * This method gets the marks of whole group by some subject and quarter.
	 * 
	 * @param search
	 * @return List<StudentWithMarksDTO>
	 */
	List<StudentWithMarksDTO> getMarksOfGroup(JournalSearch search);

	/**
	 * This method deletes mark if its needed or saves it into journal.
	 * 
	 * then recalculates quarter mark(average mark of some quarter) and returns
	 * it to set in UI.
	 * 
	 * @param editMarkDTO
	 * @return EditMarkDTO
	 */

	EditMarkDTO editMark(EditMarkDTO editMarkDTO);

	/**
	 * This method gets all marks, home tasks and events of some chosen student
	 * by chosen schedules.
	 * 
	 * @param schedules
	 * @param student
	 * @return Set<MarkDTO>
	 */
	Set<MarkDTO> getStudentsMarks(List<Schedule> schedules, Student student);

	/**
	 * This method saves home task or events to DB. It can save all or any one
	 * of them.
	 * 
	 * @param editDateDTO
	 */
	void editDate(EditDateDTO editDateDTO);

	/**
	 * Deletes events from DB.
	 * 
	 * @param editedDateDTO
	 */
	void deleteEvent(EditDateDTO editedDateDTO);

	/**
	 * Deletes home tasks from DB.
	 * 
	 * @param editedDateDTO
	 */
	void deleteHomeTask(EditDateDTO editedDateDTO);

	/**
	 * This method gets founds the closest lesson of group to current date and
	 * time. And return data to set into search selectors.
	 * 
	 * @param userId
	 * @param currentDate
	 * @return JournalSearch
	 */
	JournalSearch getDeafaultData(long userId, Date currentDate);

	/**
	 * This method gets appropriate group numbers to some selected subject.
	 * 
	 * If the user role is teacher gets only group numbers that he deals with.
	 * 
	 * @param userId
	 * @param role
	 * @param subject
	 * @return Set<Byte> - appropriate numbers of groups.
	 */
	Set<Byte> getGroupNumbers(long userId, String role, String subject);

	/**
	 * This method gets appropriate group letters to some selected group number
	 * and subject.
	 * 
	 * If the user role is teacher gets only group letters that he deals with.
	 * 
	 * @param userId
	 * @param role
	 * @param subject
	 * @param number
	 * @return Set<Character> - appropriate group letters.
	 */
	Set<Character> getGroupLetters(long userId, String role, String subject,
			byte number);

	/**
	 * This method unites user's first and last names to one string.
	 * 
	 * @param userId
	 * @return String - user name
	 */
	String getWholeUserName(long userId);
}
