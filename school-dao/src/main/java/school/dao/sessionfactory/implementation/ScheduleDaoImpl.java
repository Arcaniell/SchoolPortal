package school.dao.sessionfactory.implementation;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.ScheduleDao;
import school.model.Group;
import school.model.Lesson;
import school.model.Room;
import school.model.Schedule;
import school.model.Course;
import school.model.Teacher;

public class ScheduleDaoImpl extends BaseDaoImpl<Schedule> implements ScheduleDao {

public ScheduleDaoImpl() {
	super(Schedule.class);
	}
	
@SuppressWarnings("unchecked")
public List<Schedule> findByDates(Date from, Date till) {
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session.createQuery(Schedule.FIND_BY_DATES_QUERY)
				.setParameter("from", from).setParameter("till", till).list();
		transaction.commit();
	} finally {
		if ((session != null) && (session.isOpen())) {
			session.close();
		}
	}
	return entities;
	}
	
@SuppressWarnings("unchecked")
public	List<Schedule> findByGroup (Group group){
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session.createQuery(Schedule.FIND_BY_GROUP_QUERY)
				.setEntity("group", group).list();
		transaction.commit();
	} finally {
		if ((session != null) && (session.isOpen())) {
			session.close();
		}
	}
	return entities;
	} 

@SuppressWarnings("unchecked")
public	List<Schedule> findByCourse (Course course){
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session.createQuery(Schedule.FIND_BY_COURSE_QUERY)
				.setEntity("course", course).list();
		transaction.commit();
	} finally {
		if ((session != null) && (session.isOpen())) {
			session.close();
		}
	}
	return entities;
	}

@SuppressWarnings("unchecked")
public	List<Schedule> findByRoom (Room room){
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session.createQuery(Schedule.FIND_BY_ROOM_QUERY)
				.setEntity("room", room).list();
		transaction.commit();
	} finally {
		if ((session != null) && (session.isOpen())) {
			session.close();
		}
	}
	return entities;
	}

@SuppressWarnings("unchecked")
public	List<Schedule> findByTeacher (Teacher teacher){
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session.createQuery(Schedule.FIND_BY_TEACHER_QUERY)
				.setEntity("teacher", teacher).list();
		transaction.commit();
	} finally {
		if ((session != null) && (session.isOpen())) {
			session.close();
		}
	}
	return entities;
	}

@SuppressWarnings("unchecked")
public List<Schedule> findByLesson (Lesson lesson){
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session.createQuery(Schedule.FIND_BY_LESSON_QUERY)
				.setEntity("lesson", lesson).list();
		transaction.commit();
	} finally {
		if ((session != null) && (session.isOpen())) {
			session.close();
		}
	}
	return entities;
	}
	
@SuppressWarnings("unchecked")
public List<Schedule> findByTeacherGroupInterval(long teacherId, long groupId, Date from, Date till) {


	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session
				.createQuery(Schedule.FIND_BY_TEACHER_GROUP_INTERVAL_QUERY)
				.setParameter("teacherId", teacherId)
				.setParameter("groupId", groupId)
				.setParameter("from", from)
				.setParameter("till", till)
				.list();
		transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return entities;
	}

@SuppressWarnings("unchecked")
public List<Schedule> findByTeacherRoomInterval(long teacherId, long roomId,
		Date from, Date till) {

	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session
				.createQuery(Schedule.FIND_BY_TEACHER_ROOM_INTERVAL_QUERY)
				.setParameter("teacherId", teacherId)
				.setParameter("roomId", roomId)
				.setParameter("from", from)
				.setParameter("till", till)
				.list();
		transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return entities;
}

@SuppressWarnings("unchecked")
public List<Schedule> findByGroupRoomInterval(long groupId, long roomId,
		Date from, Date till) {

	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session
				.createQuery(Schedule.FIND_BY_GROUP_ROOM_INTERVAL_QUERY)
				.setParameter("groupId", groupId)
				.setParameter("roomId", roomId)
				.setParameter("from", from)
				.setParameter("till", till)
				.list();
		transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return entities;
}

@SuppressWarnings("unchecked")
public List<Schedule> findByTeacherGroupRoomInterval(long teacherId,
		long groupId, long roomId, Date from, Date till) {
	
	Session session = null;
	List<Schedule> entities = null;
	try {
		session = HibernateSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		entities = (List<Schedule>) session
				.createQuery(Schedule.FIND_BY_TEACHER_GROUP_ROOM_INTERVAL_QUERY)
				.setParameter("teacherId", teacherId)
				.setParameter("groupId", groupId)
				.setParameter("roomId", roomId)
				.setParameter("from", from)
				.setParameter("till", till)
				.list();
		transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return entities;
}
}
