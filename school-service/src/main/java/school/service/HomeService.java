package school.service;

import java.util.List;

import school.dto.RegistrationDTO;
import school.model.Group;
import school.model.News;
import school.model.RegistrationData;
import school.model.User;

public interface HomeService {
	List<News> findAllNews();
	List<Group> findAllNotAdditionalGroups();
	boolean forgotAPassword(RegistrationData registrationData, String url);
	boolean registrateUser(RegistrationDTO registrationDTO, String url);
	User confirmUser(long userId, int code);
	User confirmPassword(long userId, int code);
}
