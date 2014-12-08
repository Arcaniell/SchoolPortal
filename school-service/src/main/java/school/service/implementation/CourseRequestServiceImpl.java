package school.service.implementation;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.CourseDao;
import school.dao.CourseRequestDao;
import school.dao.StudentDao;
import school.dto.CourseRequestStudentDTO;
import school.dto.CourseRequestTeacherDTO;
import school.model.Course;
import school.model.CourseRequest;
import school.model.Student;
import school.service.CourseRequestService;
import school.service.GroupService;
import school.service.utils.SchoolUtil;

/**
 * @author Blowder
 */
@Service
public class CourseRequestServiceImpl implements CourseRequestService {
    private final boolean ADDITIONAL_GROUP_FLAG = true;
    private final boolean COURSE_REQUEST_ACTIVE_FLAG = true;
    private final boolean COURSE_ARCHIVE_FLAG = true;
    @Autowired
    CourseRequestDao courseRequestDao;
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    GroupService groupService;

    // find all requests for current user
    @Override
    public List<CourseRequestStudentDTO> findUserCourseRequests(Principal user) {
        long id = Long.parseLong(user.getName());
        Student student = studentDao.findByUserId(id);
        if (student == null) {
            return null;
        }
        List<CourseRequest> requests = student.getCourseRequest();
        if (requests == null) {
            return null;
        }
        List<Course> archivedCourses = courseDao.findAllByArchiveFlag(COURSE_ARCHIVE_FLAG);
        for (Course course : archivedCourses) {
            Iterator<CourseRequest> requestIterator = requests.iterator();
            while (requestIterator.hasNext()) {
                if (requestIterator.next().getCourse().equals(course)) {
                    requestIterator.remove();
                }
            }
        }
        // setting DTO object
        ArrayList<CourseRequestStudentDTO> listCourseRequestsDTO = new ArrayList<CourseRequestStudentDTO>();
        for (CourseRequest courseRequest : requests) {
            CourseRequestStudentDTO courseRequestDTO = new CourseRequestStudentDTO();
            courseRequestDTO.setId(courseRequest.getId());
            Course courseFromCurrentRequest = courseRequest.getCourse();
            if (courseFromCurrentRequest != null) {
                courseRequestDTO.setCourseName(courseFromCurrentRequest.getCourseName());
                courseRequestDTO.setCourseYear(courseFromCurrentRequest.getGroupNumber());
                courseRequestDTO.setMembers(courseRequestDao.findAllBySubjectId(
                        courseFromCurrentRequest.getId()).size());
            }
            SimpleDateFormat formatterDate = new SimpleDateFormat(SchoolUtil.UI_DATE_FORMAT);
            courseRequestDTO.setDateOfRequest(formatterDate.format(courseRequest.getDate()));
            listCourseRequestsDTO.add(courseRequestDTO);
        }
        return listCourseRequestsDTO;
    }

    @Override
    public void addCourseRequest(long userId, long courseId) {
        CourseRequest courseRequest = new CourseRequest();
        Course course = courseDao.findById(courseId);
        course.setAdditional(true);
        Student student = studentDao.findByUserId(userId);
        courseRequest.setStudent(student);
        courseRequest.setCourse(course);
        courseRequest.setActive(COURSE_REQUEST_ACTIVE_FLAG);
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

    @Override
    public List<CourseRequestTeacherDTO> showAllRequests() {
        List<CourseRequestTeacherDTO> listOfCourseRequests = new ArrayList<CourseRequestTeacherDTO>();
        List<Course> additionCourses = courseDao.findAllByStatus(ADDITIONAL_GROUP_FLAG);
        List<Course> archivedCourses = courseDao.findAllByArchiveFlag(COURSE_ARCHIVE_FLAG);
        additionCourses.removeAll(archivedCourses);
        for (Course course : additionCourses) {
            long idOfCurrentCourse = course.getId();
            List<CourseRequest> requestsForCurrentCourse = courseRequestDao
                    .findByCourseIdAndStatus(idOfCurrentCourse, COURSE_REQUEST_ACTIVE_FLAG);
            if (requestsForCurrentCourse == null || requestsForCurrentCourse.size() == 0) {
                continue;
            }
            CourseRequestTeacherDTO currentElementDTO = new CourseRequestTeacherDTO();
            currentElementDTO.setId(idOfCurrentCourse);
            currentElementDTO.setName(course.getCourseName());
            currentElementDTO.setYear(course.getGroupNumber());
            currentElementDTO.setSize(requestsForCurrentCourse.size());
            listOfCourseRequests.add(currentElementDTO);

        }
        return listOfCourseRequests;
    }

    @Override
    public void deleteAllRequestsWithCourseId(long id) {
        courseRequestDao.deleteAllByCourseId(id);
    }

    @Override
    public void formGroupAndCloseRequests(long courseId, Date from, Date till) {
        List<CourseRequest> requestsForCurrentCourse = courseRequestDao.findByCourseIdAndStatus(
                courseId, COURSE_REQUEST_ACTIVE_FLAG);
        List<Student> students = new ArrayList<Student>();
        for (CourseRequest request : requestsForCurrentCourse) {
            students.add(request.getStudent());
        }
        Course course = courseDao.findById(courseId);
        groupService.createAdditionGroup(students, course, from, till);
    }

}
