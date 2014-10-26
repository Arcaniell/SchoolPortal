package school.dao.sessionfactory.implementation;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.TeacherDao;
import school.model.Teacher;

public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements TeacherDao {

    public TeacherDaoImpl() {
        super(Teacher.class);
    }

    @Override
    @Deprecated
    public void save(Teacher entity) {
        // empty method, we can't save teacher without user
        // use update instead
    }

    @SuppressWarnings("unchecked")
    public List<Teacher> findAllByStatus(boolean status) {
        Session session = null;
        Transaction transaction = null;
        List<Teacher> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            entities = (List<Teacher>) session
                    .createQuery(Teacher.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", status).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + Teacher.FIND_ALL_BY_STATUS_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return entities;
    }

    @SuppressWarnings("unchecked")
    public List<Teacher> findAllInRateRange(int from, int till) {
        Session session = null;
        Transaction transaction = null;
        List<Teacher> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            entities = (List<Teacher>) session
                    .createQuery(Teacher.FIND_RATE_RANGE_QUERY)
                    .setInteger("from", from).setInteger("till", till).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + Teacher.FIND_RATE_RANGE_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return entities;
    }

    public Teacher findByUserId(long id) {
        Session session = null;
        Teacher newEntity = null;
        Transaction transaction = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            newEntity = (Teacher) session
                    .createQuery(Teacher.FIND_BY_USER_ID_QUERY)
                    .setLong("id", id).uniqueResult();
            transaction.commit();
            Hibernate.initialize(newEntity.getUser());
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + Teacher.FIND_BY_USER_ID_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }

}
