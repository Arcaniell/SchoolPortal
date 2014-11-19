package school.service.implementation;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
    final boolean COURSE_STATUS = true;
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

    @Override
    public List<CourseDTO> allCoursesInDateRangeForTeacher(
            Principal user, Date from, Date till) {
        long userId = Long.parseLong(user.getName());
        Teacher teacher = teacherDao.findByUserId(userId);
        List<Course> coursesFromTeacher = teacher.getCourse();
        List<Course> coursesFromSchedule = courseDao
                .findByTeacherIdAndDataRange(teacher.getId(), from, till);

        List<CourseDTO> jspCoursesList = new ArrayList<CourseDTO>();
        for (Course currentCourse : coursesFromTeacher) {
            CourseDTO temporaryCourseDTO = new CourseDTO();
            temporaryCourseDTO.setId(currentCourse.getId());
            temporaryCourseDTO.setName(currentCourse.getCourseName());
            temporaryCourseDTO.setYear(currentCourse.getGroupNumber());
            if (currentCourse.isAdditional()) {
                temporaryCourseDTO.setAdditional("YES");
            } else {
                temporaryCourseDTO.setAdditional("NO");
            }
            temporaryCourseDTO.setRate(currentCourse.getCoeficient());
            temporaryCourseDTO.setFrom("-");
            temporaryCourseDTO.setTill("-");
            Iterator<Course> additionCourse = coursesFromSchedule.iterator();
            while (additionCourse.hasNext()) {
                if (currentCourse.getId() == additionCourse.next().getId()) {
                    temporaryCourseDTO.setFrom(formatterDate.format(from));
                    temporaryCourseDTO.setTill(formatterDate.format(till));
                    additionCourse.remove();
                }
            }

            temporaryCourseDTO.setGroups(groupDao
                    .findAllByTeacherIdCourseIdDataRange(teacher.getId(),
                            currentCourse.getId(), from, till).size());
            // add element to main JSP list
            jspCoursesList.add(temporaryCourseDTO);
        }
        for (Course additionCourse : coursesFromSchedule) {
            CourseDTO temporaryCourseDTO = new CourseDTO();
            temporaryCourseDTO.setId(additionCourse.getId());
            temporaryCourseDTO.setName(additionCourse.getCourseName());
            temporaryCourseDTO.setYear(additionCourse.getGroupNumber());
            if (additionCourse.isAdditional()) {
                temporaryCourseDTO.setAdditional("YES");
            } else {
                temporaryCourseDTO.setAdditional("NO");
            }
            temporaryCourseDTO.setRate(additionCourse.getCoeficient());
            temporaryCourseDTO.setFrom(formatterDate.format(from));
            temporaryCourseDTO.setTill(formatterDate.format(till));
            temporaryCourseDTO.setGroups(groupDao
                    .findAllByTeacherIdCourseIdDataRange(teacher.getId(),
                            additionCourse.getId(), from, till).size());
            // add element to main JSP list
            jspCoursesList.add(temporaryCourseDTO);
        }
        return jspCoursesList;
    }

    @Override
    public List<CourseDTO> allCoursesInDateRangeForStudent(
            Principal user, Date from, Date till) {
        long userId = Long.parseLong(user.getName());
        Student student = studentDao.findByUserId(userId);
        // get student groups
        List<Group> additionalGroups = student.getAdditionGroups();
        Group mainGroup = student.getGroup();
        List<Group> allGroups = new ArrayList<Group>();
        allGroups.add(mainGroup);
        allGroups.addAll(additionalGroups);

        List<Course> allCoursesFromAllGroups = new ArrayList<Course>();
        for (Group group : allGroups) {
            allCoursesFromAllGroups
                    .addAll(getCourseForGroup(group, from, till));
        }
        List<CourseDTO> listCoursesDTO = new ArrayList<CourseDTO>();
        for (Course course : allCoursesFromAllGroups) {
            CourseDTO currentCourseDTO = new CourseDTO();
            currentCourseDTO.setId(course.getId());
            currentCourseDTO.setName(course.getCourseName());
            currentCourseDTO.setYear(course.getGroupNumber());
            if (course.isAdditional()) {
                currentCourseDTO.setAdditional("YES");
            } else {
                currentCourseDTO.setAdditional("NO");
            }
            currentCourseDTO.setFrom(formatterDate.format(from));
            currentCourseDTO.setTill(formatterDate.format(till));
            listCoursesDTO.add(currentCourseDTO);
        }
        return listCoursesDTO;
    }
}
