package school.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.GroupEditHeaderDTO;
import school.dto.GroupEditResponseDTO;
import school.dto.StudentDTO;
import school.service.GroupService;

@Controller
public class GroupEditController {
    private final String URL_GROUP_EDIT = "group-edit";
    private final String URL_GROUP_EDIT_HEADER_FILL = "group-edit-header-fill";
    private final String URL_GROUP_UPDATE = "group-edit-update";
    private final String TILES_VIEW_URL = "groups-head-teacher-edit";
    private final String JSP_INPUT_CHECKBOX = "groupId";
    private final String URL_GROUP = "groups";
    private final String URL_REDIRECT = "redirect:";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE_GROUP_EDIT = "group_edit";
    private final String JSP_INPUT_GROUP_ID = "groupId";
    private final String JSP_INPUT_CONTENT_TYPE = "Content-type=application/json";
    private final String JSP_INPUT_DATE_FROM = "dateFrom";
    private final String JSP_INPUT_DATE_TILL = "dateTill";
    private final String JSP_INPUT_TEACHER_ID = "teacherId";
    private final String JSP_INPUT_STUDENTS = "students";
    @Autowired
    GroupService groupService;

    @RequestMapping(value = URL_GROUP_EDIT)
    public String groupEdit(
            @RequestParam(value = JSP_INPUT_CHECKBOX, required = false) String groupId, Model model) {
        if (groupId == null || groupId == "") {
            return URL_REDIRECT + URL_GROUP;
        } else {
            model.addAttribute(JSP_INPUT_CHECKBOX, groupId);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE_GROUP_EDIT);
            return TILES_VIEW_URL;
        }
    }

    @RequestMapping(value = URL_GROUP_EDIT_HEADER_FILL)
    public @ResponseBody GroupEditHeaderDTO groupEditHeaderView(
            @RequestParam(value = JSP_INPUT_GROUP_ID, required = false) String groupId) {
        if (groupId != null && groupId != "") {
            long id = Long.parseLong(groupId);
            if (id == 0) {
                return null;
            }
            GroupEditHeaderDTO temp = groupService.getGroupEditHeaderInfo(id);
            return temp;
        } else {
            return null;
        }
    }

    /*
     * @RequestMapping(value = URL_GROUP_UPDATE) public @ResponseBody void
     * groupUpdate(
     * 
     * @RequestParam(value = JSP_INPUT_GROUP_ID, required = false) String
     * groupId,
     * 
     * @RequestParam(value = JSP_INPUT_DATE_FROM, required = false) String
     * dateFromString,
     * 
     * @RequestParam(value = JSP_INPUT_DATE_TILL, required = false) String
     * dateTillString,
     * 
     * @RequestParam(value = JSP_INPUT_TEACHER_ID, required = false) String
     * teacherId,
     * 
     * @RequestParam(value = JSP_INPUT_STUDENTS, required = false) String
     * students, HttpServletRequest request) {
     * System.out.println(request.getParameterNames()); }
     */
    @RequestMapping(value = URL_GROUP_UPDATE, headers = { JSP_INPUT_CONTENT_TYPE })
    public @ResponseBody void groupUpdate(@RequestBody GroupEditResponseDTO dataForUpdate) {
    }
}
