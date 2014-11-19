package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.journal.JournalDTO;
import school.dto.journal.JournalTeacherDTO;
import school.dto.journal.StudentMarksDTO;
import school.model.Role;
import school.service.JournalService;
import school.service.utils.JournalUtil;

@Controller
public class JournalController {

	@Inject
	private JournalService journalService;

	@RequestMapping(value = "journal")
	public String index(Principal user, Model model, HttpServletRequest request) {

		if (user == null) {
			return "redirect:/login";
		}

		Map<String, JournalDTO> DTOs = getDTOsByRole(user, request);
		for (Entry<String, JournalDTO> entry : DTOs.entrySet()) {
			model.addAttribute(entry.getKey(), entry.getValue());
		}

		return "journal";
	}

	@RequestMapping(value = "journal-group-marks", method = RequestMethod.POST)
	public String getByGroup(Principal user,
			@RequestParam(value = "quarter") String quarter,
			@RequestParam(value = "idGroup") String idGroup,
			@RequestParam(value = "course") String course, Model model,
			HttpServletRequest request) throws ParseException {

		List<StudentMarksDTO> groupMarks = journalService.getMarksOfGroup(
				quarter, idGroup, course);
		model.addAttribute(JournalUtil.MOD_ATT_DATES, groupMarks.get(0)
				.getDiaryMark());
		model.addAttribute(JournalUtil.MOD_ATT_GROUP_MARKS, groupMarks);
		Map<String, JournalDTO> DTOs = getDTOsByRole(user, request);
		for (Entry<String, JournalDTO> entry : DTOs.entrySet()) {
			model.addAttribute(entry.getKey(), entry.getValue());
		}

		return "journal-group-marks";
	}

	@RequestMapping(value = "journal-group-marks-add-mark")
	public String addMark(
			Principal user,
			Model model,
			@RequestParam(value = "studentAndSchedule") String studentAndSchedule,
			@RequestParam(value = "markSelect") String mark,
			@RequestParam(value = "note") String note,
			@RequestParam(value = "coefficient") String coefficient,
			HttpServletRequest request) throws ParseException {

		List<StudentMarksDTO> groupMarks = journalService.addMark(
				studentAndSchedule, mark, note, coefficient);

		model.addAttribute(JournalUtil.MOD_ATT_DATES, groupMarks.get(0)
				.getDiaryMark());
		model.addAttribute(JournalUtil.MOD_ATT_GROUP_MARKS, groupMarks);
		Map<String, JournalDTO> DTOs = getDTOsByRole(user, request);
		for (Entry<String, JournalDTO> entry : DTOs.entrySet()) {
			model.addAttribute(entry.getKey(), entry.getValue());
		}
		return "journal-group-marks";
	}

	private Map<String, JournalDTO> getDTOsByRole(Principal user,
			HttpServletRequest request) {

		Map<String, JournalDTO> DTOs = new HashMap<String, JournalDTO>();

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			JournalTeacherDTO teacherDTO = journalService.getTeacherInfo(user
					.getName());
			DTOs.put(JournalUtil.TEACHER, teacherDTO);
		} else if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {

		} else if (request.isUserInRole(Role.Secured.DIRECTOR)) {

		}

		return DTOs;
	}
}
