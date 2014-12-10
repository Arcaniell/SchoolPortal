package school.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "SALARY")
@NamedQueries({
		@NamedQuery(name = Salary.FIND_BY_DATE, query = Salary.FIND_BY_DATE_QUERY),
		@NamedQuery(name = Salary.FIND_BY_PERIOD, query = Salary.FIND_BY_PERIOD_QUERY),
		@NamedQuery(name = Salary.FIND_BY_TEACHER_ID, query = Salary.FIND_BY_TEACHER_ID_QUERY),
		@NamedQuery(name = Salary.FIND_COUNT_OF_HOURS_BY_PERIOD, query = Salary.FIND_COUNT_OF_HOURS_BY_PERIOD_QUERY),
		@NamedQuery(name = Salary.FIND_BY_TEACHER_ID_AND_PERIOD, query = Salary.FIND_BY_TEACHER_ID_AND_PERIOD_QUERY),
		@NamedQuery(name = Salary.FIND_BY_LAST_ISSUE_DATE, query = Salary.FIND_BY_LAST_ISSUE_DATE_QUERY) })
public class Salary {
	public static final String FIND_BY_DATE = "Salary.findByDate";
	public static final String FIND_BY_DATE_QUERY = "SELECT u FROM Salary u WHERE u.issueDate = :issueDate";
	public static final String FIND_BY_PERIOD = "Salary.findByPeriod";
	public static final String FIND_BY_PERIOD_QUERY = "SELECT u FROM Salary u WHERE u.issueDate BETWEEN :from AND :until";
	public static final String FIND_BY_TEACHER_ID = "Salary.findByTeacherId";
	public static final String FIND_BY_TEACHER_ID_QUERY = "SELECT u FROM Salary u WHERE u.teacher.id = :id";
	public static final String FIND_COUNT_OF_HOURS_BY_PERIOD = "Salary.findCountOfHoursByPeropd";
	public static final String FIND_COUNT_OF_HOURS_BY_PERIOD_QUERY = "SELECT count(u.id) FROM Schedule u WHERE u.teacher.id = :id and u.date BETWEEN :from AND :until";
	public static final String FIND_BY_TEACHER_ID_AND_PERIOD = "Salary.findByTeacherIdAndPeriod";
	public static final String FIND_BY_TEACHER_ID_AND_PERIOD_QUERY = "SELECT u FROM Salary u WHERE u.teacher.id = :id AND u.issueDate BETWEEN :from AND :until";
	public static final String FIND_BY_LAST_ISSUE_DATE = "Salary.findByLastIssueDate";
	public static final String FIND_BY_LAST_ISSUE_DATE_QUERY = "SELECT u FROM Salary u WHERE u.teacher.id = :id ORDER BY u.issueDate DESC";
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private int salary;
	
	private int additional;
	
	private int sum;

	private int hours;

	@Temporal(TemporalType.DATE)
	private Date issueDate;

	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	@JoinColumn(name = "teacherId", nullable = false)
	private Teacher teacher;

	public Salary() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public int getSalary() {
		return salary;
	}
	
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
	public int getAdditional() {
		return additional;
	}
	
	public void setAdditional(int additional) {
		this.additional = additional;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result
				+ ((issueDate == null) ? 0 : issueDate.hashCode());
		result = prime * result + sum;
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
		Salary other = (Salary) obj;
		if (id != other.id)
			return false;
		if (issueDate == null) {
			if (other.issueDate != null)
				return false;
		} else if (!issueDate.equals(other.issueDate))
			return false;
		if (sum != other.sum)
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		return true;
	}

}
