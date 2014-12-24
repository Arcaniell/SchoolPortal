package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import school.dao.SalaryDao;
import school.model.Salary;

@Repository
public class SalaryDaoImpl extends BaseDaoImpl<Salary, Long> implements
		SalaryDao {

	public SalaryDaoImpl() {
		super(Salary.class);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Salary> findByTeacherId(long teacherId) {
		try {
			return entityManager.createNamedQuery(Salary.FIND_BY_TEACHER_ID)
					.setParameter("id", teacherId).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Salary> findByDate(Date date) {
		try {
			return entityManager.createNamedQuery(Salary.FIND_BY_DATE)
					.setParameter("issueDate", date).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Salary> findByPeriod(Date from, Date until) {
		try {
			return entityManager.createNamedQuery(Salary.FIND_BY_PERIOD)
					.setParameter("from", from).setParameter("until", until)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Long findHoursByPeriod(long teacherId, Date from, Date until) {
		try {
			return (Long) entityManager
					.createNamedQuery(Salary.FIND_COUNT_OF_HOURS_BY_PERIOD)
					.setParameter("id", teacherId).setParameter("from", from)
					.setParameter("until", until).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Salary> findByTeacherIdAndPeriod(long teacherId, Date from,
			Date until) {
		try {
			return entityManager
					.createNamedQuery(Salary.FIND_BY_TEACHER_ID_AND_PERIOD)
					.setParameter("id", teacherId).setParameter("from", from)
					.setParameter("until", until).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public Salary findByLastIssueDate(long teacherId) {
		try {
			return (Salary) entityManager
					.createNamedQuery(Salary.FIND_BY_LAST_ISSUE_DATE)
					.setParameter("id", teacherId).setMaxResults(1)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	@Override
	public Date findLastDate() {
		try {
			return (Date) entityManager
					.createNamedQuery(Salary.FIND_LAST_ISSUE_DATE)
					.setMaxResults(1).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
