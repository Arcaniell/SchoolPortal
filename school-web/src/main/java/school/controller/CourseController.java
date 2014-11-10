package school.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import school.model.Course;
import school.service.CourseService;

@Controller
public class CourseController {
    @Autowired
    CourseService course;

    @RequestMapping(value = "courses")
    public ModelAndView getCourses(Model model) {
        List<Course> coursesSet = new ArrayList<Course>();
        Date from = new Date(0);
        from.setYear(114);
        from.setMonth(6);
        from.setMonth(1);
        Date till = new Date(0);
        till.setYear(114);
        till.setMonth(10);
        from.setMonth(1);
        coursesSet = course.getCourseByUserIdAndDataRange(300, from, till);
        model.addAttribute("courses", coursesSet);
        return new ModelAndView("courses-student");

    }
}
