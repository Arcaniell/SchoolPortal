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

import school.dto.JournalParentDTO;
import school.dto.JournalStudentDto;
import school.dto.JournalStudentWithMarksDTO;
import school.dto.JournalTeacherDto;
import school.model.Role;
import school.service.JournalService;

@Controller
public class JournalController {

	@Inject
	private JournalService journalService;

	@RequestMapping(value = "journal")
	public String index(Principal user, Model model, HttpServletRequest request) {

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			JournalTeacherDto teacherDTO = journalService.getTeacherInfo(user
					.getName());
			model.addAttribute("teacher", teacherDTO);
		}

		if (request.isUserInRole(Role.Secured.STUDENT)) {
			JournalStudentDto studentDTO = journalService.getStudentInfo(user
					.getName());
			model.addAttribute("student", studentDTO);
		}

		if (request.isUserInRole(Role.Secured.PARENT)) {
			JournalParentDTO parentDTO = journalService.getParentInfo(user
					.getName());
			model.addAttribute("parent", parentDTO);
		}

		return "journal";
	}

	@RequestMapping(value = "journal", method = RequestMethod.POST)
	public String getByGroup(Principal user,
			@RequestParam(value = "student") String student,
			@RequestParam(value = "dateFrom") String dateFrom,
			@RequestParam(value = "dateTo") String dateTo,
			@RequestParam(value = "groupNumber") String groupNumber,
			@RequestParam(value = "groupLetter") String groupLetter,
			@RequestParam(value = "course") String course, Model model,
			HttpServletRequest request) throws ParseException {

		Set<Date> dates = journalService.getDates(dateFrom, dateTo);
		Set<JournalStudentWithMarksDTO> studentWithMarksDTOs = journalService
				.getStudentsWithMarks(student, groupNumber, groupLetter,
						course, dateFrom, dateTo);

		model.addAttribute("studentDtos", studentWithMarksDTOs);
		model.addAttribute("scheduleDates", dates);

		if (request.isUserInRole(Role.Secured.TEACHER)) {
			JournalTeacherDto teacherDTO = journalService.getTeacherInfo(user
					.getName());
			model.addAttribute("teacher", teacherDTO);
		} else if (request.isUserInRole(Role.Secured.STUDENT)) {
			JournalStudentDto studentDTO = journalService.getStudentInfo(user
					.getName());
			model.addAttribute("student", studentDTO);
		}

		return "journal";
	}
}
