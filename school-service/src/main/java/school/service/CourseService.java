package school.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.dto.CourseDTO;
import school.model.Course;

public interface CourseService {
    // @Secured("ROLE_TEACHER")
    List<CourseDTO> allCoursesInDateRangeForStudent(Principal principal, Date from, Date till);

    List<Course> findCanRequestCourses(Principal principal);

    List<CourseDTO> allCoursesInDateRangeForTeacher(Principal principal, Date from, Date till);

    List<CourseDTO> getCoursesForYear(int year);

    List<CourseDTO> getAllCourses();

    void deleteAllCoursesWithIds(Long[] IdArray);

    void saveNewCourse(Course createdCourse);

}
