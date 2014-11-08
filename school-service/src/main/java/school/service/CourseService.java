package school.service;

import java.util.Date;
import java.util.List;

import school.model.Course;

public interface CourseService {
    List<Course> getCourseByUserIdAndDataRange(int id, Date from, Date till);
}
