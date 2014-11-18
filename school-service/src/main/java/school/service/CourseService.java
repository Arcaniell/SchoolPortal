package school.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.dto.CourseTeacherDTO;
import school.model.Course;
import school.model.Role;

public interface CourseService {
    // @Secured("ROLE_TEACHER")
    List<Course> allCoursesinDateRangeForStudent(Principal user, Date from, Date till);

    List<Course> findCanRequestCourses(Principal user);

    List<CourseTeacherDTO> allCoursesinDateRangeForTeacher(Principal user,
            Date from, Date till);

}
