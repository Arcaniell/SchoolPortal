package school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import school.model.Group;
import school.service.StudentService;

@Controller
public class StudentController {
    @Autowired
    StudentService student;

    @RequestMapping(value = "groups")
    public ModelAndView getGroups(Model model) {
        int session = 1;
        if (session == 1) {
            List<Group> groups = student.getStudentGoupsByUserId(144);
            model.addAttribute("Message", groups);
            return new ModelAndView("groups-student");
        }
        if (session == 2) {
            List<Group> groups = student.getStudentGoupsByUserId(144);
            model.addAttribute("Message", groups);
            return new ModelAndView("groups-teacher");
        }
        return new ModelAndView("home");

    }

}
