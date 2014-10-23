package school.dao;

import java.util.Date;
import java.util.Set;

import school.model.CourseRequest;

public interface CourseRequestDao extends BaseDao<CourseRequest> {
    Set<CourseRequest> findActive();

    Set<CourseRequest> findArchived();

    Set<CourseRequest> findByDate(Date date);

    Set<CourseRequest> findByInterval(Date from, Date till);

    Set<CourseRequest> findByStudentId(long id);

    Set<CourseRequest> findBySubjectId(long id);
}
