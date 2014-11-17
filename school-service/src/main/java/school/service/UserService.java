package school.service;

import org.springframework.security.access.annotation.Secured;

import school.model.Role;
import school.model.User;

public interface UserService {
    User loadUser(long id);
	
	boolean isEmailAviable(String email);
	
	@Secured(Role.Secured.ADMIN)
	void test403();
	
	User createUser(User user);

}
