package school.service.implementation;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.CourseDao;
import school.dao.CourseRequestDao;
import school.dao.GroupDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.CourseDTO;
import school.model.Course;
import school.model.Group;
import school.model.Student;
import school.model.Teacher;
import school.service.CourseService;

/**
 * @author Blowder
 */
@Service
public class CourseServiceImpl implements CourseService {

    private final boolean COURSE_IS_NOT_ARCHIVE = false;
    private final String TRUE_IN_JSP = "YES";
    private final String FALSE_IN_JSP = "NO";
    private final String NO_DATA_IN_JSP = "-";
    private final int ZERO_GROUP_SIZE = 0;
    SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    CourseDao courseDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    CourseRequestDao courseRequestDao;
    @Autowired
    GroupDao groupDao;

    // STUDENT CONTROLLER CALL
    @Override
    public List<CourseDTO> allCoursesInDateRange4Student(Principal user, Date from, Date till) {
        // take courses form schedule
        // add to DTO base info
        long userId = Long.parseLong(user.getName());
        Student student = studentDao.findByUserId(userId);
        List<Group> additionalGroups = student.getAdditionGroups();
        Group mainGroup = student.getGroup();
        List<Group> allGroups = new ArrayList<Group>();
        allGroups.add(mainGroup);
        allGroups.addAll(additionalGroups);
        List<Course> allCoursesFromAllGroups = new ArrayList<Course>();
        for (Group group : allGroups) {
            allCoursesFromAllGroups.addAll(getCourseForGroup(group, from, till));
        }
        return fillCourseDTO(allCoursesFromAllGroups, from, till);
    }

    // TEACHER CONTROLLER CALL
    @Override
    public List<CourseDTO> allCoursesInDateRange4Teacher(Principal user, Date from, Date till) {
        long userId = Long.parseLong(user.getName());
        Teacher teacher = teacherDao.findByUserId(userId);
        List<Course> coursesFromTeacher = teacher.getCourse();
        List<CourseDTO> result = new ArrayList<CourseDTO>();
        result = fillCourseDTO(coursesFromTeacher, null, null);
        for (CourseDTO course : result) {
            int groupSize = groupDao.findAllByTeacherIdCourseIdDataRange(teacher.getId(),
                    course.getId(), from, till).size();
            course.setGroups(groupSize);
            if (groupSize != ZERO_GROUP_SIZE) {
                if (from != null) {
                    course.setFrom(formatterDate.format(from));
                }
                if (till != null) {
                    course.setTill(formatterDate.format(till));
                }
            }
        }
        return result;
    }

    // HEADTEACHER CONTROLLER CALL
    @Override
    public List<CourseDTO> getAllCourses() {
        List<Course> courses = courseDao.findAllByArchiveFlag(COURSE_IS_NOT_ARCHIVE);
        return fillCourseDTO(courses, null, null);
    }

    // HELPING METHOD FOR GROUP PARSE
    private List<CourseDTO> fillCourseDTO(List<Course> courses, Date from, Date till) {
        List<CourseDTO> result = new ArrayList<CourseDTO>();
        if (courses != null) {
            for (Course course : courses) {
                CourseDTO currentCourseDTO = new CourseDTO();
                currentCourseDTO.setId(course.getId());
                currentCourseDTO.setName(course.getCourseName());
                currentCourseDTO.setYear(course.getGroupNumber());
                currentCourseDTO.setRate(course.getCoeficient());
                if (course.isAdditional()) {
                    currentCourseDTO.setAdditional(TRUE_IN_JSP);
                } else {
                    currentCourseDTO.setAdditional(FALSE_IN_JSP);
                }
                if (from != null) {
                    currentCourseDTO.setFrom(formatterDate.format(from));
                } else {
                    currentCourseDTO.setFrom(NO_DATA_IN_JSP);
                }
                if (till != null) {
                    currentCourseDTO.setTill(formatterDate.format(till));
                } else {
                    currentCourseDTO.setTill(NO_DATA_IN_JSP);
                }
                result.add(currentCourseDTO);
            }
        }
        return result;
    }

    // HEADTEACHER COURSE MANAGE CONTROLLER CALL
    @Override
    public void saveNewCourse(Course course) {
        courseDao.save(course);
    }

    // HEADTEACHER COURSE MANAGE CONTROLLER CALL
    @Override
    public void deleteAllCoursesWithIds(Long[] IdArray) {
        for (Long id : IdArray) {
            Course current = courseDao.findById(id);
            current.setArchive(true);
            courseDao.update(current);
        }
    }

    // HELP METHOD FOR TEACHER AND STUDENT SERVICE
    public List<Course> getCourseForGroup(Group group, Date from, Date till) {
        List<Course> listCourses = new ArrayList<Course>();
        try {
            List<Course> course = courseDao.findByGroupIdAndDataRange(group.getId(), from, till);
            if (course != null) {
                listCourses.addAll(course);
            }
        } catch (Exception e) {
            // nothing to do here, return empty list
        }
        return listCourses;
    }

    // HEADTEACHER GROUP CONTROLLER CALL
    @Override
    public List<CourseDTO> getCoursesForYear(int year) {
        List<Course> courses = courseDao.findAdditionCourseByYearAndArchiveFlag(year,
                COURSE_IS_NOT_ARCHIVE);
        return fillCourseDTO(courses, null, null);
    }

}
