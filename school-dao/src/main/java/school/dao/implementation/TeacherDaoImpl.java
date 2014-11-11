package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.TeacherDao;
import school.model.Teacher;

@Repository
public class TeacherDaoImpl extends BaseDaoImpl<Teacher, Long> implements
        TeacherDao {

    public TeacherDaoImpl() {
        super(Teacher.class);
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Teacher> findAllByStatus(boolean status) {
        try {

            return (List<Teacher>) entityManager
                    .createNamedQuery(Teacher.FIND_ALL_BY_STATUS)
                    .setParameter("active", status).getResultList();

        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Teacher> findAllInRateRange(int from, int till) {
        try {

            return (List<Teacher>) entityManager
                    .createNamedQuery(Teacher.FIND_RATE_RANGE)
                    .setParameter("from", from).setParameter("till", till)
                    .getResultList();

        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    public Teacher findByUserId(long id) {
        try {

            Teacher teacher = (Teacher) entityManager
                    .createNamedQuery(Teacher.FIND_BY_USER_ID)
                    .setParameter("id", id).getSingleResult();
            teacher.getUser().getId();
            return teacher;

        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @Override
    public Teacher findById(long id) {
        try {
            Teacher teacher = (Teacher) entityManager
                    .createQuery(
                            "select e from " + Teacher.class.getSimpleName()
                                    + " e where e.id = :id")
                    .setParameter("id", id).getSingleResult();
            teacher.getUser().getId();
            return teacher;
        } catch (NoResultException e) {
            return null;
        }
    }

}
