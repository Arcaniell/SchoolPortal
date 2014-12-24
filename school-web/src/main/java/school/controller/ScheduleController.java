package school.controller;

import java.security.Principal;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import school.dto.schedule.GroupScheduleDTO;
import school.dto.schedule.RoomDTO;
import school.dto.schedule.ScheduleDTO;
import school.dto.schedule.SchedulePerGroupDTO;
import school.dto.schedule.ScheduleSearch;
import school.dto.schedule.UserDTO;
import school.model.Group;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;
import school.service.ScheduleService;
import school.service.ScheduleService.Duration;
import school.service.utils.ScheduleUtil;

@Controller
public class ScheduleController {

	private static final String SCHEDULE_TEACHER = "schedule-teacher";
	private static final String SCHEDULE_NEXT = "schedule-next";
	private static final String SCHEDULE_BACK = "schedule-back";
	private static final String SCHEDULE_ROOM = "schedule-room";
	private static final String SCHEDULE_SELECT = "schedule-select";
	private static final String SCHEDULE_GROUP = "schedule-group";
	private static final String CURRENT_PAGE_SCHEDULE = "schedule";
	private static final String SCHEDULE = "schedule";
	private final String CURRENT = "current";
	@Autowired
	private ScheduleService scheduleService;

	@RequestMapping(value = SCHEDULE)
	public String index(
			@RequestParam(value = "dateFrom", required = false) String dateFrom,

			Model model) {

		dateFrom = ScheduleUtil.formDateFrom(dateFrom);
		List<Teacher> teachers = scheduleService.allTeacher();
		List<Room> rooms = scheduleService.allRoom();
		List<Group> groups = scheduleService.allGroup();

		model.addAttribute("teachers", teachers);
		model.addAttribute("rooms", rooms);
		model.addAttribute("groups", groups);
		model.addAttribute(CURRENT, CURRENT_PAGE_SCHEDULE);
		model.addAttribute("dateFrom", dateFrom);

		return SCHEDULE;
	}

	@RequestMapping(value = SCHEDULE_GROUP)
	public @ResponseBody List<GroupScheduleDTO> getGroup(
			@RequestBody String name) {

		return scheduleService.getGroupName(scheduleService.allGroup(), name);
	}

	@RequestMapping(value = SCHEDULE_ROOM)
	public @ResponseBody List<RoomDTO> getRoom(@RequestBody String name) {

		return scheduleService.getRoomName(scheduleService.allRoom(), name);
	}

	@RequestMapping(value = SCHEDULE_SELECT)
	public @ResponseBody List<SchedulePerGroupDTO> getTable(
			@RequestBody ScheduleSearch json, HttpServletRequest request,
			Principal principal) {

		boolean isLoginned = false;
		long teachID = ScheduleUtil.idLongStr(json.getTeacher());
		int roomID = ScheduleUtil.idIntegStr(json.getRoom());
		long groupID = ScheduleUtil.idLongStr(json.getGroup());
		Duration duratn = ScheduleUtil.parseDrtn(json.getRadio());
		String df = ScheduleUtil.getDateForSch(json.getDateOfLife());

		Locale loc = RequestContextUtils.getLocale(request);

		List<Schedule> schedules = scheduleService.current(teachID, roomID,
				groupID, df, duratn);
		List<ScheduleDTO> schedulesDto;

		if (principal == null) {

			schedulesDto = scheduleService.getScheduleDto(schedules, loc,
					isLoginned);
		} else {

			schedulesDto = scheduleService.getScheduleDto(schedules, loc,
					!isLoginned);
		}

		Set<String> headerDate = scheduleService.intervalForHeader(schedules,
				loc);

		List<SchedulePerGroupDTO> my = scheduleService.sortScheduleForTable(
				schedulesDto, headerDate);

		return my;

	}

	@RequestMapping(value = SCHEDULE_BACK)
	public @ResponseBody String[] getPreviousTable(
			@RequestBody String[] before, HttpServletRequest request) {
		String way = "back";
		Locale loc = RequestContextUtils.getLocale(request);
		return scheduleService.getScheduleWithWay(before, way, loc);

	}

	@RequestMapping(value = SCHEDULE_NEXT)
	public @ResponseBody String[] getNextTable(@RequestBody String[] before,
			HttpServletRequest request) {
		String way = "next";
		Locale loc = RequestContextUtils.getLocale(request);
		return scheduleService.getScheduleWithWay(before, way, loc);

	}

	@RequestMapping(value = SCHEDULE_TEACHER)
	public @ResponseBody List<UserDTO> getTeacherLfName(@RequestBody String name) {

		return scheduleService.getTeacherName(scheduleService.allTeacher(),
				name);
	}

}
