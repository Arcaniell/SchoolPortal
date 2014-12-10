package school.dto.schedule;

public class RoomDTO {
	private int roomNumber;
	private Integer id;

	public RoomDTO(int roomNumber, Integer id) {
		super();
		this.roomNumber = roomNumber;
		this.id = id;
	}

	public Integer getId() {
		return id;

	}

	public void setId(Integer id) {
		this.id = id;
	}

	public RoomDTO() {
	}

	public RoomDTO(int roomNumber) {
		super();
		this.roomNumber = roomNumber;
	}

	public RoomDTO(Integer id) {
		super();
		this.id = id;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + roomNumber;
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
		RoomDTO other = (RoomDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (roomNumber != other.roomNumber)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomNumber=" + roomNumber + ", id=" + id + "]";
	}

}
