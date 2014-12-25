package school.service;

import java.util.Date;
import java.util.List;

import school.dto.journal.StudentWithMarksDTO;
import school.model.Student;

public interface DiaryService {

	/**
	 * This method gets marks of some chosen student and chosen week.
	 * 
	 * @param studentId
	 * @param currentWeek
	 * @return
	 */
	List<StudentWithMarksDTO> getDiaryMarks(long studentId,
			List<Date> currentWeek);

	/**
	 * This method gets parent kids.
	 * 
	 * @param id
	 * @return
	 */
	List<Student> getKids(String id);

}