package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.CourseRequestDao;
import school.model.CourseRequest;

@Repository
public class CourseRequestImpl extends BaseDaoImpl<CourseRequest, Long>
        implements CourseRequestDao {

    public CourseRequestImpl() {
        super(CourseRequest.class);
    }

    @Transactional
    @Override
    public CourseRequest findById(long id) {
        try {
            CourseRequest courseRequest = (CourseRequest) entityManager
                    .createQuery(
                            "select e from "
                                    + CourseRequest.class.getSimpleName()
                                    + " e where e.id = :id")
                    .setParameter("id", id).getSingleResult();
            courseRequest.getStudent().getId();
            courseRequest.getCourse().getId();
            return courseRequest;
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllByStatus(boolean status) {
        try {
            if (entityManager != null) {
                return (List<CourseRequest>) entityManager
                        .createNamedQuery(CourseRequest.FIND_ALL_BY_STATUS)
                        .setParameter("active", status).getResultList();

            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllByInterval(Date from, Date till) {
        try {
            if (entityManager != null) {
                return (List<CourseRequest>) entityManager
                        .createNamedQuery(CourseRequest.FIND_BY_INTERVAL)
                        .setParameter("from", from).setParameter("till", till)
                        .getResultList();

            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllByStudentId(long id) {
        try {
            if (entityManager != null) {
                return (List<CourseRequest>) entityManager
                        .createNamedQuery(CourseRequest.FIND_BY_STUDENT_ID)
                        .setParameter("id", id).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<CourseRequest> findAllBySubjectId(long id) {
        try {
            if (entityManager != null) {
                return (List<CourseRequest>) entityManager
                        .createNamedQuery(CourseRequest.FIND_BY_COURSE_ID)
                        .setParameter("id", id).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    @Override
    public List<CourseRequest> findByCourseIdAndStatus(long courseId,
            boolean status) {
        try {
            if (entityManager != null) {
                return (List<CourseRequest>) entityManager
                        .createNamedQuery(
                                CourseRequest.FIND_BY_COURSE_ID_AND_STATUS)
                        .setParameter("id", courseId)
                        .setParameter("active", status).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

    @Transactional
    @SuppressWarnings("unchecked")
    @Override
    public int deleteAllByCourseId(long id) {
        try {
            if (entityManager != null) {
                return entityManager
                        .createNamedQuery(
                                CourseRequest.DELETE_ALL_WITH_COURSE_ID)
                        .setParameter("id", id).executeUpdate();
            }
            return 0;
        } catch (NoResultException e) {
            return 0;
        }

    }

}
