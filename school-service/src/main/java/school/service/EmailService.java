package school.service;

import school.model.RegistrationCode;
import school.model.User;

public interface EmailService {
	boolean sendRegistrationEmail(User user, RegistrationCode registrationCode, String url);
	boolean sendNewPassword(User user, RegistrationCode registrationCode, String url);
}
