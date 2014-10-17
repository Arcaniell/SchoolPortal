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
	long id;

	@Column(nullable = false)
	String subject;

	@Column(nullable = false)
	int number;

	double coeficient;

	double price;

	boolean addition;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	List<CourseRequest> courseRequest;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "subject")
	List<Schedule> schedule;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "SubjectTeacherRef", joinColumns = @JoinColumn(name = "subjectId"), inverseJoinColumns = @JoinColumn(name = "teacherId"))
	private List<Teacher> teacher;

	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public double getCoeficient() {
		return coeficient;
	}

	public void setCoeficient(double coeficient) {
		this.coeficient = coeficient;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isAddition() {
		return addition;
	}

	public void setAddition(boolean addition) {
		this.addition = addition;
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
		result = prime * result + (addition ? 1231 : 1237);
		long temp;
		temp = Double.doubleToLongBits(coeficient);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result
				+ ((courseRequest == null) ? 0 : courseRequest.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + number;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result
				+ ((schedule == null) ? 0 : schedule.hashCode());
		result = prime * result + ((subject == null) ? 0 : subject.hashCode());
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
		if (addition != other.addition)
			return false;
		if (Double.doubleToLongBits(coeficient) != Double
				.doubleToLongBits(other.coeficient))
			return false;
		if (courseRequest == null) {
			if (other.courseRequest != null)
				return false;
		} else if (!courseRequest.equals(other.courseRequest))
			return false;
		if (id != other.id)
			return false;
		if (number != other.number)
			return false;
		if (Double.doubleToLongBits(price) != Double
				.doubleToLongBits(other.price))
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		if (subject == null) {
			if (other.subject != null)
				return false;
		} else if (!subject.equals(other.subject))
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		return true;
	}

}
