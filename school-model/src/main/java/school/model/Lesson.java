package school.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="LESSON")
public class Lesson {

	@Id
	@GeneratedValue
	private long id;

	@Column(nullable = false, unique = true)
	private Date startTime;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "lesson")
	private List<Schedule> listSchedule;

	public Lesson() {
		super();
		// TODO Auto-generated constructor stub
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public List<Schedule> getListSchedule() {
		return listSchedule;
	}

	public void setListSchedule(List<Schedule> listSchedule) {
		this.listSchedule = listSchedule;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result
				+ ((listSchedule == null) ? 0 : listSchedule.hashCode());
		result = prime * result
				+ ((startTime == null) ? 0 : startTime.hashCode());
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
		Lesson other = (Lesson) obj;
		if (id != other.id)
			return false;
		if (listSchedule == null) {
			if (other.listSchedule != null)
				return false;
		} else if (!listSchedule.equals(other.listSchedule))
			return false;
		if (startTime == null) {
			if (other.startTime != null)
				return false;
		} else if (!startTime.equals(other.startTime))
			return false;
		return true;
	}

}
