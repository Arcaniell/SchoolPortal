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
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.GroupDTO;
import school.dto.TeacherDTO;
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
    private final String URL_AJAX_GET_TEACHERS = "/getTeacherSelect";
    private final String URL_GROUP_ADD = "group-create";
    private final String URL_GROUP_REMOVE = "group-remove";
    private final String JSP_INPUT_DATE_FROM = "dateFrom";
    private final String JSP_INPUT_DATE_TILL = "dateTill";
    private final String JSP_OUTPUT_GROUP_LIST = "groupList";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE = "group";
    private final String JSP_OUTPUT_YEAR_LIST = "yearList";
    private final String JSP_OUTPUT_SYMBOL_LIST = "symbolList";
    private final String JSP_OUTPUT_NOT_CURATORS = "notCurator";
    private final String JSP_INPUT_CHECKBOX = "checked";
    private final int JSP_INPUT_CHECKBOX_CHECKED = 1;
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
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
            model.addAttribute(JSP_OUTPUT_SYMBOL_LIST, groupService.getSymbols());
            model.addAttribute(JSP_OUTPUT_YEAR_LIST, groupService.getYears());
            model.addAttribute(JSP_OUTPUT_NOT_CURATORS, groupService.getNotCurators());
            return URL_GROUP_HEAD_TEACHER;
        }
        if (request.isUserInRole(Role.Secured.TEACHER)) {
            // parse dates from form
            Date from = ControllersUtil.dateProceed(dateFrom, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_TRUE);
            Date till = ControllersUtil.dateProceed(dateTill, formatterDate, TWO_MONTHS_IN_DAYS,
                    FORWARD_FALSE);
            if (from.after(till)) {
                Date swap = from;
                from = till;
                till = swap;
            }
            List<GroupDTO> groups = groupService.getTeacherGroups(user, from, till);
            model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
            model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
            model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);

            return URL_GROUP_TEACHER;
        }
        if (request.isUserInRole(Role.Secured.STUDENT)) {
            List<GroupDTO> groups = groupService.getStudentGroups(user);
            model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
            return URL_GROUP_STUDENT;
        }

        return URL_REDIRECT + URL_LOGIN;
    }

    @RequestMapping(value = URL_AJAX_GET_TEACHERS)
    public @ResponseBody List<TeacherDTO> getTeacherSelect(
            @RequestParam(value = JSP_INPUT_CHECKBOX, required = false) String branch) {
        int intBranch = Integer.parseInt(branch);
        if (intBranch == JSP_INPUT_CHECKBOX_CHECKED) {
            return groupService.getAllTeachers();
        } else {
            return groupService.getNotCurators();
        }
    }

    @RequestMapping(value = URL_GROUP_ADD)
    public String addNewGroup(
            @RequestParam(value = "year_value") String yearString,
            @RequestParam(value = "symbol_value") String symbolString,
            @RequestParam(value = "curatorId") String teacherIdString,
            @RequestParam(value = "additional_group_name", required = false) String additionalGroupName,
            @RequestParam(value = "checkboxAdditionGroup", required = false) String branch) {
        groupService.createNewGroup(Byte.parseByte(yearString), symbolString,
                Long.parseLong(teacherIdString), additionalGroupName, branch);
        return URL_REDIRECT + URL_GROUP;
    }

    @RequestMapping(value = URL_GROUP_REMOVE)
    public String removeGroups(HttpServletRequest request) {
        String[] checkboxNamesList = request.getParameterValues("checkboxName");
        if (checkboxNamesList == null) {
            return URL_REDIRECT + URL_GROUP;
        }
        for (int i = 0; i < checkboxNamesList.length; i++) {
            long requestId = Long.parseLong(checkboxNamesList[i]);
            groupService.removeGroup(requestId);
        }
        return URL_REDIRECT + URL_GROUP;
    }

}
