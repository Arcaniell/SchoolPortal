package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.StudentDao;
import school.model.Group;
import school.model.Student;

@Repository
public class StudentDaoImpl extends BaseDaoImpl<Student, Long> implements StudentDao {

    public StudentDaoImpl() {
        super(Student.class);
    }

    @Override
    public void save(Student entity) {
        // empty method, we can't save student without user
        // use update instead
        update(entity);
    }

    @Transactional
    @Override
    public Student findById(long id) {
        try {
            Student student = (Student) entityManager
                    .createQuery(
                            "select e from " + Student.class.getSimpleName()
                                    + " e where e.id = :id").setParameter("id", id)
                    .getSingleResult();
            student.getUser().getId();
            Group group =student.getGroup();
            if (group != null) {
                student.getGroup().getId();
            }
            return student;
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<Student> findAllByStatus(boolean value) {
        try {
            if (entityManager != null) {
                return (List<Student>) entityManager.createNamedQuery(Student.FIND_ALL_BY_STATUS)
                        .setParameter("active", value).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    public Student findByUserId(long id) {
        try {
            if (entityManager != null) {
                return (Student) entityManager.createNamedQuery(Student.FIND_BY_USER_ID)
                        .setParameter("id", id).getSingleResult();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }

    }

}
