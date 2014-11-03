package school.service;

import java.util.Date;
import java.util.List;

import school.model.Journal;

public interface JournalService {

	List<Journal> findByInterval(Date from, Date till);

	List<Journal> findByStudentId(long studentId);

	List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till);
}
