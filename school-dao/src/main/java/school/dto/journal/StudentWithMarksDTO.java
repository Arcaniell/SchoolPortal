package school.dto.journal;

import java.util.Date;
import java.util.Set;

public class StudentWithMarksDTO implements Comparable<StudentWithMarksDTO> {

	private long studentId;
	private String studentName;
	private Date date;
	private Set<Mark2DTO> markList;

	public StudentWithMarksDTO() {
	}

	public StudentWithMarksDTO(long studentId, String studentName, Date date,
			Set<Mark2DTO> markList) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.date = date;
		this.markList = markList;
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

	public Set<Mark2DTO> getMarkList() {
		return markList;
	}

	public void setMarkList(Set<Mark2DTO> markList) {
		this.markList = markList;
	}

	@Override
	public int compareTo(StudentWithMarksDTO studentMarksDTO) {
		return this.studentName.compareTo(studentMarksDTO.getStudentName());
	}
}
