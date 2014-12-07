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
import school.model.Course;
import school.model.Role;
import school.service.CourseService;
import school.service.implementation.GroupServiceImpl;
import school.service.utils.DateUtil;

@Controller
public class CourseController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    private final boolean FORWARD_TRUE = true;
    private final boolean FORWARD_FALSE = false;
    // private final String URL_COURSES = "/courses";
    private final String URL_COURSES_STUDENT = "student-courses";
    private final String URL_COURSES_TEACHER = "teacher-courses";
    private final String URL_COURSES_HEADTEACHER = "headteacher-courses";
    private final String URL_COURSES_MANAGE = "course-manage";
    private final String TILES_VIEW_STUDENT_COURSE = "courses-student";
    private final String TILES_VIEW_TEACHER_COURSE = "courses-teacher";
    private final String TILES_VIEW_HEADTEACHER_COURSE = "courses-headteacher";
    private final String JSP_INPUT_DATE_FROM = "dateFrom";
    private final String JSP_INPUT_DATE_TILL = "dateTill";
    private final String JSP_OUTPUT_COURSE_LIST = "courses";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE = "courses";
    private final String JSP_OUTPUT_COURSE_YEARS = "years";

    private final SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    CourseService courseService;

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
            List<CourseDTO> coursesList = courseService.allCoursesInDateRangeForStudent(principal,
                    from, till);
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
            coursesList = courseService.allCoursesInDateRangeForTeacher(principal, from, till);
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
    public String getHeadTeacherCourses(Model model) {
        List<CourseDTO> courses = courseService.getAllCourses();
        model.addAttribute(JSP_OUTPUT_COURSE_YEARS, GroupServiceImpl.YEARS_OF_STUDY);
        model.addAttribute(JSP_OUTPUT_COURSE_LIST, courses);
        return TILES_VIEW_HEADTEACHER_COURSE;
    }

    @RequestMapping(value = URL_COURSES_MANAGE)
    public String manageCourse(@RequestParam(value = "name_value", required = false) String name,
            @RequestParam(value = "year_value", required = false) Integer year,
            @RequestParam(value = "add_value", required = false) String addFlagStr,
            @RequestParam(value = "coef_value", required = false) Integer coeficient,
            @RequestParam(value = "price_value", required = false) Float price,
            @RequestParam(value = "checkboxName", required = false) Long[] checkboxes,
            @RequestParam(value = "submit_button", required = false) String branch,
            Principal principal) {
        if (branch.equals("create")) {
            Course createdCourse = new Course();
            createdCourse.setCourseName(name);
            createdCourse.setGroupNumber(year);
            createdCourse.setArchive(false);
            createdCourse.setCoeficient(coeficient);
            if (addFlagStr.equals("YES")) {
                createdCourse.setPrice((int) Math.round(price));
                createdCourse.setAdditional(true);
            } else {
                createdCourse.setPrice(0);
                createdCourse.setAdditional(false);
            }
            courseService.saveNewCourse(createdCourse);
        } else {
            courseService.deleteAllCoursesWithIds(checkboxes);
        }

        return URLContainer.URL_REDIRECT + URL_COURSES_HEADTEACHER;
    }

}
