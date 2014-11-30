package school.dto;

public class EventDTO {

	private long scheduleId;
	private byte type;
	private String description;

	public EventDTO() {
	}

	public EventDTO(long scheduleId, byte type, String description) {
		this.scheduleId = scheduleId;
		this.type = type;
		this.description = description;
	}

	public long getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}

	public byte getType() {
		return type;
	}

	public void setType(byte type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result + (int) (scheduleId ^ (scheduleId >>> 32));
		result = prime * result + type;
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
		EventDTO other = (EventDTO) obj;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (scheduleId != other.scheduleId)
			return false;
		if (type != other.type)
			return false;
		return true;
	}

}
