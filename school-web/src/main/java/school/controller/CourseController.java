package school.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.CourseDTO;
import school.model.Role;
import school.service.CourseService;
import school.service.utils.DateUtil;

@Controller
public class CourseController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    private final boolean FORWARD_TRUE = true;
    private final boolean FORWARD_FALSE = false;
    //private final String URL_COURSES = "/courses";
    private final String URL_COURSES_STUDENT = "student-courses";
    private final String URL_COURSES_TEACHER = "teacher-courses";
    private final String URL_COURSES_HEADTEACHER = "headteacher-courses";
    private final String TILES_VIEW_STUDENT_COURSE = "courses-student";
    private final String TILES_VIEW_TEACHER_COURSE = "courses-teacher";
    private final String TILES_VIEW_HEADTEACHER_COURSE="courses-headteacher";
    private final String JSP_INPUT_DATE_FROM = "dateFrom";
    private final String JSP_INPUT_DATE_TILL = "dateTill";
    private final String JSP_OUTPUT_COURSE_LIST = "courses";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE = "courses";
    private final SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    CourseService course;

    @RequestMapping(value = URL_COURSES_STUDENT)
    public String getStudentCourses(
            @RequestParam(value = JSP_INPUT_DATE_FROM, required = false) String dateFrom,
            @RequestParam(value = JSP_INPUT_DATE_TILL, required = false) String dateTill,
            Model model, HttpServletRequest request, Principal principal) {
        if (principal != null && request.isUserInRole(Role.Secured.STUDENT)) {
            Date from = DateUtil.dateProceed(dateFrom, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_TRUE);
            Date till = DateUtil.dateProceed(dateTill, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_FALSE);
            if (from.after(till)) {
                Date swap = from;
                from = till;
                till = swap;
            }
            List<CourseDTO> coursesList = course.allCoursesInDateRangeForStudent(principal, from,
                    till);
            // transfer data to form
            model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
            model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
            model.addAttribute(JSP_OUTPUT_COURSE_LIST, coursesList);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return TILES_VIEW_STUDENT_COURSE;
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
    }

    @RequestMapping(value = URL_COURSES_TEACHER)
    public String getTeacherCourses(
            @RequestParam(value = JSP_INPUT_DATE_FROM, required = false) String dateFrom,
            @RequestParam(value = JSP_INPUT_DATE_TILL, required = false) String dateTill,
            Model model, HttpServletRequest request, Principal principal) {
        if (principal != null && request.isUserInRole(Role.Secured.TEACHER)) {
                // parse dates from form
                Date from = DateUtil.dateProceed(dateFrom, formatterDate, TWO_MONTHS_IN_DAYS,
                        FORWARD_TRUE);
                Date till = DateUtil.dateProceed(dateTill, formatterDate, TWO_MONTHS_IN_DAYS,
                        FORWARD_FALSE);
                if (from.after(till)) {
                    Date swap = from;
                    from = till;
                    till = swap;
                }
                // get list of courses
                List<CourseDTO> coursesList = new ArrayList<CourseDTO>();
                coursesList = course.allCoursesInDateRangeForTeacher(principal, from, till);
                // transfer data to form
                model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
                model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
                model.addAttribute(JSP_OUTPUT_COURSE_LIST, coursesList);
                model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
                return TILES_VIEW_TEACHER_COURSE;
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
    }    
    @RequestMapping(value = URL_COURSES_HEADTEACHER)
    public String getHeadTeacherCourses(){
        //TODO: write some code here and then commit it =)
        return TILES_VIEW_HEADTEACHER_COURSE;
    }
    
    
    /*@RequestMapping(value = URL_COURSES)
    public String getCourses(
            @RequestParam(value = JSP_INPUT_DATE_FROM, required = false) String dateFrom,
            @RequestParam(value = JSP_INPUT_DATE_TILL, required = false) String dateTill,
            Model model, HttpServletRequest request, Principal user) {
        if (user == null) {

        }
        if (request.isUserInRole(Role.Secured.STUDENT)) {
            // parse dates from form
            Date from = DateUtil.dateProceed(dateFrom, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_TRUE);
            Date till = DateUtil.dateProceed(dateTill, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_FALSE);
            if (from.after(till)) {
                Date swap = from;
                from = till;
                till = swap;
            }
            List<CourseDTO> coursesList = course.allCoursesInDateRangeForStudent(user, from, till);
            // transfer data to form
            model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
            model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
            model.addAttribute(JSP_OUTPUT_COURSE_LIST, coursesList);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return URL_STUDENT_COURSE;
        }
        if (request.isUserInRole(Role.Secured.TEACHER)) {
            // parse dates from form
            Date from = DateUtil.dateProceed(dateFrom, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_TRUE);
            Date till = DateUtil.dateProceed(dateTill, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_FALSE);
            if (from.after(till)) {
                Date swap = from;
                from = till;
                till = swap;
            }
            // get list of courses
            List<CourseDTO> coursesList = new ArrayList<CourseDTO>();
            coursesList = course.allCoursesInDateRangeForTeacher(user, from, till);
            // transfer data to form
            model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
            model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
            model.addAttribute(JSP_OUTPUT_COURSE_LIST, coursesList);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return URL_TEACHER_COURSE;
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
    }*/
}
