package school.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.dto.CourseDTO;
import school.model.Course;

public interface CourseService {

    List<CourseDTO> allCoursesInDateRange4Student(Principal principal, Date from, Date till);

    List<CourseDTO> allCoursesInDateRange4Teacher(Principal principal, Date from, Date till);

    List<Course> findCanRequestCourses(Principal principal);

    List<CourseDTO> getCoursesForYear(int year);

    List<CourseDTO> getAllCourses();

    void deleteAllCoursesWithIds(Long[] IdArray);

    void saveNewCourse(Course createdCourse);

}
