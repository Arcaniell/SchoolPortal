package school.model;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "ROOM")
public class Room {
	public static final String FIND_BY_ROOM_NUMBER_QUERY = "SELECT r FROM ROOM r WHERE "
			+ "r.roomNumber = :roomNumber";
	public static final String FIND_BY_AVAILABLE_ROOM_QUERY = "SELECT r FROM ROOM r WHERE "
			+ "r.available = :available";
	public static final String FIND_BY_ROOM_SIZE_QUERY = "SELECT r FROM ROOM r WHERE "
			+ "r.size = :size";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false)
	private int roomNumber;

	@Column(nullable = false)
	private int size;

	private boolean available;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "room")
	private List<Schedule> schedule;

	public Room() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public List<Schedule> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<Schedule> schedule) {
		this.schedule = schedule;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + roomNumber;
		result = prime * result
				+ ((schedule == null) ? 0 : schedule.hashCode());
		result = prime * result + size;
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
		Room other = (Room) obj;
		if (available != other.available)
			return false;
		if (id != other.id)
			return false;
		if (roomNumber != other.roomNumber)
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		if (size != other.size)
			return false;
		return true;
	}

}
