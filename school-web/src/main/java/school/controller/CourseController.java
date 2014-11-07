package school.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
        List<Course> courses;
        if (course != null) {
            courses = course.getCourseByNumber(6);
            if (courses != null) {
                model.addAttribute("courses", courses);
                return new ModelAndView("courses-student");
            }
        }
        courses = new ArrayList<Course>();
        model.addAttribute("courses", courses);
        return new ModelAndView("courses-student");
    }
}
