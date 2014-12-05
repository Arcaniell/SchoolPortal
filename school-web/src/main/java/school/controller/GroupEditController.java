package school.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import school.dto.GroupEditHeaderDTO;
import school.dto.GroupEditResponseDTO;
import school.model.Role;
import school.service.GroupService;

@Controller
public class GroupEditController {
    private final String URL_GROUP_EDIT = "group-edit";
    private final String URL_GROUP_EDIT_HEADER_FILL = "group-edit-header-fill";
    private final String URL_GROUP_UPDATE = "group-edit-update";
    private final String TILES_VIEW_URL = "groups-head-teacher-edit";
    private final String JSP_INPUT_CHECKBOX = "groupId";
    private final String JSP_INPUT_GROUP_ID = "groupId";
    private final String JSP_INPUT_CONTENT_TYPE = "Content-type=application/json";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE_GROUP_EDIT = "group_edit";

    @Autowired
    GroupService groupService;

    @RequestMapping(value = URL_GROUP_EDIT)
    public String groupEdit(
            @RequestParam(value = JSP_INPUT_CHECKBOX, required = false) String groupId,
            Model model, HttpServletRequest request) {
        if (groupId != null && request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
            model.addAttribute(JSP_INPUT_CHECKBOX, groupId);
            model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE_GROUP_EDIT);
            return TILES_VIEW_URL;
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_GROUP_HEADTEACHER;
    }

    @RequestMapping(value = URL_GROUP_EDIT_HEADER_FILL)
    public @ResponseBody GroupEditHeaderDTO groupEditHeaderView(HttpServletRequest request,
            @RequestParam(value = JSP_INPUT_GROUP_ID, required = false) String groupId) {
        if (groupId != null && groupId != "" && request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
            Locale loc = RequestContextUtils.getLocale(request);
            long id = Long.parseLong(groupId);
            if (id == 0) {
                return null;
            }
            GroupEditHeaderDTO temp = groupService.getGroupEditHeaderInfo(id, loc);
            return temp;
        }
        return null;
    }

    @RequestMapping(value = URL_GROUP_UPDATE, headers = { JSP_INPUT_CONTENT_TYPE })
    public @ResponseBody void groupUpdate(HttpServletRequest request,
            @RequestBody GroupEditResponseDTO dataForUpdate) {
        if (dataForUpdate != null && request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
            groupService.groupUpdate(dataForUpdate);
        }
    }
}
