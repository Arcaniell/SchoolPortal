package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import school.dto.journal.StudentMarksDTO;
import school.model.Role;
import school.model.Student;
import school.service.DiaryService;
import school.service.utils.JournalUtil;

@Controller
public class DiaryController {

	@Inject
	private DiaryService diaryService;

	@RequestMapping(value = "diary")
	public String getDiaryByCurrentWeek(Principal user, Model model,
			HttpServletRequest request) throws ParseException {

		if (user == null) {
			return "redirect:/login";
		}

		List<Date> currentWeek = new ArrayList<Date>();

		if (request.getParameter("date") == null
				&& request.getParameter("changePage") == null) {

			Calendar currentDate = Calendar.getInstance();
			currentWeek = JournalUtil.getWeek(currentDate);
		} else {

			SimpleDateFormat format = new SimpleDateFormat(
					JournalUtil.DEFAULT_DATE_FORMAT, Locale.ENGLISH);
			Date formatedDate = format.parse(request.getParameter("date"));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(formatedDate);

			if (request.getParameter("changePage")
					.equals(JournalUtil.NEXT_WEEK)) {
				calendar.add(Calendar.DATE, Calendar.DAY_OF_WEEK);
			} else if (request.getParameter("changePage").equals(
					JournalUtil.PREVIOUS_WEEK)) {
				calendar.add(Calendar.DATE, -Calendar.DAY_OF_WEEK);
			}
			currentWeek = JournalUtil.getWeek(calendar);
		}

		if (request.isUserInRole(Role.Secured.STUDENT)) {
			List<StudentMarksDTO> diaryMarks = diaryService.getDiaryMarks(
					user.getName(), currentWeek);
			model.addAttribute(JournalUtil.MOD_ATT_DIARY_MARKS, diaryMarks);
		}

		return "diary";
	}

	@RequestMapping(value = "diary-parent")
	public String getParentKids(Principal user, Model model,
			HttpServletRequest request) throws ParseException {

		if (user == null) {
			return "redirect:/login";
		}

		if (request.isUserInRole(Role.Secured.PARENT)) {
			model.addAttribute("kids", diaryService.getKids(user.getName()));
		}

		return "diary-parent";
	}

	@RequestMapping(value = "diary-parent/{id}")
	public String getDiaryParent(Principal user, Model model,
			@PathVariable String id, HttpServletRequest request)
			throws ParseException {

		if (user == null) {
			return "redirect:/login";
		}

		List<Date> currentWeek = new ArrayList<Date>();

		if (request.getParameter("date") == null
				&& request.getParameter("changePage") == null) {

			Calendar currentDate = Calendar.getInstance();
			currentWeek = JournalUtil.getWeek(currentDate);
		} else {

			SimpleDateFormat format = new SimpleDateFormat(
					JournalUtil.DEFAULT_DATE_FORMAT, Locale.ENGLISH);
			Date formatedDate = format.parse(request.getParameter("date"));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(formatedDate);

			if (request.getParameter("changePage")
					.equals(JournalUtil.NEXT_WEEK)) {
				calendar.add(Calendar.DATE, Calendar.DAY_OF_WEEK);
			} else if (request.getParameter("changePage").equals(
					JournalUtil.PREVIOUS_WEEK)) {
				calendar.add(Calendar.DATE, -Calendar.DAY_OF_WEEK);
			}
			currentWeek = JournalUtil.getWeek(calendar);
		}

		if (request.isUserInRole(Role.Secured.PARENT)) {
			List<StudentMarksDTO> diaryMarks = diaryService.getDiaryMarks(id,
					currentWeek);
			model.addAttribute(JournalUtil.MOD_ATT_DIARY_MARKS, diaryMarks);
		}
		if (request.isUserInRole(Role.Secured.PARENT)) {
			model.addAttribute("kids", diaryService.getKids(user.getName()));
		}

		return "diary-parent";
	}

}
