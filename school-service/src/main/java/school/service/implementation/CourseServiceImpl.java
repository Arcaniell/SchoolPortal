package school.service.implementation;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.CourseDao;
import school.dao.CourseRequestDao;
import school.dao.StudentDao;
import school.model.Course;
import school.model.CourseRequest;
import school.model.Group;
import school.model.Student;
import school.service.CourseService;

/**
 * @author Blowder
 */
@Service
public class CourseServiceImpl implements CourseService {
    final boolean COURSE_STATUS = true;
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    CourseRequestDao courseRequestDao;

    public List<Course> getCourseForGroup(Group group, Date from, Date till) {
        List<Course> listCourses = new ArrayList<Course>();
        try {
            List<Course> course = courseDao.findByGroupIdAndDataRange(
                    group.getId(), from, till);
            if (course != null) {
                listCourses.addAll(course);
            }
        } catch (Exception e) {
            // nothing to do here, return empty list
        }
        return listCourses;
    }

    @Override
    public List<Course> allCoursesinDateRangeForStudent(Principal user,
            Date from, Date till) {
        long userId = Long.parseLong(user.getName());
        Student student = studentDao.findByUserId(userId);
        Group group = student.getGroup();
        List<Group> additionalGroups = student.getAdditionGroups();
        List<Course> courses = new ArrayList<Course>();
        // select courses from schedule of primary group
        courses.addAll(getCourseForGroup(group, from, till));
        // select courses from schedule of additional group
        for (Group groupElement : additionalGroups) {
            courses.addAll(getCourseForGroup(groupElement, from, till));
        }
        return courses;
    }

    @Override
    public List<Course> findCanRequestCourses(Principal user) {
        long userId = Long.parseLong(user.getName());
        Student student = studentDao.findByUserId(userId);
        Group mainGroup = student.getGroup();
        if (student == null || mainGroup == null) {
            return null;
        }

        List<CourseRequest> additionCourses = courseRequestDao
                .findAllByStudentId(student.getId());
        List<Course> canSignCourses = courseDao.findAllByStatusAndYear(
                COURSE_STATUS, mainGroup.getNumber());
        // check if user already sign to one of the list of available courses
        for (int i = 0; i < additionCourses.size(); i++) {
            for (int j = 0; j < canSignCourses.size(); j++) {
                if (additionCourses.get(i).getCourse().getId() == canSignCourses
                        .get(j).getId()) {
                    canSignCourses.remove(j);
                }
            }
        }
        return canSignCourses;
    }
}
