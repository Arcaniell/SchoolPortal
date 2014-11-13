package school.service;

import java.util.Date;
import java.util.List;

import school.dto.CourseRequestStudentDTO;
import school.dto.CourseRequestTeacherDTO;

/**
 * @author Blowder
 */
public interface CourseRequestService {
    List<CourseRequestStudentDTO> findRequestsByUserId(long id);

    void addCourseRequest(long userId, long courseId);

    void removeRequest(long requestId);

    List<CourseRequestTeacherDTO> showAllRequests();

    void deleteAllRequestsWithCourseId(long id);
    
    void formGroupAndCloseRequests(long courseId, Date from, Date till);

}
