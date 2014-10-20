package school.dao.session.implementation;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.CourseRequestDao;
import school.model.CourseRequest;

public class CourseRequestDaoImpl extends BaseDaoImpl<CourseRequest> implements
		CourseRequestDao {
	public CourseRequestDaoImpl() {
		super(CourseRequest.class);
	}

	public Set<CourseRequest> findByInterval(Date from, Date till) {
		Session session = null;
		List<CourseRequest> entities = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			entities = (List<CourseRequest>) session
					.createQuery(
							CourseRequest.FIND_BY_INTERVAL)
					.setDate("from", from).setDate("till", till).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new HashSet<CourseRequest>(entities);

	}

	public Set<CourseRequest> findArchived() {
		Session session = null;
		List<CourseRequest> entities = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			entities = (List<CourseRequest>) session
					.createQuery(CourseRequest.FIND_ARCHIVE)
					.setBoolean("active", false).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new HashSet<CourseRequest>(entities);
	}

	public Set<CourseRequest> findActive() {
		Session session = null;
		List<CourseRequest> entities = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			entities = (List<CourseRequest>) session
					.createQuery(
							CourseRequest.FIND_ARCHIVE)
					.setBoolean("active", true).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new HashSet<CourseRequest>(entities);
	}

	public Set<CourseRequest> findByDate(Date date) {
		Session session = null;
		List<CourseRequest> entities = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			entities = (List<CourseRequest>) session
					.createQuery(
							CourseRequest.FIND_BY_DATE)
					.setDate("date", date).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new HashSet<CourseRequest>(entities);
	}
}
