package school.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Journal {

	public static final String FIND_BY_DATE_QUERY = "SELECT j FROM Journal j WHERE j.date = :date";
	public static final String FIND_BY_INTERVAL_QUERY = "SELECT j FROM Journal j WHERE j.date BETWEEN :from AND :till";
	public static final String FIND_BY_STUDENT_QUERY = "SELECT j FROM Journal j WHERE j.studentId = :studentId";
	public static final String FIND_BY_DATE_AND_STUDENT_QUERY = "SELECT j FROM Journal j WHERE j.studentId = :studentId AND j.date = :date";
	public static final String FIND_BY_INTERVAL_AND_STUDENT_QUERY = "SELECT j FROM Journal j WHERE j.studentId = :studentId AND j.date BETWEEN :from AND :till";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true)
	private long id;
	@ManyToOne
	@JoinColumn(name = "studentId", nullable = false)
	private Student student;
	@ManyToOne
	@JoinColumn(name = "scheduleId", nullable = false)
	private Schedule schedule;
	private byte mark;
	private byte coefficient;
	@Column(nullable = false)
	private Date date;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public byte getMark() {
		return mark;
	}

	public void setMark(byte mark) {
		this.mark = mark;
	}

	public byte getCoefficient() {
		return coefficient;
	}

	public void setCoefficient(byte coefficient) {
		this.coefficient = coefficient;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + coefficient;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + mark;
		result = prime * result
				+ ((schedule == null) ? 0 : schedule.hashCode());
		result = prime * result + ((student == null) ? 0 : student.hashCode());
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
		Journal other = (Journal) obj;
		if (coefficient != other.coefficient)
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (id != other.id)
			return false;
		if (mark != other.mark)
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		if (student == null) {
			if (other.student != null)
				return false;
		} else if (!student.equals(other.student))
			return false;
		return true;
	}

	
}
