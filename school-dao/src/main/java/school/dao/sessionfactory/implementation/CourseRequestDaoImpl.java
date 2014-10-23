package school.dao.sessionfactory.implementation;

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

    @SuppressWarnings("unchecked")
    public Set<CourseRequest> findActive() {
        Session session = null;
        List<CourseRequest> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            entities = (List<CourseRequest>) session
                    .createQuery(CourseRequest.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", true).list();
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return new HashSet<CourseRequest>(entities);
    }

    @SuppressWarnings("unchecked")
    public Set<CourseRequest> findArchived() {
        Session session = null;
        List<CourseRequest> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            entities = (List<CourseRequest>) session
                    .createQuery(CourseRequest.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", false).list();
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return new HashSet<CourseRequest>(entities);
    }

    @SuppressWarnings("unchecked")
    public Set<CourseRequest> findByDate(Date date) {
        Session session = null;
        List<CourseRequest> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            entities = (List<CourseRequest>) session
                    .createQuery(CourseRequest.FIND_BY_DATE_QUERY)
                    .setDate("date", date).list();
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return new HashSet<CourseRequest>(entities);
    }

    @SuppressWarnings("unchecked")
    public Set<CourseRequest> findByInterval(Date from, Date till) {
        Session session = null;
        List<CourseRequest> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            entities = (List<CourseRequest>) session
                    .createQuery(CourseRequest.FIND_BY_INTERVAL_QUERY)
                    .setDate("from", from).setDate("till", till).list();
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return new HashSet<CourseRequest>(entities);

    }

    @SuppressWarnings("unchecked")
    public Set<CourseRequest> findByStudentId(long id) {
        Session session = null;
        Set<CourseRequest> newEntity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            newEntity = (Set<CourseRequest>) session.createQuery(
                    CourseRequest.FIND_BY_STUDENT_ID_QUERY).setLong("id", id);
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }

    @SuppressWarnings("unchecked")
    public Set<CourseRequest> findBySubjectId(long id) {
        Session session = null;
        Set<CourseRequest> newEntity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            newEntity = (Set<CourseRequest>) session.createQuery(
                    CourseRequest.FIND_BY_SUBJECT_ID_QUERY).setLong("id", id);
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }
}
