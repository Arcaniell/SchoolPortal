package school.service;

import java.util.List;

import school.dto.RegistrationDTO;
import school.model.News;
import school.model.User;

public interface HomeService {
	List<News> findAllNews();
	boolean forgotAPassword(String email);
	boolean registrateUser(RegistrationDTO registrationDTO, String url);
	User confirmUser(long userId, int code);
}
