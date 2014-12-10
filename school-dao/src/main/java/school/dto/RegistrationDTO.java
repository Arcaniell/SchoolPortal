package school.dto;

import school.model.RegistrationData;

public class RegistrationDTO {

	private RegistrationData registrationData;
	private long groupId;
	public RegistrationData getRegistrationData() {
		return registrationData;
	}
	public void setRegistrationData(RegistrationData registrationData) {
		this.registrationData = registrationData;
	}
	public long getGroupId() {
		return groupId;
	}
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}
	
	
	
}
