package school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RatingController {

	@RequestMapping(value = "student-rating")
	public String getRating() {

		return "student-rating";
	}

}
