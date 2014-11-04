package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import school.dao.CourseRequestDao;
import school.model.CourseRequest;

@Repository
public class CourseRequestImpl extends BaseDaoImpl<CourseRequest, Long>
        implements CourseRequestDao {

    public CourseRequestImpl() {
        super(CourseRequest.class);
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
                        .createNamedQuery(CourseRequest.FIND_BY_SUBJECT_ID)
                        .setParameter("id", id).getResultList();
            } else {
                return null;
            }
        } catch (NoResultException e) {
            return null;
        }
    }

}
