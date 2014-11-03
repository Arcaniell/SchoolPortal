package school.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import school.model.User;
import school.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	public User createUser(User user){
		return userService.createUser(user);
	}
}
