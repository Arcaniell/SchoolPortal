package school.dto;

import java.util.List;

public class ProfileDTO {
	private Long profileId;
	private String profileName;
	private String profileEmail;
	private String profileRole;
	private List<ProfileDTO> family;
	private String profileFamilyDescription;
	private String birthday;

	public ProfileDTO() {
		super();
	}
	
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Long getProfileId() {
		return profileId;
	}

	public void setProfileId(Long profileId) {
		this.profileId = profileId;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getProfileEmail() {
		return profileEmail;
	}

	public void setProfileEmail(String profileEmail) {
		this.profileEmail = profileEmail;
	}

	public String getProfileRole() {
		return profileRole;
	}

	public void setProfileRole(String profileRole) {
		this.profileRole = profileRole;
	}

	public List<ProfileDTO> getFamily() {
		return family;
	}

	public void setFamily(List<ProfileDTO> family) {
		this.family = family;
	}

	public String getProfileFamilyDescription() {
		return profileFamilyDescription;
	}

	public void setProfileFamilyDescription(String profileFamilyDescription) {
		this.profileFamilyDescription = profileFamilyDescription;
	}

	

}
