package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.exceptions.MySQLSyntaxErrorException;

import school.dao.CourseDao;
import school.model.Course;

@Repository
public class CourseDaoImpl extends BaseDaoImpl<Course, Long> implements
        CourseDao {

    public CourseDaoImpl() {
        super(Course.class);
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findAllByStatus(boolean status) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(Course.FIND_BY_STATUS)
                        .setParameter("active", status).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findAllByStatusAndYear(boolean status,int year) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(Course.FIND_BY_STATUS_AND_YEAR)
                        .setParameter("active", status).setParameter("year", year).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findByGroupNumber(int groupNumber)
            throws NoResultException, MySQLSyntaxErrorException {
        if (entityManager != null) {
            return (List<Course>) entityManager
                    .createNamedQuery(Course.FIND_BY_GROUP_NUMBER)
                    .setParameter("groupNumber", groupNumber).getResultList();
        } else {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findByCoefficient(int coefficient) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(Course.FIND_BY_COEFFICIENT)
                        .setParameter("coefficient", coefficient)
                        .getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findByCourseName(String courseName) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(Course.FIND_BY_COURSE_NAME)
                        .setParameter("courseName", courseName).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findByCourseNameAndGroupNumber(String courseName,
            int groupNumber) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(Course.FIND_BY_NAME_AND_NUMBER)
                        .setParameter("courseName", courseName)
                        .setParameter("groupNumber", groupNumber)
                        .getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findByPriceRange(int from, int to) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(Course.FIND_BY_PRICE_RANGE)
                        .setParameter("from", from).setParameter("to", to)
                        .getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @SuppressWarnings("unchecked")
    @Transactional
    public List<Course> findByGroupIdAndDataRange(long groupId, Date from,
            Date till) {
        try {
            if (entityManager != null) {
                return (List<Course>) entityManager
                        .createNamedQuery(
                                Course.FIND_BY_GROUP_ID_AND_DATA_RANGE)
                        .setParameter("groupId", groupId)
                        .setParameter("from", from).setParameter("till", till)
                        .getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

}
