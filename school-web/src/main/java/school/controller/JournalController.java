package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import school.dto.journal.EditMarkDTO;
import school.dto.journal.EditDateDTO;
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
	public String index(Principal principal, Model model,
			HttpServletRequest request) throws ParseException {

		if (principal == null) {
			return "redirect:/login";
		}
		JournalStaffDTO staff = null;

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			staff = journalService.getTeacherInfo(principal.getName());

			JournalSearch search = journalService.getDeafaultData(
					principal.getName(), new Date());
			List<StudentWithMarksDTO> groupMarks = journalService
					.getMarksOfGroup(search);
			model.addAttribute("searchData", search);
//			model.addAttribute("groupMarks", groupMarks);
			model.addAttribute("clickSearch", "click");
		} else if (request.isUserInRole(Role.Secured.HEAD_TEACHER)) {
		}

		model.addAttribute("teacher", staff);
		return "journal";
	}

	@RequestMapping(value = "journal-group-marks", method = RequestMethod.POST)
	public @ResponseBody List<StudentWithMarksDTO> getByGroup(
			@RequestBody JournalSearch journalSearch) throws ParseException {

		List<StudentWithMarksDTO> groupMarks = journalService
				.getMarksOfGroup(journalSearch);

		return groupMarks;
	}

	@RequestMapping(value = "journal-edit-mark", method = RequestMethod.POST)
	public @ResponseBody byte editMark(@RequestBody EditMarkDTO editMarkDTO)
			throws ParseException {

		journalService.editMark(editMarkDTO);

		return editMarkDTO.getMark();

	}

	@RequestMapping(value = "journal-edit-date", method = RequestMethod.POST)
	public @ResponseBody EditDateDTO addEvent(
			@RequestBody EditDateDTO editedDateDTO) throws ParseException {

		journalService.editDate(editedDateDTO);

		return editedDateDTO;
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
