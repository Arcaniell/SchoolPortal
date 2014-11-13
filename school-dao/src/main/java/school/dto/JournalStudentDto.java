package school.dto;

import java.util.Set;

import school.model.Course;
import school.model.Group;

public class JournalStudentDto implements Comparable<JournalStudentDto> {

	private long studentId;
	private String name;
	private Set<Group> studentGroups;

	private Set<Course> studentCourses;

	public JournalStudentDto() {

	}

	public JournalStudentDto(long studentId, String name,
			Set<Group> studentGroups, Set<Course> studentCourses) {
		this.studentId = studentId;
		this.name = name;
		this.studentGroups = studentGroups;
		this.studentCourses = studentCourses;
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

	public Set<Group> getStudentGroups() {
		return studentGroups;
	}

	public void setStudentGroups(Set<Group> studentGroups) {
		this.studentGroups = studentGroups;
	}

	public Set<Course> getStudentCourses() {
		return studentCourses;
	}

	public void setStudentCourses(Set<Course> studentCourses) {
		this.studentCourses = studentCourses;
	}

	@Override
	public int compareTo(JournalStudentDto journalStudentDto) {
		return this.name.compareTo(journalStudentDto.getName());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((studentCourses == null) ? 0 : studentCourses.hashCode());
		result = prime * result
				+ ((studentGroups == null) ? 0 : studentGroups.hashCode());
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
		JournalStudentDto other = (JournalStudentDto) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (studentCourses == null) {
			if (other.studentCourses != null)
				return false;
		} else if (!studentCourses.equals(other.studentCourses))
			return false;
		if (studentGroups == null) {
			if (other.studentGroups != null)
				return false;
		} else if (!studentGroups.equals(other.studentGroups))
			return false;
		if (studentId != other.studentId)
			return false;
		return true;
	}

}