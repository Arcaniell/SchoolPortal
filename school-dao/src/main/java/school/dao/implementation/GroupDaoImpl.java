package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.GroupDao;
import school.model.Group;

@Repository
public class GroupDaoImpl extends BaseDaoImpl<Group, Long> implements GroupDao {

    public GroupDaoImpl() {
        super(Group.class);
    }

    @Transactional
    @SuppressWarnings("unchecked")
    @Override
    public List<Group> findAllByTeacherIdCourseIdDataRange(long teacherId, long courseId,
            Date from, Date till) {
        try {
            return entityManager
                    .createNamedQuery(Group.FIND_BY_TEACHER_ID_COURSE_ID_AND_DATA_RANGE)
                    .setParameter("teacherId", teacherId).setParameter("courseId", courseId)
                    .setParameter("from", from).setParameter("till", till).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    @Override
    public List<Group> findAllByTeacherIdDataRange(long teacherId, Date from, Date till) {
        try {
            return entityManager.createNamedQuery(Group.FIND_BY_TEACHER_ID_AND_DATA_RANGE)
                    .setParameter("teacherId", teacherId).setParameter("from", from)
                    .setParameter("till", till).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    @Override
    public List<Group> findAllNotAdditional() {
        try {
            return entityManager.createNamedQuery(Group.FIND_BY_STATUS)
                    .setParameter("additional", false).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    @Override
    public List<Group> findByCourseId(long courseId) {
        try {
            return (List<Group>) entityManager.createNamedQuery(Group.FIND_BY_COURSE)
                    .setParameter("courseId", courseId).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @Override
    public Group findByNumberAndLetter(byte number, char letter) {
        try {
            return (Group) entityManager.createNamedQuery(Group.FIND_BY_NUMBER_LETTER)
                    .setParameter("number", number).setParameter("letter", letter)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

}