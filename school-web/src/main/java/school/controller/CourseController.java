package school.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.model.Course;
import school.model.Role;
import school.service.CourseService;

@Controller
public class CourseController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    private final boolean FORWARD_TRUE = true;
    private final boolean FORWARD_FALSE = false;
    SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    CourseService course;

    @RequestMapping(value = "/courses")
    public String getCourses(
            @RequestParam(value = "dateFrom", required = false) String dateFrom,
            @RequestParam(value = "dateTill", required = false) String dateTill,
            Model model, HttpServletRequest request, Principal user) {
        if (user == null) {
            return "redirect:/login";
        }
        if (request.isUserInRole(Role.Secured.STUDENT)) {
            // parse dates from form
            Date from = ControllersUtil.dateProceed(dateFrom, formatterDate,
                    TWO_MONTHS_IN_DAYS, FORWARD_TRUE);
            Date till = ControllersUtil.dateProceed(dateTill, formatterDate,
                    TWO_MONTHS_IN_DAYS, FORWARD_FALSE);
            if (from.after(till)) {
                Date swap = from;
                from = till;
                till = swap;
            }
            // get list of courses
            List<Course> coursesSet = course.allCoursesinDateRangeForStudent(
                    user, from, till);
            // transfer data to form
            model.addAttribute("dateFrom", formatterDate.format(from));
            model.addAttribute("dateTill", formatterDate.format(till));
            model.addAttribute("courses", coursesSet);
            return "courses-student";
        }
        if (request.isUserInRole(Role.Secured.TEACHER)) {
            // TODO Blowder: write a teacher representation of course
        }
        return "redirect:/login";
    }
}
