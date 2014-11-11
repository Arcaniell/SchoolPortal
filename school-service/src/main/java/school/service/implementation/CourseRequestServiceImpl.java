package school.service.implementation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.CourseDao;
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
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;

    @Override
    public List<CourseRequestDto> findRequestsByUserId(long id) {
        SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");

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
        for (CourseRequest courseRequest : requests) {
            CourseRequestDto courseRequestDto = new CourseRequestDto();
            courseRequestDto.setId(courseRequest.getId());
            Course course = courseRequest.getCourse();
            if (course != null) {
                courseRequestDto.setCourseName(course.getCourseName());
                courseRequestDto.setCourseYear(course.getGroupNumber());
                courseRequestDto.setMembers(courseRequestDao
                        .findAllBySubjectId(course.getId()).size());
            }
            courseRequestDto.setDateOfRequest(formatterDate
                    .format(courseRequest.getDate()));
            courseRequestDto.setActive(courseRequest.isActive());
            // courseRequestDao
            dtoList.add(courseRequestDto);
        }
        return dtoList;
    }

    @Override
    public void addCourseRequest(long userId, long courseId) {
        CourseRequest courseRequest = new CourseRequest();
        Course course = courseDao.findById(courseId); 
        course.setAdditional(true);
        Student student = studentDao.findByUserId(userId);
        courseRequest.setStudent(student);
        courseRequest.setCourse(course);
        courseRequest.setDate(new Date());
        courseRequestDao.update(courseRequest);
    }

    @Override
    public void removeRequest(long requestId) {
        if (courseRequestDao != null) {
            CourseRequest request = courseRequestDao.findById(requestId);
            if (request != null) {
                courseRequestDao.remove(request);
            }
        }

    }
}
