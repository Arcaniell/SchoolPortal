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
import school.dao.GroupDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.CourseDTO;
import school.model.Course;
import school.model.CourseRequest;
import school.model.Group;
import school.model.Student;
import school.model.Teacher;
import school.service.CourseService;

/**
 * @author Blowder
 */
@Service
public class CourseServiceImpl implements CourseService {
    private final boolean COURSE_STATUS = true;
    private final boolean COURSE_IS_NOT_ARCHIVE = false;
    private final String TRUE_IN_JSP = "YES";
    private final String FALSE_IN_JSP = "NO";
    private final String NO_DATA_IN_JSP = "-";
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
        List<CourseDTO> listCoursesDTO = new ArrayList<CourseDTO>();
        for (Course course : allCoursesFromAllGroups) {
            CourseDTO currentCourseDTO = new CourseDTO();
            currentCourseDTO.setId(course.getId());
            currentCourseDTO.setName(course.getCourseName());
            currentCourseDTO.setYear(course.getGroupNumber());
            if (course.isAdditional()) {
                currentCourseDTO.setAdditional(TRUE_IN_JSP);
            } else {
                currentCourseDTO.setAdditional(FALSE_IN_JSP);
            }
            currentCourseDTO.setFrom(formatterDate.format(from));
            currentCourseDTO.setTill(formatterDate.format(till));
            listCoursesDTO.add(currentCourseDTO);
        }
        return listCoursesDTO;
    }

    // TEACHER CONTROLLER CALL
    @Override
    public List<CourseDTO> allCoursesInDateRange4Teacher(Principal user, Date from, Date till) {
        // take courses form schedule
        // take course from teacher
        // add to DTO base info
        // add to DTO EXT info from schedule
        long userId = Long.parseLong(user.getName());
        Teacher teacher = teacherDao.findByUserId(userId);
        List<Course> coursesFromTeacher = teacher.getCourse();
        List<Course> coursesFromSchedule = courseDao.findByTeacherIdAndDataRange(teacher.getId(),
                from, till);

        List<CourseDTO> jspCoursesList = new ArrayList<CourseDTO>();
        for (Course currentCourse : coursesFromTeacher) {
            CourseDTO temporaryCourseDTO = new CourseDTO();
            temporaryCourseDTO.setId(currentCourse.getId());
            temporaryCourseDTO.setName(currentCourse.getCourseName());
            temporaryCourseDTO.setYear(currentCourse.getGroupNumber());
            if (currentCourse.isAdditional()) {
                temporaryCourseDTO.setAdditional(TRUE_IN_JSP);
            } else {
                temporaryCourseDTO.setAdditional(FALSE_IN_JSP);
            }
            temporaryCourseDTO.setRate(currentCourse.getCoeficient());
            temporaryCourseDTO.setFrom(NO_DATA_IN_JSP);
            temporaryCourseDTO.setTill(NO_DATA_IN_JSP);
            Iterator<Course> additionCourse = coursesFromSchedule.iterator();
            while (additionCourse.hasNext()) {
                if (currentCourse.getId() == additionCourse.next().getId()) {
                    temporaryCourseDTO.setFrom(formatterDate.format(from));
                    temporaryCourseDTO.setTill(formatterDate.format(till));
                    additionCourse.remove();
                }
            }

            temporaryCourseDTO.setGroups(groupDao.findAllByTeacherIdCourseIdDataRange(
                    teacher.getId(), currentCourse.getId(), from, till).size());
            jspCoursesList.add(temporaryCourseDTO);
        }
        for (Course additionCourse : coursesFromSchedule) {
            CourseDTO temporaryCourseDTO = new CourseDTO();
            temporaryCourseDTO.setId(additionCourse.getId());
            temporaryCourseDTO.setName(additionCourse.getCourseName());
            temporaryCourseDTO.setYear(additionCourse.getGroupNumber());
            if (additionCourse.isAdditional()) {
                temporaryCourseDTO.setAdditional(TRUE_IN_JSP);
            } else {
                temporaryCourseDTO.setAdditional(FALSE_IN_JSP);
            }
            temporaryCourseDTO.setRate(additionCourse.getCoeficient());
            temporaryCourseDTO.setFrom(formatterDate.format(from));
            temporaryCourseDTO.setTill(formatterDate.format(till));
            temporaryCourseDTO.setGroups(groupDao.findAllByTeacherIdCourseIdDataRange(
                    teacher.getId(), additionCourse.getId(), from, till).size());
            jspCoursesList.add(temporaryCourseDTO);
        }
        return jspCoursesList;
    }

    // HEADTEACHER CONTROLLER CALL
    @Override
    public List<CourseDTO> getAllCourses() {
        List<Course> courses = courseDao.findAllByArchiveFlag(COURSE_IS_NOT_ARCHIVE);
        return fillCourseDTOList(courses);
    }

    // HEADTEACHER GROUP MANAGE CONTROLLER CALL
    @Override
    public void saveNewCourse(Course course) {
        courseDao.save(course);
    }

    // HEADTEACHER GROUP MANAGE CONTROLLER CALL
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

    // HELP METHOD FOR HEADTEACHER SERVICE
    private List<CourseDTO> fillCourseDTOList(List<Course> courses) {
        List<CourseDTO> container = new ArrayList<CourseDTO>();
        if (courses != null) {
            for (Course course : courses) {
                CourseDTO currentDTO = new CourseDTO();
                currentDTO.setId(course.getId());
                currentDTO.setName(course.getCourseName());
                if (course.isAdditional()) {
                    currentDTO.setAdditional(TRUE_IN_JSP);
                } else {
                    currentDTO.setAdditional(FALSE_IN_JSP);
                }
                currentDTO.setYear(course.getGroupNumber());
                container.add(currentDTO);
            }
        }
        return container;
    }

    @Override
    public List<Course> findCanRequestCourses(Principal principal) {
        long userId = Long.parseLong(principal.getName());
        Student student = studentDao.findByUserId(userId);
        Group mainGroup = student.getGroup();
        if (student == null || mainGroup == null) {
            return null;
        }

        List<CourseRequest> additionCourses = courseRequestDao.findAllByStudentId(student.getId());
        List<Course> canSignCourses = courseDao.findAllByStatusAndYear(COURSE_STATUS,
                mainGroup.getNumber());
        Iterator<Course> steratorCanSignCourse = canSignCourses.iterator();
        while (steratorCanSignCourse.hasNext()) {
            if (steratorCanSignCourse.next().isArchive()) {
                steratorCanSignCourse.remove();
            }
        }
        // check if user already sign to one of the list of available courses
        for (int i = 0; i < additionCourses.size(); i++) {
            for (int j = 0; j < canSignCourses.size(); j++) {
                if (additionCourses.get(i).getCourse().getId() == canSignCourses.get(j).getId()) {
                    canSignCourses.remove(j);
                }
            }
        }
        return canSignCourses;
    }

    @Override
    public List<CourseDTO> getCoursesForYear(int year) {
        List<Course> courses = courseDao.findAdditionCourseByYearAndArchiveFlag(year,
                COURSE_IS_NOT_ARCHIVE);
        return fillCourseDTOList(courses);
    }

}
