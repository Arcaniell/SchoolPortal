package school.dto;

import java.util.Set;

import school.model.Course;
import school.model.Group;

public class JournalTeacherDto {

	private long teacherId;
	private String teacherName;
	private Set<Course> courses;
	private Set<Group> groups;

	public JournalTeacherDto() {
	}

	public JournalTeacherDto(long teacherId, String teacherName,
			Set<Course> courses, Set<Group> groups) {
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.courses = courses;
		this.groups = groups;
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

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	public Set<Group> getGroups() {
		return groups;
	}

	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((courses == null) ? 0 : courses.hashCode());
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
		JournalTeacherDto other = (JournalTeacherDto) obj;
		if (courses == null) {
			if (other.courses != null)
				return false;
		} else if (!courses.equals(other.courses))
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
