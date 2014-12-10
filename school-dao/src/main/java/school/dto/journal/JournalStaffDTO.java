package school.dto.journal;

import java.util.Set;

import school.model.Group;

public class JournalStaffDTO {

	private long id;
	private String name;
	private Set<Group> groups;
	private Set<Byte> groupNumbers;
	private Set<Character> groupLetters;
	private Set<String> courseNames;

	public JournalStaffDTO() {
	}

	public JournalStaffDTO(long id, String name, Set<Byte> groupNumbers,
			Set<Character> groupLetters, Set<String> courseNames) {
		this.id = id;
		this.name = name;
		this.groupNumbers = groupNumbers;
		this.groupLetters = groupLetters;
		this.courseNames = courseNames;
	}

	public Set<Byte> getGroupNumbers() {
		return groupNumbers;
	}

	public void setGroupNumbers(Set<Byte> groupNumbers) {
		this.groupNumbers = groupNumbers;
	}

	public Set<Character> getGroupLetters() {
		return groupLetters;
	}

	public void setGroupLetters(Set<Character> groupLetters) {
		this.groupLetters = groupLetters;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Group> getGroups() {
		return groups;
	}

	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}

	public Set<String> getCourseNames() {
		return courseNames;
	}

	public void setCourseNames(Set<String> courseNames) {
		this.courseNames = courseNames;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((courseNames == null) ? 0 : courseNames.hashCode());
		result = prime * result
				+ ((groupLetters == null) ? 0 : groupLetters.hashCode());
		result = prime * result
				+ ((groupNumbers == null) ? 0 : groupNumbers.hashCode());
		result = prime * result + ((groups == null) ? 0 : groups.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JournalStaffDTO other = (JournalStaffDTO) obj;
		if (courseNames == null) {
			if (other.courseNames != null)
				return false;
		} else if (!courseNames.equals(other.courseNames))
			return false;
		if (groupLetters == null) {
			if (other.groupLetters != null)
				return false;
		} else if (!groupLetters.equals(other.groupLetters))
			return false;
		if (groupNumbers == null) {
			if (other.groupNumbers != null)
				return false;
		} else if (!groupNumbers.equals(other.groupNumbers))
			return false;
		if (groups == null) {
			if (other.groups != null)
				return false;
		} else if (!groups.equals(other.groups))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

}