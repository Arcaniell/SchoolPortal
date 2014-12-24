package school.dao.implementation;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.JournalDao;
import school.model.Journal;

@Repository
public class JournalDaoImpl extends BaseDaoImpl<Journal, Long> implements
		JournalDao {

	public JournalDaoImpl() {
		super(Journal.class);
	}

	@Transactional
	public Journal findByStudentAndSchedule(long studentId, long scheduleId) {
		try {
			return (Journal) entityManager
					.createNamedQuery(Journal.FIND_BY_STUDENT_AND_SCHEDULE)
					.setParameter("studentId", studentId)
					.setParameter("scheduleId", scheduleId).getSingleResult();
		} catch (NoResultException e) {
			return new Journal();
		}
	}

}
