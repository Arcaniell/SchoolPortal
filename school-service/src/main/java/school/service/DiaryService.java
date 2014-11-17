package school.service;

import java.text.ParseException;
import java.util.List;

import school.dto.journal.StudentMarksDTO;

public interface DiaryService {

	List<StudentMarksDTO> getDiaryMarks(String studentId) throws ParseException;

}
