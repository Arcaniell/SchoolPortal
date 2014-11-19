package school.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import school.dto.journal.StudentMarksDTO;
import school.model.Role;
import school.service.DiaryService;
import school.service.utils.JournalUtil;

@Controller
public class DiaryController {

	@Inject
	private DiaryService diaryService;

	@RequestMapping(value = "diary")
	public String getDiaryByCurrentWeek(Principal user, Model model,
			HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws ParseException {

		Calendar date = Calendar.getInstance();

		List<Date> currentWeek = JournalUtil.getWeek(date);

		if (request.isUserInRole(Role.Secured.STUDENT)) {
			List<StudentMarksDTO> diaryMarks = diaryService.getDiaryMarks(
					user.getName(), currentWeek);
			model.addAttribute(JournalUtil.MOD_ATT_DIARY_MARKS, diaryMarks);
		}
		return "diary";
	}

	@RequestMapping(value = "diary-change")
	public String changeWeek(Principal user, Model model,
			@RequestParam(value = "date") String date,
			@RequestParam(value = "changePage") String changePage,
			HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws ParseException {

		SimpleDateFormat format = new SimpleDateFormat(
				JournalUtil.DEFAULT_DATE_FORMAT, Locale.ENGLISH);
		Date formatedDate = format.parse(date);

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatedDate);

		if (changePage.equals(JournalUtil.NEXT_WEEK)) {
			calendar.add(Calendar.DATE, 7);
		} else if (changePage.equals(JournalUtil.PREVIOUS_WEEK)) {
			calendar.add(Calendar.DATE, -7);
		}

		List<Date> currentWeek = JournalUtil.getWeek(calendar);

		if (request.isUserInRole(Role.Secured.STUDENT)) {
			List<StudentMarksDTO> diaryMarks = diaryService.getDiaryMarks(
					user.getName(), currentWeek);
			model.addAttribute(JournalUtil.MOD_ATT_DIARY_MARKS, diaryMarks);
		}
		return "diary-change";
	}
}
