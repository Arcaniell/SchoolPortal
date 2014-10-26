package school.dao.sessionfactory.implementation;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.CourseRequestDao;
import school.model.CourseRequest;
import school.model.Student;

public class CourseRequestDaoImpl extends BaseDaoImpl<CourseRequest> implements
        CourseRequestDao {
    public CourseRequestDaoImpl() {
        super(CourseRequest.class);
    }
    @Override
    @Deprecated
    public void save(CourseRequest entity) {
        // empty method, we can't save course request without requester(student)
        // use update instead

    }
    @Override
    public CourseRequest findById(long id) {
        Session session = null;
        Transaction transaction=null;
        CourseRequest newEntity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession(); 
            transaction = session.beginTransaction();
            newEntity = (CourseRequest) session.get(CourseRequest.class, id);
            transaction.commit();
        }catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + "find by ID query");
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }
    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllByStatus(boolean status) {
        Session session = null;
        Transaction transaction = null;
        List<CourseRequest> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            entities = (List<CourseRequest>) session
                    .createQuery(CourseRequest.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", status).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + CourseRequest.FIND_ALL_BY_STATUS_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return entities;
    }

    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllByInterval(Date from, Date till) {
        Session session = null;
        Transaction transaction = null;
        List<CourseRequest> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            entities = (List<CourseRequest>) session
                    .createQuery(CourseRequest.FIND_BY_INTERVAL_QUERY)
                    .setDate("from", from).setDate("till", till).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + CourseRequest.FIND_BY_INTERVAL_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return entities;

    }

    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllByStudentId(long id) {
        Session session = null;
        Transaction transaction = null;
        List<CourseRequest> newEntity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            newEntity = (List<CourseRequest>) session.createQuery(
                    CourseRequest.FIND_BY_STUDENT_ID_QUERY).setLong("id", id).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + CourseRequest.FIND_BY_STUDENT_ID_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }

    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllBySubjectId(long id) {
        Session session = null;
        Transaction transaction = null;
        List<CourseRequest> newEntity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            newEntity = (List<CourseRequest>) session.createQuery(
                    CourseRequest.FIND_BY_SUBJECT_ID_QUERY).setLong("id", id).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + CourseRequest.FIND_BY_SUBJECT_ID_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }

}
