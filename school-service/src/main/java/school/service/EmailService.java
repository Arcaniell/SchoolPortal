package school.service;

import school.model.User;

public interface EmailService {
	void sendRegistrationEmail(User user);
}
