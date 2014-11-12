package school.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.dao.StudentDao;
import school.dto.CourseRequestDto;
import school.model.Course;
import school.model.Student;
import school.service.CourseRequestService;
import school.service.CourseService;

@Controller
public class CourseRequestController {
    long userId = 155L;
    @Autowired
    CourseRequestService courseRequestService;
    @Autowired
    CourseService courseService;
    @Autowired
    StudentDao student;

    @RequestMapping(value = "/course-request")
    public String studentRequest(Model model) {
        List<CourseRequestDto> list = courseRequestService
                .findRequestsByUserId(155L);
        List<Course> course = courseService.findAllByStatusAndYear(true, 7,
                155L);
        model.addAttribute("haveCourses", course);
        model.addAttribute("courseList", list);

        return "course-request-student";
    }

    @RequestMapping(value = "/course-request/request")
    public String studentAddRequest(
            @RequestParam(value = "courseId") String courseId) {
        courseRequestService.addCourseRequest(userId,
                Integer.parseInt(courseId));
        return "redirect:/course-request";
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
            System.out.println("hello from controll");
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
        return "redirect:/course-request";
    }

}
