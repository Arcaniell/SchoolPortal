package school.service;

import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.model.Course;
import school.model.Role;

public interface CourseService {
    // @Secured("ROLE_TEACHER")
    List<Course> getCourseByUserIdAndDataRange(long id, Date from, Date till);

    List<Course> findAllByStatusAndYear(boolean status, int year, long userId);

}
