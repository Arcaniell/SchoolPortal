package school.service;

import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.model.Course;
import school.model.Role;

public interface CourseService {
    @Secured(Role.Secured.TEACHER)
    List<Course> getCourseByUserIdAndDataRange(long id, Date from, Date till);
}
