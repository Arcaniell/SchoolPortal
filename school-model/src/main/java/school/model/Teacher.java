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
public class Teacher {
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
	private Group2 group;
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
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
