package school.dao.sessionfactory.implementation;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.StudentDao;
import school.model.Student;

public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao {
    public StudentDaoImpl() {
        super(Student.class);
    }

    @Override
    @Deprecated
    public void save(Student entity) {
        // empty method, we can't save student without user
        // use update instead

    }

    @Override
    public Student findById(long id) {
        Session session = null;
        Student newEntity = null;
        Transaction transaction = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            newEntity = (Student) session.get(Student.class, id);
            transaction.commit();
            Hibernate.initialize(newEntity.getUser());
            Hibernate.initialize(newEntity.getGroup());
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query " + "find by id");
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }

    public Student findByUserId(long id) {
        Session session = null;
        Student newEntity = null;
        Transaction transaction = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            newEntity = (Student) session
                    .createQuery(Student.FIND_BY_USER_ID_QUERY)
                    .setLong("id", id).uniqueResult();
            transaction.commit();
            Hibernate.initialize(newEntity.getUser());
            Hibernate.initialize(newEntity.getGroup());
            if (newEntity.getGroup() != null) {
                Hibernate.initialize(newEntity.getGroup().getSchedule());
                Hibernate.initialize(newEntity.getGroup().getTeacher());
            }
            Hibernate.initialize(newEntity.getAdditionGroups());
            Hibernate.initialize(newEntity.getCourseRequest());
            Hibernate.initialize(newEntity.getJournal());
            Hibernate.initialize(newEntity.getParents());
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + Student.FIND_BY_USER_ID_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }

    @SuppressWarnings("unchecked")
    public List<Student> findAllByStatus(boolean value) {
        Session session = null;
        Transaction transaction = null;
        List<Student> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            entities = (List<Student>) session
                    .createQuery(Student.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", value).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Failed on query "
                    + Student.FIND_ALL_BY_STATUS_QUERY);
            e.printStackTrace();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return entities;
    }
}
