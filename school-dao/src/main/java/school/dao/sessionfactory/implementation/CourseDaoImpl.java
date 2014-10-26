package school.dao.sessionfactory.implementation;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.CourseDao;
import school.model.Course;

public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {

	private List<Course> courses;
	private Session session;
	private Transaction transaction;

	public CourseDaoImpl() {
		super(Course.class);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findAllAddition() {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_STATUS_QUERY)
					.setBoolean("additional", true).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findByGroupNumber(int groupNumber) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_GROUP_NUMBER_QUERY)
					.setParameter("groupNumber", groupNumber).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findByCoefficient(int coefficient) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_COEFFICIENT_QUERY)
					.setParameter("coefficient", coefficient).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findByCourseName(String courseName) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_COURSE_NAME_QUERY)
					.setParameter("courseName", courseName).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findByCourseNameAndGroupNumber(String courseName,
			int groupNumber) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_NAME_AND_NUMBER_QUERY)
					.setParameter("courseName", courseName)
					.setParameter("groupNumber", groupNumber).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findByPrice(int price) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_PRICE_QUERY)
					.setParameter("price", price).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findAllMandatoryCourses() {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_STATUS_QUERY)
					.setParameter("additional", false).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Course> findByPriceRange(int from, int to) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			courses = (List<Course>) session
					.createQuery(Course.FIND_BY_PRICE_RANGE_QUERY)
					.setParameter("from", from).setParameter("to", to).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Course>(courses);
	}
}