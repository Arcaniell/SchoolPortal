package school.service;

import org.springframework.security.access.annotation.Secured;
import org.springframework.web.multipart.MultipartFile;

import school.model.Role;
import school.model.User;

public interface UserService {
    User loadUser(long id);
	
	boolean isEmailAviable(String email);
	
	@Secured(Role.Secured.ADMIN)
	void test403();
	
	User createUser(User user);

	User findByEmail(String email);

	@Secured("IS_AUTHENTICATED_FULLY")
	boolean setAvatar(long id, MultipartFile multipartFile);
	@Secured("IS_AUTHENTICATED_FULLY")
	boolean setAvatar(long id, MultipartFile multipartFile, String path);
	@Secured("IS_AUTHENTICATED_FULLY")
	byte[] getAvatar(String id);
	@Secured("IS_AUTHENTICATED_FULLY")
	byte[] getAvatar(String id, String path);

}
