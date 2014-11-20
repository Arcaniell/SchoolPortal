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

import school.dto.GroupDTO;
import school.model.Role;
import school.service.GroupService;

@Controller
public class GroupController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    private final boolean FORWARD_TRUE = true;
    private final boolean FORWARD_FALSE = false;
    private final String URL_GROUP = "groups";
    private final String URL_REDIRECT = "redirect:";
    private final String URL_LOGIN = "/login";
    private final String URL_GROUP_HEAD_TEACHER = "groups-head-teacher";
    private final String URL_GROUP_TEACHER = "groups-teacher";
    private final String URL_GROUP_STUDENT = "groups-student";
    private final String JSP_INPUT_DATE_FROM = "dateFrom";
    private final String JSP_INPUT_DATE_TILL = "dateTill";
    private final String JSP_OUTPUT_GROUP_LIST = "groupList";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE = "group";
    private final SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    GroupService groupService;

    @RequestMapping(value = URL_GROUP)
    public String getGroups(
            @RequestParam(value = JSP_INPUT_DATE_FROM, required = false) String dateFrom,
            @RequestParam(value = JSP_INPUT_DATE_TILL, required = false) String dateTill,
            Model model, HttpServletRequest request, Principal user) {
        if (user == null) {
            return URL_REDIRECT + URL_LOGIN;
        }
        if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
            List<GroupDTO> groups = groupService.getHeadTeacherGroups();
            model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE,
                    JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return URL_GROUP_HEAD_TEACHER;
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
            model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
            model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
            model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE,
                    JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return URL_GROUP_TEACHER;
        }
        if (request.isUserInRole(Role.Secured.STUDENT)) {
            List<GroupDTO> groups = groupService.getStudentGroups(user);
            model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE,
                    JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return URL_GROUP_STUDENT;
        }

        return URL_REDIRECT + URL_LOGIN;
    }

}
