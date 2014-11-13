package school.dao;

import java.util.Date;
import java.util.List;

import school.model.CourseRequest;

public interface CourseRequestDao extends BaseDao<CourseRequest, Long> {
    List<CourseRequest> findAllByStatus(boolean status);

    List<CourseRequest> findAllByInterval(Date from, Date till);

    List<CourseRequest> findAllByStudentId(long id);

    List<CourseRequest> findAllBySubjectId(long id);

    CourseRequest findById(long id);

    List<CourseRequest> findByCourseIdAndStatus(long courseId, boolean status);

    int deleteAllByCourseId(long id);

}
