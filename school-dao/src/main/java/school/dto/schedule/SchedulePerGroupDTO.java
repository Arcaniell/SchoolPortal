package school.dto.schedule;

import java.util.List;
import java.util.Set;

public class SchedulePerGroupDTO {
	private GroupScheduleDTO group;
	private List<ScheduleDTO> listSchedule;

	private int lessCount;
	private int rowCount;
	private Set<LessonDTO> setLess;

	private Set<String> tableDate;

	public Set<String> getTableDate() {
		return tableDate;
	}

	public void setTableDate(Set<String> tableDate) {
		this.tableDate = tableDate;
	}

	public SchedulePerGroupDTO() {
		super();

	}

	public SchedulePerGroupDTO(GroupScheduleDTO group,
			List<ScheduleDTO> listSchedule, int lessCount, int rowCount,
			Set<LessonDTO> setLess, Set<String> tableDate) {
		super();
		this.group = group;
		this.listSchedule = listSchedule;
		this.lessCount = lessCount;
		this.rowCount = rowCount;
		this.setLess = setLess;
		this.tableDate = tableDate;
	}

	public Set<LessonDTO> getSetLess() {
		return setLess;
	}

	public void setSetLess(Set<LessonDTO> setLess) {
		this.setLess = setLess;
	}

	public int getLessCount() {
		return lessCount;
	}

	public void setLessCount(int lessCount) {
		this.lessCount = lessCount;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public GroupScheduleDTO getGroup() {
		return group;
	}

	public void setGroup(GroupScheduleDTO group) {
		this.group = group;
	}

	public List<ScheduleDTO> getListSchedule() {
		return listSchedule;
	}

	public void setListSchedule(List<ScheduleDTO> listSchedule) {
		this.listSchedule = listSchedule;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + lessCount;
		result = prime * result
				+ ((listSchedule == null) ? 0 : listSchedule.hashCode());
		result = prime * result + rowCount;
		result = prime * result + ((setLess == null) ? 0 : setLess.hashCode());
		result = prime * result
				+ ((tableDate == null) ? 0 : tableDate.hashCode());
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
		SchedulePerGroupDTO other = (SchedulePerGroupDTO) obj;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (lessCount != other.lessCount)
			return false;
		if (listSchedule == null) {
			if (other.listSchedule != null)
				return false;
		} else if (!listSchedule.equals(other.listSchedule))
			return false;
		if (rowCount != other.rowCount)
			return false;
		if (setLess == null) {
			if (other.setLess != null)
				return false;
		} else if (!setLess.equals(other.setLess))
			return false;
		if (tableDate == null) {
			if (other.tableDate != null)
				return false;
		} else if (!tableDate.equals(other.tableDate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SchedulePerGroupDTO [group=" + group + ", listSchedule="
				+ listSchedule + ", lessCount=" + lessCount + ", rowCount="
				+ rowCount + ", setLess=" + setLess + ", tableDate="
				+ tableDate + "]";
	}

}
