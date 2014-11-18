package school.dto;

import school.model.RegistrationData;
import school.model.User;

public class RegistrationDTO {

	private User user;
	private RegistrationData registrationData;
	
	public RegistrationDTO() {
		super();
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public RegistrationData getRegistrationData() {
		return registrationData;
	}
	public void setRegistrationData(RegistrationData registrationData) {
		this.registrationData = registrationData;
	}
	
	
	
}
