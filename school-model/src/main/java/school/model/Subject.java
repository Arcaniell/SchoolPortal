package school.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Subject {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private int rate;
	@Column(nullable=false)
	private String subject;
	@Column(nullable=false)
	private int groupNumber;
	@Column(nullable=false)
	private double coefficient;
	private double price;
	@Column(nullable=false)
	private boolean additional;
	
	@ManyToMany(mappedBy="subjects")
	List<Teacher> teachers;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Subject() {
		super();
	}
	
}
