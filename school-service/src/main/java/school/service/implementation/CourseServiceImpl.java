package school.service.implementation;

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

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    CourseRequestDao courseRequestDao;

    @Override
    public List<Course> getCourseByUserIdAndDataRange(long id, Date from,
            Date till) {
        Student student = studentDao.findByUserId(id);
        if (student == null) {
            System.err.println("NO SUCH STUDENT");
            return null;
        }
        Group group = student.getGroup();
        List<Group> additionalGroups = student.getAdditionGroups();
        List<Course> courses = new ArrayList<Course>();
        // select one
        if (group != null) {
            try {
                courses.addAll(courseDao.findByGroupIdAndDataRange(
                        group.getId(), from, till));
            } catch (Exception e) {
                System.err
                        .println("error in CourseService findByGroupIdAndDataRange");
                e.printStackTrace();
                return null;
            }
        }
        // select two
        if (additionalGroups != null) {
            try {
                for (Group groups : additionalGroups) {
                    courses.addAll(courseDao.findByGroupIdAndDataRange(
                            groups.getId(), from, till));
                }
            } catch (Exception e) {
                System.err
                        .println("error in CourseService findByGroupIdAndDataRange");
                e.printStackTrace();
                return null;
            }
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
