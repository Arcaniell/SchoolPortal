package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import school.dto.JournalStudentDto;
import school.dto.JournalTeacherDto;
import school.service.JournalService;

@Controller
public class JournalController {

	@Inject
	private JournalService journalService;

	@RequestMapping(value = "journal")
	public String index(Principal user, Model model, HttpServletRequest request) {

		JournalTeacherDto teacherDto = journalService.getTeacherInfo(Long
				.parseLong(user.getName()));
		// if (request.isUserInRole(Role.Secured.TEACHER)) {
		model.addAttribute("teacher", teacherDto);
		// }
		return "journal";
	}

	@RequestMapping(value = "journal", method = RequestMethod.POST)
	public String getByGroup(Principal user,
			@RequestParam(value = "dateFrom") String dateFrom,
			@RequestParam(value = "dateTo") String dateTo,
			@RequestParam(value = "groupNumber") String groupNumber,
			@RequestParam(value = "groupLetter") String groupLetter,
			@RequestParam(value = "course") String course, Model model,
			HttpServletRequest request) throws ParseException {

		Set<Date> dates = journalService.getDates(dateFrom, dateTo);
		Set<JournalStudentDto> studentDtos = journalService.getStudentsInfo(
				groupNumber, groupLetter, course, dateFrom, dateTo);
		JournalTeacherDto teacherDto = journalService.getTeacherInfo(Long
				.parseLong(user.getName()));

		model.addAttribute("studentDtos", studentDtos);
		model.addAttribute("scheduleDates", dates);
		model.addAttribute("teacher", teacherDto);

		return "journal";
	}
}
