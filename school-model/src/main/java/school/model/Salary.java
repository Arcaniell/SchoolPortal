<<<<<<< HEAD
package school.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

// check Entities @ documentation, getters&setters alt+shift+s
@Entity
@Table(name="Teacher")
public class Salary {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(name="rate")
	private int rate;
	@OneToOne
	@JoinColumn(name="id")
	private Salary salary;
	@OneToOne
	@JoinColumn(name="id")
	private Group group;
	@OneToOne
	@JoinColumn(name="id")
	private User user;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public Salary() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
=======
package school.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Salary {
	@Id
	private int id;
	@Column
	private double sum;
	@Column
	@Temporal(TemporalType.DATE)
	private Date issueDate;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacherId")
	private Teacher teacher;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getSum() {
		return sum;
	}

	public void setSum(double sum) {
		this.sum = sum;
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

}
>>>>>>> ae0e245eb6f7dbe86678540167708eaad16c0945
