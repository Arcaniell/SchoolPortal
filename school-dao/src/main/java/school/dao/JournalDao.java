package school.dao;


import school.model.Journal;

public interface JournalDao extends BaseDao<Journal, Long> {

	Journal findByStudentAndSchedule(long studentId, long scheduleId);

}
