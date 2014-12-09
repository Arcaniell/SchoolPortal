package school.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.CourseDTO;
import school.dto.GroupDTO;
import school.dto.TeacherDTO;
import school.model.Role;
import school.service.CourseService;
import school.service.GroupService;
import school.service.implementation.GroupServiceImpl;
import school.service.utils.DateUtil;

@Controller
public class GroupController {
    private final int TWO_MONTHS_IN_DAYS = 60;
    private final boolean FORWARD_TRUE = true;
    private final boolean FORWARD_FALSE = false;
    private final String URL_GROUP_STUDENT = "student-groups";
    private final String URL_GROUP_TEACHER = "teacher-groups";
    private final String URL_GROUP_HEADTEACHER = "headteacher-groups";
    private final String URL_AJAX_GET_YEAR = "getYearsSelect";
    private final String URL_AJAX_GET_ADITIONAL_YEAR = "getAdditionYearsSelect";
    private final String URL_AJAX_GET_COURSES = "getCoursesSelect";
    private final String URL_AJAX_GET_TEACHERS = "/getTeacherSelect";
    private final String URL_AJAX_GET_AVAILABLE_SYMBOLS = "getSymbolsForYear";
    private final String URL_MODAL_GROUP_ADD = "group-create";
    private final String URL_MODEL_GROUP_REMOVE = "group-remove";
    private final String TILES_VIEW_GROUP_HEAD_TEACHER = "groups-head-teacher";
    private final String TILES_VIEW_GROUP_TEACHER = "groups-teacher";
    private final String TILES_VIEW_GROUP_STUDENT = "groups-student";
    private final String JSP_OUTPUT_GROUP_LIST = "groupList";
    private final String JSP_OUTPUT_CURRENT_PAGE = "current";
    private final String JSP_OUTPUT_CURRENT_PAGE_VALUE = "group";
    private final String JSP_OUTPUT_YEAR_LIST = "yearList";
    private final String JSP_OUTPUT_SYMBOL_LIST = "symbolList";
    private final String JSP_OUTPUT_NOT_CURATORS = "notCurator";
    private final String JSP_INPUT_DATE_FROM = "dateFrom";
    private final String JSP_INPUT_DATE_TILL = "dateTill";
    private final String JSP_INPUT_CHECKBOX = "checked";
    private final String JSP_INPUT_CHECKBOX_ARRAY = "checkboxName";
    private final String JSP_INPUT_CREATE_GROUP_YEAR = "year_value";
    private final String JSP_INPUT_CREATE_GROUP_SYMBOL = "symbol_value";
    private final String JSP_INPUT_CREATE_GROUP_CURATOR_ID = "curator_id";
    private final String JSP_INPUT_CREATE_GROUP_COURSE_ID = "course_id";
    private final String JSP_INPUT_CREATE_GROUP_CHECKBOX = "checkboxAdditionGroup";
    private final int JSP_INPUT_CHECKBOX_CHECKED = 1;
    private final SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    @Autowired
    GroupService groupService;
    @Autowired
    CourseService courseService;

