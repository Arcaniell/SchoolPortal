package school.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import school.service.JournalService;

@Controller
public class JournalController {

	@Inject
	private JournalService journalService;

	@RequestMapping(value = "journal")
	public String index() {
		return "journal";
	}

	@RequestMapping(value = "journal/ss", method = RequestMethod.GET)
	public String listJournals(@RequestParam("name") String param, Model model) {
		model.addAttribute("name",
				Byte.toString(journalService.findById(1L).getMark()));
		// model.addAttribute("name",param);
		return "journal";
	}

}
