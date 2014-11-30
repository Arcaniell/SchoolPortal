package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.EventDTO;
import school.dto.journal.AddMarkDTO;
import school.dto.journal.JournalDTO;
import school.dto.journal.JournalSearch;
import school.dto.journal.JournalStaffDTO;
import school.dto.journal.StudentWithMarksDTO;
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
	public @ResponseBody List<StudentWithMarksDTO> getByGroup(
			@RequestBody JournalSearch journalSearch, HttpServletRequest request)
			throws ParseException {

		List<StudentWithMarksDTO> groupMarks = journalService.getMarksOfGroup(
				journalSearch.getQuarter(),
				String.valueOf(journalSearch.getGroupNumber()),
				String.valueOf(journalSearch.getGroupLetter()),
				journalSearch.getSubject());

		return groupMarks;
	}

	@RequestMapping(value = "journal-add-mark", method = RequestMethod.POST)
	public @ResponseBody byte addMark(@RequestBody AddMarkDTO addMarkDTO)
			throws ParseException {

		journalService.addMark(addMarkDTO);

		return addMarkDTO.getMark();

	}

	@RequestMapping(value = "journal-add-event", method = RequestMethod.POST)
	public @ResponseBody EventDTO addEvent(@RequestBody EventDTO event)
			throws ParseException {
		journalService.addEvent(event);
		return event;
	}

	@RequestMapping(value = "journal-subject")
	public @ResponseBody Set<String> getNumbers(@RequestBody String subject,
			Principal user) {
		return journalService.getGroupNumbers(user.getName(), subject);
	}

	@RequestMapping(value = "journal-letter")
	public @ResponseBody Set<String> getLetters(@RequestBody String number,
			Principal user) {
		return journalService.getGroupLetters(user.getName(), number);
	}

	private Map<String, JournalDTO> getDTOsByRole(Principal user,
			HttpServletRequest request) {

		Map<String, JournalDTO> DTOs = new HashMap<String, JournalDTO>();

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			JournalStaffDTO teacherDTO = journalService.getTeacherInfo(user
					.getName());
			DTOs.put(JournalUtil.TEACHER, teacherDTO);
		} else if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
			JournalStaffDTO seniorStaffDTO = journalService
					.seniorStaffInfo(user.getName());
			DTOs.put(JournalUtil.TEACHER, seniorStaffDTO);
		}
		return DTOs;
	}
}
