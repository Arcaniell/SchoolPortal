package school.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import school.dto.CourseRequestStudentDTO;
import school.dto.CourseRequestTeacherDTO;
import school.model.Course;
import school.model.Student;

/**
 * @author Blowder
 */
public interface CourseRequestService {

    List<CourseRequestStudentDTO> findUserCourseRequests(Principal user);
    
    void addCourseRequest(long userId, long courseId);

    void removeRequest(long requestId);

    List<CourseRequestTeacherDTO> showAllRequests();

    void deleteAllRequestsWithCourseId(long id);

    void formGroupAndCloseRequests(long courseId, Date from, Date till);

    List<Course> findCanRequestCourses(Principal principal);


    

}
