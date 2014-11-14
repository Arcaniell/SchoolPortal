package school.dto.journal;

import java.util.Set;

public class JournalStudentDTO extends JournalDTO implements
		Comparable<JournalStudentDTO> {

	private long studentId;
	private String name;
	private Set<String> courseNames;

	public JournalStudentDTO() {
	}

	public JournalStudentDTO(long studentId, String name,
			Set<String> courseNames) {
		this.studentId = studentId;
		this.name = name;
		this.courseNames = courseNames;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<String> getCourseNames() {
		return courseNames;
	}

	public void setCourseNames(Set<String> courseNames) {
		this.courseNames = courseNames;
	}

	@Override
	public int compareTo(JournalStudentDTO journalStudentDto) {
		return this.name.compareTo(journalStudentDto.getName());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((courseNames == null) ? 0 : courseNames.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + (int) (studentId ^ (studentId >>> 32));
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
		JournalStudentDTO other = (JournalStudentDTO) obj;
		if (courseNames == null) {
			if (other.courseNames != null)
				return false;
		} else if (!courseNames.equals(other.courseNames))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (studentId != other.studentId)
			return false;
		return true;
	}
}
