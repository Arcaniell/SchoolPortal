package school.service;

import java.util.Date;
import java.util.List;

import school.model.Course;

public interface CourseService {
    List<Course> getCourseByUserIdAndDataRange(long id, Date from, Date till);
}
