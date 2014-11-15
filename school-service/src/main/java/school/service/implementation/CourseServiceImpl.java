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
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    CourseRequestDao courseRequestDao;

    List<Course> getCourseForGroup(Group group, Date from, Date till) {
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
    public List<Course> findAllByStatusAndYear(boolean status, int year,
            long userId) {
        Student student = studentDao.findByUserId(userId);
        if (student == null) {
            return null;
        }
        List<CourseRequest> additionCourses = courseRequestDao
                .findAllByStudentId(student.getId());
        List<Course> courses = courseDao.findAllByStatusAndYear(status, year);
        if (courseDao == null && courseRequestDao == null) {
            return null;
        }
        for (int i = 0; i < additionCourses.size(); i++) {
            for (int j = 0; j < courses.size(); j++) {
                if (additionCourses.get(i).getCourse().getId() == courses
                        .get(j).getId()) {
                    courses.remove(j);
                }
            }
        }
        return courses;
    }
}
