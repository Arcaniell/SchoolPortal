package school.dto.journal;

public class EditDateDTO {

	private long scheduleId;
	private byte eventType;
	private String eventDescription;
	private String homeTask;

	public EditDateDTO() {
	}

	public EditDateDTO(long scheduleId, String homeTask) {
		this.scheduleId = scheduleId;
		this.homeTask = homeTask;
	}

	public EditDateDTO(long scheduleId, byte eventType, String eventDescription) {
		this.scheduleId = scheduleId;
		this.eventType = eventType;
		this.eventDescription = eventDescription;
	}

	public EditDateDTO(long scheduleId, byte eventType, String eventDescription,
			String homeTask) {
		this.scheduleId = scheduleId;
		this.eventType = eventType;
		this.eventDescription = eventDescription;
		this.homeTask = homeTask;
	}

	public long getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}

	public byte getEventType() {
		return eventType;
	}

	public void setEventType(byte eventType) {
		this.eventType = eventType;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getHomeTask() {
		return homeTask;
	}

	public void setHomeTask(String homeTask) {
		this.homeTask = homeTask;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((eventDescription == null) ? 0 : eventDescription.hashCode());
		result = prime * result + eventType;
		result = prime * result
				+ ((homeTask == null) ? 0 : homeTask.hashCode());
		result = prime * result + (int) (scheduleId ^ (scheduleId >>> 32));
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
		EditDateDTO other = (EditDateDTO) obj;
		if (eventDescription == null) {
			if (other.eventDescription != null)
				return false;
		} else if (!eventDescription.equals(other.eventDescription))
			return false;
		if (eventType != other.eventType)
			return false;
		if (homeTask == null) {
			if (other.homeTask != null)
				return false;
		} else if (!homeTask.equals(other.homeTask))
			return false;
		if (scheduleId != other.scheduleId)
			return false;
		return true;
	}

}
