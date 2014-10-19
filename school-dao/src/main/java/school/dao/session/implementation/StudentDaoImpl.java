package school.dao.session.implementation;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.StudentDao;
import school.model.Student;

public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao {
	public StudentDaoImpl() {
		super(Student.class);
	}

	public Set<Student> findArchived() {
		Session session = null;
		List<Student> entities = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			entities = (List<Student>) session
					.createQuery(
							Student.FIND_ALL_ARCHIVE).setBoolean("active", false).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new HashSet<Student>(entities);
	}

	public Set<Student> findActive() {
		Session session = null;
		List<Student> entities = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			entities = (List<Student>) session
					.createQuery(
							Student.FIND_ALL_ARCHIVE).setBoolean("active", true).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new HashSet<Student>(entities);
	}
}
