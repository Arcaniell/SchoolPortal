package school.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "HOME_TASK")
@NamedQueries({
		@NamedQuery(name = HomeTask.FIND_BY_SCHEDULE, query = "SELECT ht FROM HomeTask ht WHERE ht.schedule.id = :scheduleId"),
		@NamedQuery(name = HomeTask.FIND_BY_GROUP, query = "SELECT ht FROM HomeTask ht WHERE ht.group.id = :groupId"),
		@NamedQuery(name = HomeTask.FIND_BY_GROUP_SCHEDULE, query = "SELECT ht FROM HomeTask ht WHERE ht.group.id = :groupId AND ht.schedule.id = :scheduleId"), })
public class HomeTask {

	public static final String FIND_BY_SCHEDULE = "HomeTask.findByScheduleId";
	public static final String FIND_BY_GROUP = "HomeTask.findByGroup";
	public static final String FIND_BY_GROUP_SCHEDULE = "Journal.findByGroupAndSchedule";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true)
	private long id;
	@OneToOne
	@JoinColumn(name = "groupId", nullable = false)
	private Group group;
	@Column(nullable = false, length = 65)
	private String task;
	@OneToOne
	@JoinColumn(name = "scheduleId", nullable = false)
	private Schedule schedule;

	public HomeTask() {
	}

	public HomeTask(Group group, String task, Schedule schedule) {
		this.group = group;
		this.task = task;
		this.schedule = schedule;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result
				+ ((schedule == null) ? 0 : schedule.hashCode());
		result = prime * result + ((task == null) ? 0 : task.hashCode());
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
		HomeTask other = (HomeTask) obj;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (id != other.id)
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		if (task == null) {
			if (other.task != null)
				return false;
		} else if (!task.equals(other.task))
			return false;
		return true;
	}

}
