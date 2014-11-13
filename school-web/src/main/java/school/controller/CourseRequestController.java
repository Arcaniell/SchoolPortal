package school.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.dao.StudentDao;
import school.dto.CourseRequestStudentDTO;
import school.dto.CourseRequestTeacherDTO;
import school.model.Course;
import school.service.CourseRequestService;
import school.service.CourseService;
import school.service.UserService;

/**
 * @author Blowder
 */
@Controller
public class CourseRequestController {
    final String TABLE_TEACHER_FORM_LIST = "requests";
    private final int ONE_MONTH_IN_DAYS = 30;

    long userId = 155L;
    @Autowired
    CourseRequestService courseRequestService;
    @Autowired
    CourseService courseService;
    @Autowired
    StudentDao student;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/course-request")
    public String courseChooseRole() {
        if (userService.isUserHeadTeacher(userId)) {
            return "redirect:/course-request-for-teacher";
        }
        if (userService.isUserStudent(userId)) {
            return "redirect:/course-request-for-student";
        }
        return "redirect:/home";
    }

    @RequestMapping(value = "/course-request-for-student")
    public String studentRequest(Model model) {
        List<CourseRequestStudentDTO> list = courseRequestService
                .findRequestsByUserId(155L);
        List<Course> course = courseService.findAllByStatusAndYear(true, 7,
                155L);
        model.addAttribute("haveCourses", course);
        model.addAttribute("courseList", list);

        return "course-request-student";
    }

    @RequestMapping(value = "/course-request/request")
    public String studentAddRequest(
            @RequestParam(value = "courseId", required = false) String courseId) {
        if (courseId == null) {
            return "redirect:/course-request";
        }
        courseRequestService.addCourseRequest(userId,
                Integer.parseInt(courseId));
        return "redirect:/course-request-for-student";
    }

    @RequestMapping(value = "/course-request/delete")
    public String studentRmRequest(HttpServletRequest request) {
        String[] checkboxNamesList = request.getParameterValues("checkboxName");
        if (checkboxNamesList == null || courseRequestService == null) {
            return "redirect:/course-request";
        }
        for (String string : checkboxNamesList) {
            System.out.println(string);
        }
        for (int i = 0; i < checkboxNamesList.length; i++) {
            long requestId = 0;
            try {
                requestId = Long.parseLong(checkboxNamesList[i]);
            } catch (NumberFormatException e) {
                // nothing to do here
                requestId = 0;
            }
            if (requestId != 0) {

                courseRequestService.removeRequest(requestId);
            }
        }
        return "redirect:/course-request-for-student";
    }

    @RequestMapping(value = "/course-request-for-teacher")
    public String teacherRequest(Model model) {
        List<CourseRequestTeacherDTO> courseRequests = courseRequestService
                .showAllRequests();
        if (courseRequests.size() == 0 || courseRequests == null) {
            courseRequests = new ArrayList<CourseRequestTeacherDTO>();
        }
        model.addAttribute(TABLE_TEACHER_FORM_LIST, courseRequests);
        return "course-request-teacher";
    }

    @RequestMapping(value = "/course-request-manage-group")
    public String groupCreate(
            @RequestParam(value = "exportedVal") String courseId,
            @RequestParam(value = "groupChange") String branch, Model model) {
        int id = Integer.parseInt(courseId);
        if (id == 0 || branch == null) {
            return "redirect:/course-request-for-teacher";
        }

        if (branch.equals("approve")) {
            Date current = new Date();
            Date future = ControllersUtil.addOrDelDays(current,
                    ONE_MONTH_IN_DAYS);
            courseRequestService.formGroupAndCloseRequests(id, current, future);
            courseRequestService.deleteAllRequestsWithCourseId(id);
        }
        if (branch.equals("deny")) {
            courseRequestService.deleteAllRequestsWithCourseId(id);
        }
        return "redirect:/course-request-for-teacher";

    }

}
