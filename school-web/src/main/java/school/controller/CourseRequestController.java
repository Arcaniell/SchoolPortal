package school.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.CourseRequestStudentDTO;
import school.dto.CourseRequestTeacherDTO;
import school.model.Course;
import school.model.Role;
import school.service.CourseRequestService;
import school.service.CourseService;
import school.service.utils.DateUtil;

/**
 * @author Blowder
 */
@Controller
public class CourseRequestController {
    private final String URL_COURSE_REQUEST = "/course-request";
    private final String URL_COURSE_REQUEST_TEACHER_MANAGE = "/course-request-manage-group";
    private final String URL_COURSE_REQUEST_STUDENT_ADD = "/course-request/request";
    private final String URL_COURSE_REQUEST_STUDENT_RM = "/course-request/delete";
    private final String JSP_INPUT_TEACHER_COURSE_ID = "exportedVal";
    private final String JSP_INPUT_TEACHER_BRANCH = "groupChange";
    private final String JSP_INPUT_TEACHER_APPROVE = "approve";
    private final String JSP_INPUT_TEACHER_DENY = "deny";
    private final String JSP_INPUT_CHECKBOXS_NAME = "checkboxName";
    private final String JSP_INPUT_COURSE_ID = "courseId";
    private final String JSP_OUTPUT_STUDENT_CAN_REQUEST_COURSES = "haveCourses";
    private final String JSP_OUTPUT_STUDENT_REQUESTS = "courseList";
    private final String JSP_OUTPUT_TEACHER_REQUESTS = "requests";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_CURRENT_PAGE_VALUE = "request";
    private final String TILES_VIEW_COURSE_REQUEST_TEACHER = "course-request-teacher";
    private final String TILES_VIEW_COURSE_REQUEST_STUDENT = "course-request-student";
    private final int ONE_MONTH_IN_DAYS = 30;

    @Autowired
    CourseRequestService courseRequestService;
    @Autowired
    CourseService courseService;

    // view of course requests for student and teacher
    @RequestMapping(value = URL_COURSE_REQUEST)
    public String courseRequestsViews(HttpServletRequest request, Model model, Principal user) {
        if (user == null) {
            return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
        }
        if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
            List<CourseRequestTeacherDTO> courseRequests = courseRequestService.showAllRequests();
            if (courseRequests.size() == 0 || courseRequests == null) {
                courseRequests = new ArrayList<CourseRequestTeacherDTO>();
            }
            model.addAttribute(JSP_OUTPUT_TEACHER_REQUESTS, courseRequests);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_CURRENT_PAGE_VALUE);
            return TILES_VIEW_COURSE_REQUEST_TEACHER;
        }
        if (request.isUserInRole(Role.Secured.STUDENT)) {

            List<CourseRequestStudentDTO> listOfCourseRequestsDTO = courseRequestService
                    .findUserCourseRequests(user);
            List<Course> canRequestCourses = courseService.findCanRequestCourses(user);
            model.addAttribute(JSP_OUTPUT_STUDENT_REQUESTS, listOfCourseRequestsDTO);
            model.addAttribute(JSP_OUTPUT_STUDENT_CAN_REQUEST_COURSES, canRequestCourses);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_CURRENT_PAGE_VALUE);
            return TILES_VIEW_COURSE_REQUEST_STUDENT;
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_HOME;
    }

    // student course request add new
    @RequestMapping(value = URL_COURSE_REQUEST_STUDENT_ADD)
    public String studentAddRequest(
            @RequestParam(value = JSP_INPUT_COURSE_ID, required = false) String stringCourseId,
            Principal principal) {
        if (stringCourseId != null && principal != null) {
            long userId = Long.parseLong(principal.getName());
            int courseId = Integer.parseInt(stringCourseId);
            if (courseId != 0 && userId != 0) {
                courseRequestService.addCourseRequest(userId, courseId);
            }
        }
        return URLContainer.URL_REDIRECT + URL_COURSE_REQUEST;
    }

    // student course request remove
    @RequestMapping(value = URL_COURSE_REQUEST_STUDENT_RM)
    public String studentRmRequest(HttpServletRequest request, Principal user) {
        String[] checkboxNamesList = request.getParameterValues(JSP_INPUT_CHECKBOXS_NAME);
        if (checkboxNamesList != null && user != null) {
            for (int i = 0; i < checkboxNamesList.length; i++) {
                long requestId = Long.parseLong(checkboxNamesList[i]);
                courseRequestService.removeRequest(requestId);
            }
        }
        return URLContainer.URL_REDIRECT + URL_COURSE_REQUEST;
    }

    // teacher request manage, creating new group
    @RequestMapping(value = URL_COURSE_REQUEST_TEACHER_MANAGE)
    public String groupCreate(@RequestParam(value = JSP_INPUT_TEACHER_COURSE_ID) String id,
            @RequestParam(value = JSP_INPUT_TEACHER_BRANCH) String branch, Model model) {
        int courseId = Integer.parseInt(id);
        if (courseId != 0 && branch != null) {
            if (branch.equals(JSP_INPUT_TEACHER_APPROVE)) {
                Date currentDate = new Date();
                Date futureDate = DateUtil.addOrDelDays(currentDate, ONE_MONTH_IN_DAYS);
                courseRequestService.formGroupAndCloseRequests(courseId, currentDate, futureDate);
                courseRequestService.deleteAllRequestsWithCourseId(courseId);
            }
            if (branch.equals(JSP_INPUT_TEACHER_DENY)) {
                courseRequestService.deleteAllRequestsWithCourseId(courseId);
            }
        }
        return URLContainer.URL_REDIRECT + URL_COURSE_REQUEST;
    }

}
