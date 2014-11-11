package school.service;

import java.util.List;

import school.dto.CourseRequestDto;

public interface CourseRequestService {
    List<CourseRequestDto> findRequestsByUserId(long id);
}
