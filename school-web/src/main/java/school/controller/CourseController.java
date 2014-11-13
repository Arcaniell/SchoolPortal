package school.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import school.model.Course;
import school.service.CourseService;

@Controller
public class CourseController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    @Autowired
    CourseService course;

    @RequestMapping(value = "/courses")
    public ModelAndView getCourses(
            @RequestParam(value = "dateFrom", required = false) String dateFrom,
            @RequestParam(value = "dateTill", required = false) String dateTill,
            Model model) {
        List<Course> coursesSet = new ArrayList<Course>();
        Long userId = 300L;
        SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
        Date from = null;
        if (dateFrom != null) {
            try {
                from = formatterDate.parse(dateFrom);
            } catch (ParseException e) {
                from = ControllersUtil.addOrDelDays(new Date(),
                        -TWO_MONTHS_IN_DAYS);
            }
        } else {
            from = ControllersUtil
                    .addOrDelDays(new Date(), -TWO_MONTHS_IN_DAYS);
        }

        Date till = null;
        if (dateTill != null) {
            try {
                till = formatterDate.parse(dateTill);
            } catch (ParseException e) {
                till = ControllersUtil.addOrDelDays(new Date(),
                        TWO_MONTHS_IN_DAYS);
            }
        } else {
            till = ControllersUtil.addOrDelDays(new Date(), TWO_MONTHS_IN_DAYS);
        }
        if (from.after(till)) {
            Date swap = from;
            from = till;
            till = swap;
        }
        coursesSet = course.getCourseByUserIdAndDataRange(userId, from, till);
        model.addAttribute("dateFrom", formatterDate.format(from));
        model.addAttribute("dateTill", formatterDate.format(till));
        model.addAttribute("courses", coursesSet);
        return new ModelAndView("courses-student");

    }

}
