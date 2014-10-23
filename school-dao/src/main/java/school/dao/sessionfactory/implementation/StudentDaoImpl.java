package school.dao.sessionfactory.implementation;

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

    @SuppressWarnings("unchecked")
    public Set<Student> findActive() {
        Session session = null;
        List<Student> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            entities = (List<Student>) session
                    .createQuery(Student.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", true).list();
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return new HashSet<Student>(entities);
    }

    @SuppressWarnings("unchecked")
    public Set<Student> findArchived() {
        Session session = null;
        List<Student> entities = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            entities = (List<Student>) session
                    .createQuery(Student.FIND_ALL_BY_STATUS_QUERY)
                    .setBoolean("active", false).list();
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return new HashSet<Student>(entities);
    }

    @SuppressWarnings("unchecked")
    public Set<Student> findByGroupId(long id) {
        Session session = null;
        Set<Student>newEntity = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            newEntity = (Set<Student>) session.createQuery(
                    Student.FIND_BY_GROUP_ID_QUERY).setLong("id", id);
            transaction.commit();
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
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            newEntity = (Student) session.createQuery(
                    Student.FIND_BY_USER_ID_QUERY).setLong("id", id);
            transaction.commit();
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return newEntity;
    }
}
