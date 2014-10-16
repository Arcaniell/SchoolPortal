package school.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

// check Entities @ documentation, getters&setters alt+shift+s
@Entity
@Table(name="Teacher")
public class Teacher {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private int rate;
	@OneToMany(mappedBy = "teacher")
	private List<Salary> salaries;
	@OneToOne
	@JoinColumn(nullable=false, name="userId")
	private User user;
	@ManyToMany
	
	@JoinTable(name = "TeacherSubjectRef", 
	joinColumns = { @JoinColumn(name = "teacherId", nullable = false) }, 
	inverseJoinColumns = { @JoinColumn(name = "subjectId", nullable = false)})
	
	List<Subject> subjects = new ArrayList<Subject>();
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public List<Salary> getSalaries() {
		return salaries;
	}

	public void setSalaries(List<Salary> salaries) {
		this.salaries = salaries;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
