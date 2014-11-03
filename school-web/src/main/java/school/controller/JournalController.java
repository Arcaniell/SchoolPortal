package school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class JournalController {
	
	@RequestMapping(value="journal")
	public String index(){
		return "journal";
	}
}
