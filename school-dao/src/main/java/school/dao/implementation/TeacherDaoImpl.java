package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.TeacherDao;
import school.model.Teacher;
import school.model.User;

@Repository
public class TeacherDaoImpl extends BaseDaoImpl<Teacher, Long> implements TeacherDao {

    public TeacherDaoImpl() {
        super(Teacher.class);
    }

    @Transactional
    @Override
    public Teacher findByUserId(long id) {
        try {
            return (Teacher) entityManager.createNamedQuery(Teacher.FIND_BY_USER_ID)
                    .setParameter("id", id).getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    @Override
    public List<User> findAllUsers() {
        try {
            return (List<User>) entityManager.createNamedQuery(Teacher.FIND_ALL_USERS)
                    .getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }
}
