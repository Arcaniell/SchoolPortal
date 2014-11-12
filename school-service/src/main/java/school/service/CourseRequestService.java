package school.service;

import java.util.List;

import school.dto.CourseRequestDto;

public interface CourseRequestService {
    List<CourseRequestDto> findRequestsByUserId(long id);

    void addCourseRequest(long userId, long courseId);

    void removeRequest(long requestId);
}
