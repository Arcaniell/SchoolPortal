package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
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

	@RequestMapping(value = URLContainer.URL_JOURNAL)
	public String index(Principal principal, Model model,
			HttpServletRequest request) throws ParseException {

		if (principal == null) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}

		long userId = Long.parseLong(principal.getName());

		String role = null;

		if (request.isUserInRole(Role.Secured.TEACHER)) {

			JournalSearch searchData = journalService.getDeafaultData(userId,
					new Date());
			model.addAttribute(JournalUtil.MOD_ATT_SEARCH_DATA, searchData);
			role = Role.Secured.TEACHER;

		} else if (request.isUserInRole(Role.Secured.HEAD_TEACHER)
				|| request.isUserInRole(Role.Secured.DIRECTOR)) {
			role = Role.Secured.HEAD_TEACHER;
		}
		JournalStaffDTO staff = journalService.getStaffInfo(userId, role);

		model.addAttribute(JournalUtil.MOD_ATT_STAFF, staff);
		return URLContainer.URL_JOURNAL;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_MARKS, method = RequestMethod.POST)
	public @ResponseBody List<StudentWithMarksDTO> getByGroup(
			@RequestBody JournalSearch journalSearch) throws ParseException {

		List<StudentWithMarksDTO> groupMarks = journalService
				.getMarksOfGroup(journalSearch);

		return groupMarks;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_EDIT_MARK, method = RequestMethod.POST)
	public @ResponseBody byte editMark(@RequestBody EditMarkDTO editMarkDTO) {

		journalService.editMark(editMarkDTO);

		return editMarkDTO.getMark();

	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_EDIT_DATE, method = RequestMethod.POST)
	public @ResponseBody EditDateDTO addEvent(
			@RequestBody EditDateDTO editedDateDTO) {

		journalService.editDate(editedDateDTO);

		return editedDateDTO;
	}

	@RequestMapping(value = "journal-delete-event", method = RequestMethod.POST)
	public @ResponseBody boolean deleteEvent(
			@RequestBody EditDateDTO editedDateDTO) {

		journalService.deleteEvent(editedDateDTO);

		return true;
	}

	@RequestMapping(value = "journal-delete-hometask", method = RequestMethod.POST)
	public @ResponseBody boolean deleteHomeTask(
			@RequestBody EditDateDTO editedDateDTO) {

		journalService.deleteHomeTask(editedDateDTO);

		return true;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_SUBJECT)
	public @ResponseBody Set<Byte> getNumbers(
			@RequestBody JournalSearch journalSearch, Principal principal,
			HttpServletRequest request) {

		long userId = Long.parseLong(principal.getName());

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			return journalService.getGroupNumbers(userId, Role.Secured.TEACHER,
					journalSearch.getSubject());
		}
		return journalService.getGroupNumbers(userId,
				Role.Secured.HEAD_TEACHER, journalSearch.getSubject());
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_LETTER)
	public @ResponseBody Set<Character> getLetters(
			@RequestBody JournalSearch journalSearch, Principal principal,
			HttpServletRequest request) {
		long userId = Long.parseLong(principal.getName());

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			return journalService.getGroupLetters(userId, Role.Secured.TEACHER,
					journalSearch.getSubject(), journalSearch.getGroupNumber());
		}
		return journalService.getGroupLetters(userId,
				Role.Secured.HEAD_TEACHER, journalSearch.getSubject(),
				journalSearch.getGroupNumber());
	}

}