package school.dao.sessionfactory.implementation;


import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.LessonDao;
import school.model.Lesson;


public class LessonDaoImpl extends BaseDaoImpl<Lesson> implements LessonDao {

	public LessonDaoImpl() {
		super(Lesson.class);
	}
	

	public Lesson findByStartTime(Date startTime) {
		Session session = null;
		Lesson newEntity = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			newEntity = (Lesson) session.createQuery(Lesson.FIND_BY_START_TIME_QUERY)
					.setParameter("startTime", startTime).uniqueResult();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return newEntity;
	}
}
