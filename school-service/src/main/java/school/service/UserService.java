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

    /**
     * @param id
     *            id of our logged user
     * @return true if user is a head teacher
     * @author Blowder
     */
    boolean isUserHeadTeacher(long id);

    /**
     * @param id
     *            id of our logged user
     * @return true if user is a student
     * @author Blowder
     */
    boolean isUserStudent(long id);

}
