package school.dto.journal;

import java.util.Date;
import java.util.Set;

import school.model.Group;

public class StudentMarksDTO {

	private long studentId;
	private String studentName;
	private Group group;
	private Date date;
	private Set<MarkDTO> diaryMark;

	public StudentMarksDTO() {
	}

	public StudentMarksDTO(long studentId, String studentName, Group group,
			Set<MarkDTO> diaryMark) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.group = group;
		this.diaryMark = diaryMark;
	}

	public StudentMarksDTO(long studentId, String studentName, Date date,
			Set<MarkDTO> diaryMark) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.date = date;
		this.diaryMark = diaryMark;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Set<MarkDTO> getDiaryMark() {
		return diaryMark;
	}

	public void setDiaryMark(Set<MarkDTO> diaryMark) {
		this.diaryMark = diaryMark;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result
				+ ((diaryMark == null) ? 0 : diaryMark.hashCode());
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + (int) (studentId ^ (studentId >>> 32));
		result = prime * result
				+ ((studentName == null) ? 0 : studentName.hashCode());
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
		StudentMarksDTO other = (StudentMarksDTO) obj;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (diaryMark == null) {
			if (other.diaryMark != null)
				return false;
		} else if (!diaryMark.equals(other.diaryMark))
			return false;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (studentId != other.studentId)
			return false;
		if (studentName == null) {
			if (other.studentName != null)
				return false;
		} else if (!studentName.equals(other.studentName))
			return false;
		return true;
	}

}
