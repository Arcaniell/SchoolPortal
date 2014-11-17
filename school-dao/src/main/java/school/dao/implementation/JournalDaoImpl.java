package school.dao.implementation;

import java.util.Date;
import java.util.List;

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
	@SuppressWarnings("unchecked")
	public List<Journal> findByInterval(Date from, Date till) {
		try {
			return entityManager.createNamedQuery(Journal.FIND_BY_INTERVAL)
					.setParameter("from", from).setParameter("till", till)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Journal> findByStudentId(long studentId) {
		try {
			return entityManager.createNamedQuery(Journal.FIND_BY_STUDENT)
					.setParameter("studentId", studentId).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Journal> findByIntervalAndStudentId(long studentId, Date from,
			Date till) {
		try {
			return entityManager
					.createNamedQuery(Journal.FIND_BY_INTERVAL_AND_STUDENT)
					.setParameter("studentId", studentId)
					.setParameter("from", from).setParameter("till", till)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public Journal findByStudentAndSchedule(long studentId, long scheduleId) {
		try {
			return (Journal) entityManager
					.createNamedQuery(Journal.FIND_BY_STUDENT_AND_SCHEDULE)
					.setParameter("studentId", studentId)
					.setParameter("scheduleId", scheduleId).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
