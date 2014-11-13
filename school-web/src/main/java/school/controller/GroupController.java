package school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import school.model.Group;
import school.service.GroupService;

@Controller
public class GroupController {
    @Autowired
    GroupService student;

    @RequestMapping(value = "groups")
    public ModelAndView getGroups(Model model) {
        List<Group> groups = student.getStudentGoupsByUserId(155);
        if(groups==null){
            return new ModelAndView("home");
        }
        int session = 1;
        if (session == 1) {
            model.addAttribute("Message", groups);
            return new ModelAndView("groups-student");
        }
        if (session == 2) {
            model.addAttribute("Message", groups);
            return new ModelAndView("groups-teacher");
        }
        return new ModelAndView("home");

    }

}
