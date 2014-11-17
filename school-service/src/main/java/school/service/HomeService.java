package school.service;

import java.util.List;

import school.model.News;
import school.model.User;

public interface HomeService {
	List<News> findAllNews();
	boolean forgotAPassword(String email);
	boolean registrateUser(User user, Integer role, String url);
	User confirmUser(long userId, int code);
}
