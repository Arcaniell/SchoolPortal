package school.dto.journal;

import java.util.Set;

public class StudentMarksDTO {

	private long studentId;
	private String studentName;
	private Set<MarkDTO> diaryMark;

	public StudentMarksDTO() {
	}

	public StudentMarksDTO(long studentId, String studentName,
			Set<MarkDTO> diaryMark) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.diaryMark = diaryMark;
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
		result = prime * result
				+ ((diaryMark == null) ? 0 : diaryMark.hashCode());
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
		if (diaryMark == null) {
			if (other.diaryMark != null)
				return false;
		} else if (!diaryMark.equals(other.diaryMark))
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
