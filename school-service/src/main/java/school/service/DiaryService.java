package school.service;

import java.util.Date;
import java.util.List;

import school.dto.journal.StudentWithMarksDTO;
import school.model.Student;

public interface DiaryService {

	List<StudentWithMarksDTO> getDiaryMarks(long studentId, List<Date> currentWeek);

	List<Student> getKids(String id);

}
