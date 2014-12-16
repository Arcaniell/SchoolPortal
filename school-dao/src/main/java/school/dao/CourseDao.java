package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Course;

public interface CourseDao extends BaseDao<Course, Long> {

    List<Course> findAdditionCourseByYearAndArchiveFlag(int year, boolean flag);

    List<Course> findAllByArchiveFlag(boolean flag);

    List<Course> findAllByStatus(boolean status);

    List<Course> findAllByStatusAndYear(boolean status, int year);

    List<Course> findByGroupIdAndDataRange(long groupId, Date from, Date till);

    List<Course> findByTeacherIdAndDataRange(long teacherId, Date from, Date till);

}
