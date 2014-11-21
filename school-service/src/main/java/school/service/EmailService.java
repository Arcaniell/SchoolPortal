package school.service;

import school.model.RegistrationData;
import school.model.RestorePassword;
import school.model.User;

public interface EmailService {
	boolean sendRegistrationEmail(RegistrationData registrationData, String url);
	boolean sendNewPassword(RestorePassword restorePassword, String url);
}
