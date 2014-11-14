package school.dto.journal;

import java.util.Set;

public class JournalTeacherDTO extends JournalDTO {

	private long teacherId;
	private String teacherName;
	private Set<Byte> groupNumbers;
	private Set<Character> groupLetters;
	private Set<String> courseNames;

	public JournalTeacherDTO() {
	}

	public JournalTeacherDTO(long teacherId, String teacherName,
			Set<Byte> groupNumbers, Set<Character> groupLetters,
			Set<String> courseNames) {
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.groupNumbers = groupNumbers;
		this.groupLetters = groupLetters;
		this.courseNames = courseNames;
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
