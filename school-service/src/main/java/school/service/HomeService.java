package school.service;

import java.util.List;

import school.model.News;
import school.model.RegistrationData;
import school.model.User;

public interface HomeService {
	List<News> findAllNews();
	boolean forgotAPassword(RegistrationData registrationData, String url);
	boolean registrateUser(RegistrationData registrationData, String url);
	User confirmUser(long userId, int code);
	User confirmPassword(long userId, int code);
}