    // get student group main JSP
    @RequestMapping(value = URL_GROUP_STUDENT)
    public String getStudentGroups(HttpServletRequest request, Principal principal, Model model) {
        if (principal != null) {
            if (request.isUserInRole(Role.Secured.STUDENT)) {
                List<GroupDTO> groups = groupService.getStudentGroups(principal);
                model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
                model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
                return TILES_VIEW_GROUP_STUDENT;
            }
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
    }

    // get teacher group main JSP
    @RequestMapping(value = URL_GROUP_TEACHER)
    public String getTeacherGroups(
            @RequestParam(value = JSP_INPUT_DATE_FROM, required = false) String dateFrom,
            @RequestParam(value = JSP_INPUT_DATE_TILL, required = false) String dateTill,
            HttpServletRequest request, Principal principal, Model model) {
        if (principal != null) {
            if (request.isUserInRole(Role.Secured.TEACHER)) {
                // parse dates from form
                Date from = DateUtil.dateProceed(dateFrom, formatterDate, TWO_MONTHS_IN_DAYS,
                        FORWARD_TRUE);
                Date till = DateUtil.dateProceed(dateTill, formatterDate, TWO_MONTHS_IN_DAYS,
                        FORWARD_FALSE);
                if (from.after(till)) {
                    Date swap = from;
                    from = till;
                    till = swap;
                }
                List<GroupDTO> groups = groupService.getTeacherGroups(principal, from, till);
                model.addAttribute(JSP_INPUT_DATE_FROM, formatterDate.format(from));
                model.addAttribute(JSP_INPUT_DATE_TILL, formatterDate.format(till));
                model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
                model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
                return TILES_VIEW_GROUP_TEACHER;
            }
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
    }

    // get head teacher group main JSP and fill header info
    @RequestMapping(value = URL_GROUP_HEADTEACHER)
    public String getHeadTeacherGroups(HttpServletRequest request, Principal principal, Model model) {
        if (principal != null) {
            if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
                List<GroupDTO> groups = groupService.getHeadTeacherGroups();
                model.addAttribute(JSP_OUTPUT_GROUP_LIST, groups);
                model.addAttribute(JSP_OUTPUT_CURRENT_PAGE, JSP_OUTPUT_CURRENT_PAGE_VALUE);
                model.addAttribute(JSP_OUTPUT_SYMBOL_LIST, groupService.getSymbols());
                model.addAttribute(JSP_OUTPUT_YEAR_LIST, groupService.getYears());
                model.addAttribute(JSP_OUTPUT_NOT_CURATORS, groupService.getNotCurators());
                return TILES_VIEW_GROUP_HEAD_TEACHER;
            }
        }
        return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
    }

    // create new group main JSP
    @RequestMapping(value = URL_MODAL_GROUP_ADD)
    public String addNewGroup(
            @RequestParam(value = JSP_INPUT_CREATE_GROUP_YEAR) String yearString,
            @RequestParam(value = JSP_INPUT_CREATE_GROUP_SYMBOL) String symbolString,
            @RequestParam(value = JSP_INPUT_CREATE_GROUP_CURATOR_ID) String curatorIdString,
            @RequestParam(value = JSP_INPUT_CREATE_GROUP_COURSE_ID, required = false) String courseIdStr,
            @RequestParam(value = JSP_INPUT_CREATE_GROUP_CHECKBOX, required = false) String branch,
            HttpServletRequest request, Principal principal) {
        if (principal == null || request.isUserInRole(Role.Secured.HEAD_TEACHER) != true) {
            return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
        }
        if (courseIdStr != null) {
            groupService.createNewGroup(Byte.parseByte(yearString), symbolString,
                    Long.parseLong(curatorIdString), Long.parseLong(courseIdStr), branch);
        }
        return URLContainer.URL_REDIRECT + URL_GROUP_HEADTEACHER;

    }

    // remove new group main JSP
    @RequestMapping(value = URL_MODEL_GROUP_REMOVE)
    public String removeGroups(HttpServletRequest request, Principal principal) {
        if (principal == null || request.isUserInRole(Role.Secured.HEAD_TEACHER) != true) {
            return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
        }
        String[] checkboxNamesList = request.getParameterValues(JSP_INPUT_CHECKBOX_ARRAY);
        if (checkboxNamesList != null) {
            for (int i = 0; i < checkboxNamesList.length; i++) {
                Long requestId = null;
                try {
                    requestId = Long.parseLong(checkboxNamesList[i]);
                    if (requestId > 0) {
                        groupService.removeGroup(requestId);
                    }
                } catch (NumberFormatException e) {
                    // nothing critical, continue
                }
            }
        }
        return URLContainer.URL_REDIRECT + URL_GROUP_HEADTEACHER;
    }

    // AJAX header fill. Get all addition groups for year
    @RequestMapping(value = URL_AJAX_GET_COURSES)
    public @ResponseBody List<CourseDTO> getCoursesForYear(@RequestBody int year) {
        return courseService.getCoursesForYear(year);
    }

    // AJAX header fill. Get 4 created group
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

    // AJAX header fill. Get all years for available addition courses
    @RequestMapping(value = URL_AJAX_GET_ADITIONAL_YEAR)
    public @ResponseBody List<Integer> getAddiitionGroupYear() {
        Integer[] allYears = GroupServiceImpl.YEARS_OF_STUDY;
        List<Integer> allAdditionYear = new ArrayList<Integer>();
        for (Integer currentYear : allYears) {
            if (courseService.getCoursesForYear(currentYear).size() > 0) {
                allAdditionYear.add(currentYear);
            }
        }
        return allAdditionYear;
    }

    // AJAX header fill. Get all available years
    @RequestMapping(value = URL_AJAX_GET_YEAR)
    public @ResponseBody Integer[] getYear() {
        return GroupServiceImpl.YEARS_OF_STUDY;
    }

    // AJAX header fill. Get all available symbols 4 current year
    @RequestMapping(value = URL_AJAX_GET_AVAILABLE_SYMBOLS)
    public @ResponseBody List<String> getAvailableSymbols(@RequestBody byte year) {
        return groupService.getAvailableSymbols(year);
    }

}
