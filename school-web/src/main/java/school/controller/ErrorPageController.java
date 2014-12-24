package school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController {

	@RequestMapping(value = "errorPage")
	public String index() {
		return "errorPage";
	}

}
