package school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import school.dto.CourseRequestDto;
import school.service.CourseRequestService;

@Controller
public class CourseRequestController {
    @Autowired
    CourseRequestService courseRequestService;
    
    @RequestMapping(value = "/course-request")
    public String studentRequest(Model model) {
        List<CourseRequestDto> list = courseRequestService
                .findRequestsByUserId(155L);
        model.addAttribute("courseList", list);
        return "course-request-student";
    }

}
