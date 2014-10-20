package school.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Subject {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(nullable = false)
	private String subjectId;

	@Column(nullable = false)
	private int groupNumber;

	private int coeficient;

	private int price;

	private boolean additional;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	private List<CourseRequest> courseRequest;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	private List<Schedule> schedule;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "SubjectTeacherRef", joinColumns = @JoinColumn(name = "subjectId"), inverseJoinColumns = @JoinColumn(name = "teacherId"))
	private List<Teacher> teacher;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public int getGroupNumber() {
		return groupNumber;
	}

	public void setGroupNumber(int groupNumber) {
		this.groupNumber = groupNumber;
	}

	public int getCoeficient() {
		return coeficient;
	}

	public void setCoeficient(int coeficient) {
		this.coeficient = coeficient;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public boolean isAdditional() {
		return additional;
	}

	public void setAdditional(boolean additional) {
		this.additional = additional;
	}

	public List<CourseRequest> getCourseRequest() {
		return courseRequest;
	}

	public void setCourseRequest(List<CourseRequest> courseRequest) {
		this.courseRequest = courseRequest;
	}

	public List<Schedule> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<Schedule> schedule) {
		this.schedule = schedule;
	}

	public List<Teacher> getTeacher() {
		return teacher;
	}

	public void setTeacher(List<Teacher> teacher) {
		this.teacher = teacher;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (additional ? 1231 : 1237);
		result = prime * result + coeficient;
		result = prime * result
				+ ((courseRequest == null) ? 0 : courseRequest.hashCode());
		result = prime * result + groupNumber;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + price;
		result = prime * result
				+ ((schedule == null) ? 0 : schedule.hashCode());
		result = prime * result
				+ ((subjectId == null) ? 0 : subjectId.hashCode());
		result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
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
		Subject other = (Subject) obj;
		if (additional != other.additional)
			return false;
		if (coeficient != other.coeficient)
			return false;
		if (courseRequest == null) {
			if (other.courseRequest != null)
				return false;
		} else if (!courseRequest.equals(other.courseRequest))
			return false;
		if (groupNumber != other.groupNumber)
			return false;
		if (id != other.id)
			return false;
		if (price != other.price)
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		if (subjectId == null) {
			if (other.subjectId != null)
				return false;
		} else if (!subjectId.equals(other.subjectId))
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		return true;
	}

	
}
