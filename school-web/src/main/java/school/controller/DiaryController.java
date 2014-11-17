package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import school.dto.journal.StudentMarksDTO;
import school.model.Role;
import school.service.DiaryService;

@Controller
public class DiaryController {

	@Inject
	private DiaryService diaryService;

	@RequestMapping(value = "diary")
	public String index(Principal user, Model model, HttpServletRequest request)
			throws ParseException {

		if (request.isUserInRole(Role.Secured.STUDENT)) {
			List<StudentMarksDTO> diaryMarks = diaryService.getDiaryMarks(user
					.getName());
			model.addAttribute("diaryMarks", diaryMarks);
		}

		return "diary";
	}

}
