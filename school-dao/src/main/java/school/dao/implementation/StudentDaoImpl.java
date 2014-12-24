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
