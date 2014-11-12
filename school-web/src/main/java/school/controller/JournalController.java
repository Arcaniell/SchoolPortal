package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.JournalTeacherDto;
import school.model.Journal;
import school.model.Role;
import school.model.Schedule;
import school.model.Teacher;
import school.service.JournalService;

@Controller
public class JournalController {

	@Inject
	private JournalService journalService;

	@RequestMapping(value = "journal")
	public String index(Principal user, Model model, HttpServletRequest request) {

		JournalTeacherDto teacher = journalService.getTeacherInfo(Long
				.parseLong(user.getName()));
		// if (request.isUserInRole(Role.Secured.TEACHER)) {
		model.addAttribute("teacher", teacher);
		// }
		return "journal";
	}

	@RequestMapping(value = "journal", method = RequestMethod.POST)
	public String getByGroup(@RequestParam(value = "dateFrom") String dateFrom,
			@RequestParam(value = "dateTo") String dateTo,
			@RequestParam(value = "groupNumber") String groupNumber,
			@RequestParam(value = "groupLetter") String groupLetter, Model model)
			throws ParseException {

		Set<Date> dates = journalService.getDates(dateFrom, dateTo);

		Map<Long, List<Journal>> map = journalService.getStudentsWithMarks(
				groupNumber, groupLetter);

		model.addAttribute("studentMarks", map);
		model.addAttribute("scheduleDates", dates);

		return "journal";
	}
}
