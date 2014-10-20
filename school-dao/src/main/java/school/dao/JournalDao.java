package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Journal;

public interface JournalDao extends BaseDao<Journal>{

	List<Journal> findByDate(Date date);
	List<Journal> findByInterval(Date from, Date till);
	List<Journal> findByStudentId(long studentId);
	List<Journal> findByDateAndStudentId (long studentId, Date date);
	List<Journal> findByIntervalAndStudentId(long studentId, Date from, Date till);
	
}
