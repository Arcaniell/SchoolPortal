package school.dto;

import java.util.Set;

import school.model.Group;

public class JournalTeacherDTO {

	private long teacherId;
	private String teacherName;
	private Set<Byte> groupNumbers;
	private Set<Character> groupLetters;
	private Set<Group> groups;
	private Set<String> courses;

	public JournalTeacherDTO() {
	}

	public JournalTeacherDTO(long teacherId, String teacherName,
			Set<Byte> groupNumbers, Set<Character> groupLetters,
			Set<Group> groups, Set<String> courses) {
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.groupNumbers = groupNumbers;
		this.groupLetters = groupLetters;
		this.groups = groups;
		this.courses = courses;
	}

	public long getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(long teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
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

	public Set<Group> getGroups() {
		return groups;
	}

	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}

	public Set<String> getCourses() {
		return courses;
	}

	public void setCourses(Set<String> courses) {
		this.courses = courses;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((courses == null) ? 0 : courses.hashCode());
		result = prime * result
				+ ((groupLetters == null) ? 0 : groupLetters.hashCode());
		result = prime * result
				+ ((groupNumbers == null) ? 0 : groupNumbers.hashCode());
		result = prime * result + ((groups == null) ? 0 : groups.hashCode());
		result = prime * result + (int) (teacherId ^ (teacherId >>> 32));
		result = prime * result
				+ ((teacherName == null) ? 0 : teacherName.hashCode());
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
		JournalTeacherDTO other = (JournalTeacherDTO) obj;
		if (courses == null) {
			if (other.courses != null)
				return false;
		} else if (!courses.equals(other.courses))
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
		if (teacherId != other.teacherId)
			return false;
		if (teacherName == null) {
			if (other.teacherName != null)
				return false;
		} else if (!teacherName.equals(other.teacherName))
			return false;
		return true;
	}

}