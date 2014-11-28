package school.dto;

import java.util.List;

public class ProfileDTO {
	private Long profileId;
	private String profileName;
	private String profileEmail;
	private String profileRole;
	private List<ProfileDTO> chieldren;
	private List<ProfileDTO> parents;

	public ProfileDTO() {
		super();
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

	public List<ProfileDTO> getChieldren() {
		return chieldren;
	}

	public void setChieldren(List<ProfileDTO> chieldren) {
		this.chieldren = chieldren;
	}

	public List<ProfileDTO> getParents() {
		return parents;
	}

	public void setParents(List<ProfileDTO> parents) {
		this.parents = parents;
	}

}
