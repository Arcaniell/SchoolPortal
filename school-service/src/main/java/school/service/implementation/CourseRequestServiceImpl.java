package school.service.implementation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.CourseRequestDao;
import school.dao.StudentDao;
import school.dto.CourseRequestDto;
import school.model.Course;
import school.model.CourseRequest;
import school.model.Student;
import school.service.CourseRequestService;

@Service
public class CourseRequestServiceImpl implements CourseRequestService {
    @Autowired
    CourseRequestDao courseRequestDao;
    @Autowired
    StudentDao studentDao;

    @Override
    public List<CourseRequestDto> findRequestsByUserId(long id) {
        SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
        CourseRequestDto courseRequestDto = new CourseRequestDto();
        ArrayList<CourseRequestDto> dtoList = new ArrayList<CourseRequestDto>();
        if (studentDao == null || courseRequestDao == null) {
            return null;
        }
        Student student = studentDao.findByUserId(id);
        if (student == null) {
            return null;
        }
        List<CourseRequest> requests = student.getCourseRequest();
        if (requests == null) {
            return null;
        }
        System.out.println(requests.size());
        for (CourseRequest courseRequest : requests) {
            courseRequestDto.setId(courseRequest.getId());
            Course course = courseRequest.getCourse();
            if (course != null) {
                courseRequestDto.setCourseName(course.getCourseName());
                courseRequestDto.setCourseYear(course.getGroupNumber());
            }
            courseRequestDto.setDateOfRequest(formatterDate.format(courseRequest.getDate()));
            courseRequestDto.setActive(courseRequest.isActive());
            // courseRequestDao.
            courseRequestDto.setMembers(00);
            dtoList.add(courseRequestDto);
        }
        return dtoList;
    }
}
