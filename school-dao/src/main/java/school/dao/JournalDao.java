package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Journal;

public interface JournalDao extends BaseDao<Journal, Long> {

	List<Journal> findByInterval(Date from, Date till);

	List<Journal> findByStudentId(long studentId);

	List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till);

	Journal findByScheduleAndStudent(long studentId, long scheduleId);

}
