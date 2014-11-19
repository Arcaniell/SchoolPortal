package school.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import school.dto.GroupDTO;
import school.model.Group;
import school.model.Role;
import school.service.GroupService;

@Controller
public class GroupController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    private final boolean FORWARD_TRUE = true;
    private final boolean FORWARD_FALSE = false;
    SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    GroupService groupService;

    @RequestMapping(value = "groups")
    public String getGroups(
            @RequestParam(value = "dateFrom", required = false) String dateFrom,
            @RequestParam(value = "dateTill", required = false) String dateTill,
            Model model, HttpServletRequest request, Principal user) {
        if (user == null) {
            return "redirect:/login";
        }
        if (request.isUserInRole(Role.Secured.STUDENT)) {
            List<GroupDTO> groups = groupService.getStudentGroups(user);
            model.addAttribute("groupList", groups);
            model.addAttribute("current", "group");
            return "groups-student";
        }
        if (request.isUserInRole(Role.Secured.TEACHER)) {
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
            List<GroupDTO> groups = groupService.getTeacherGroups(user, from,
                    till);
            model.addAttribute("dateFrom", formatterDate.format(from));
            model.addAttribute("dateTill", formatterDate.format(till));
            model.addAttribute("groupList", groups);
            model.addAttribute("current", "group");
            return "groups-teacher";
        }
        if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
            List<GroupDTO> groups = groupService.getHeadTeacherGroups();
            model.addAttribute("groupList", groups);
            model.addAttribute("current", "group");
            return "groups-head-teacher";
        }
        return "redirect:/login";
    }

}
