package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.CourseDao;
import school.model.Course;

@Repository
public class CourseDaoImpl extends BaseDaoImpl<Course, Long> implements CourseDao {

    public CourseDaoImpl() {
        super(Course.class);
    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Course> findAdditionCourseByYearAndArchiveFlag(int year, boolean flag) {
        try {
            return (List<Course>) entityManager
                    .createNamedQuery(Course.FIND_ADDITION_COURSE_BY_YEAR_AND_ARCHIVE_FLAG)
                    .setParameter("year", year).setParameter("flag", flag).getResultList();
        } catch (NoResultException e) {
            return null;
        }

    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Course> findAllByArchiveFlag(boolean flag) {
        try {
            return (List<Course>) entityManager
                    .createNamedQuery(Course.FIND_COURSE_BY_ARCHIVE_FLAG)
                    .setParameter("flag", flag).getResultList();
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Course> findAllByStatus(boolean status) {
        try {
            return (List<Course>) entityManager.createNamedQuery(Course.FIND_BY_STATUS)
                    .setParameter("active", status).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Course> findAllByStatusAndYear(boolean status, int year) {
        try {
            return (List<Course>) entityManager.createNamedQuery(Course.FIND_BY_STATUS_AND_YEAR)
                    .setParameter("active", status).setParameter("year", year).getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Course> findByGroupIdAndDataRange(long groupId, Date from, Date till) {
        try {
            return (List<Course>) entityManager
                    .createNamedQuery(Course.FIND_BY_GROUP_ID_AND_DATA_RANGE)
                    .setParameter("groupId", groupId).setParameter("from", from)
                    .setParameter("till", till).getResultList();
        } catch (NoResultException e) {
            return null;
        }

    }

    @Override
    @Transactional
    @SuppressWarnings("unchecked")
    public List<Course> findByTeacherIdAndDataRange(long teacherId, Date from, Date till) {
        try {
            return (List<Course>) entityManager
                    .createNamedQuery(Course.FIND_BY_TEACHER_ID_AND_DATA_RANGE)
                    .setParameter("teacherId", teacherId).setParameter("from", from)
                    .setParameter("till", till).getResultList();
        } catch (NoResultException e) {
            return null;
        }

    }

}
