package school.dto.journal;

import school.model.Journal;
import school.model.Schedule;

public class MarkDTO implements Comparable<MarkDTO> {

	private long id;
	private Schedule schedule;
	private Journal journal;

	public MarkDTO() {

	}

	public MarkDTO(Schedule schedule, Journal journal) {
		this.schedule = schedule;
		this.journal = journal;
	}

	public MarkDTO(long id, Schedule schedule, Journal journal) {
		this.id = id;
		this.schedule = schedule;
		this.journal = journal;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Journal getJournal() {
		return journal;
	}

	public void setJournal(Journal journal) {
		this.journal = journal;
	}

	@Override
	public int compareTo(MarkDTO markDTO) {
		if (this.id < markDTO.getId()) {
			return -1;
		} else if (this.id > markDTO.getId()) {
			return 1;
		}
		return 0;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((journal == null) ? 0 : journal.hashCode());
		result = prime * result
				+ ((schedule == null) ? 0 : schedule.hashCode());
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
		MarkDTO other = (MarkDTO) obj;
		if (id != other.id)
			return false;
		if (journal == null) {
			if (other.journal != null)
				return false;
		} else if (!journal.equals(other.journal))
			return false;
		if (schedule == null) {
			if (other.schedule != null)
				return false;
		} else if (!schedule.equals(other.schedule))
			return false;
		return true;
	}

}
