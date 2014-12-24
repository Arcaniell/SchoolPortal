package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import school.controller.URLContainer;
import school.dto.journal.EditMarkDTO;
import school.dto.journal.EditDateDTO;
import school.dto.journal.JournalSearch;
import school.dto.journal.StudentWithMarksDTO;
import school.model.Role;
import school.service.JournalService;
import school.service.utils.JournalUtil;

@Controller
public class JournalController {

	@Autowired
	private JournalService journalService;

	@RequestMapping(value = URLContainer.URL_JOURNAL)
	public String index(Principal principal, Model model,
			HttpServletRequest request) throws ParseException {

		if (principal == null) {
			return URLContainer.URL_REDIRECT + URLContainer.URL_LOGIN;
		}

		long userId = Long.parseLong(principal.getName());

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			JournalSearch searchData = journalService.getDeafaultData(userId,
					new Date());
			model.addAttribute(JournalUtil.MOD_ATT_SEARCH_DATA, searchData);
		}

		model.addAttribute(JournalUtil.MOD_ATT_STAFF,
				journalService.getStaffInfo(userId, getHighestRole(request)));

		model.addAttribute(URLContainer.JSP_OUTPUT_CURRENT_PAGE,
				URLContainer.URL_JOURNAL);
		return URLContainer.URL_JOURNAL;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_MARKS)
	public @ResponseBody List<StudentWithMarksDTO> getByGroup(
			@RequestBody JournalSearch journalSearch) {

		List<StudentWithMarksDTO> groupMarks = journalService
				.getMarksOfGroup(journalSearch);

		return groupMarks;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_EDIT_MARK)
	public @ResponseBody EditMarkDTO editMark(
			@RequestBody EditMarkDTO editMarkDTO) {
		
		return journalService.editMark(editMarkDTO);

	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_EDIT_DATE)
	public @ResponseBody EditDateDTO addEvent(
			@RequestBody EditDateDTO editedDateDTO) {

		journalService.editDate(editedDateDTO);

		return editedDateDTO;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_DELETE_EVENT)
	public @ResponseBody boolean deleteEvent(
			@RequestBody EditDateDTO editedDateDTO) {

		journalService.deleteEvent(editedDateDTO);

		return true;
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_DELETE_HOMETASK)
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

		return journalService.getGroupNumbers(userId, getHighestRole(request),
				journalSearch.getSubject());
	}

	@RequestMapping(value = URLContainer.URL_JOURNAL_LETTER)
	public @ResponseBody Set<Character> getLetters(
			@RequestBody JournalSearch journalSearch, Principal principal,
			HttpServletRequest request) {

		long userId = Long.parseLong(principal.getName());

		return journalService.getGroupLetters(userId, getHighestRole(request),
				journalSearch.getSubject(), journalSearch.getGroupNumber());
	}

	private String getHighestRole(HttpServletRequest request) {

		String role = null;

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			role = Role.Secured.TEACHER;
		}
		if (request.isUserInRole(Role.Secured.HEAD_TEACHER)
				|| request.isUserInRole(Role.Secured.DIRECTOR)) {
			role = Role.Secured.HEAD_TEACHER;
		}
		return role;
	}
}
