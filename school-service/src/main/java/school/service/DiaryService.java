package school.service;

import java.util.Date;
import java.util.List;

import school.dto.journal.StudentMarksDTO;
import school.model.Student;

public interface DiaryService {

	List<StudentMarksDTO> getDiaryMarks(String studentId, List<Date> currentWeek);

	List<Student> getKids(String id);

}
