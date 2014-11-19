package school.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import school.dto.journal.StudentMarksDTO;

public interface DiaryService {

	List<StudentMarksDTO> getDiaryMarks(String studentId, List<Date> currentWeek);

}
