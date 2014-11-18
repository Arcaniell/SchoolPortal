package school.service;

import school.dto.RegistrationDTO;
import school.model.RegistrationData;
import school.model.User;

public interface EmailService {
	boolean sendRegistrationEmail(RegistrationDTO registrationDTO, String url);
	boolean sendNewPassword(User user, RegistrationData registrationData, String url);
}
