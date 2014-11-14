package school.dto.journal;

import java.util.Date;
import java.util.Map;

public class JournalStudentWithMarksDTO extends JournalDTO implements
		Comparable<JournalStudentWithMarksDTO> {

	private long studentId;
	private String name;
	private Map<Date, String> marks;

	public JournalStudentWithMarksDTO() {

	}

	public JournalStudentWithMarksDTO(long studentId, String name,
			Map<Date, String> marks) {
		this.studentId = studentId;
		this.name = name;
		this.marks = marks;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<Date, String> getMarks() {
		return marks;
	}

	public void setMarks(Map<Date, String> marks) {
		this.marks = marks;
	}

	@Override
	public int compareTo(JournalStudentWithMarksDTO journalStudentDto) {
		return this.name.compareTo(journalStudentDto.getName());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((marks == null) ? 0 : marks.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + (int) (studentId ^ (studentId >>> 32));
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
		JournalStudentWithMarksDTO other = (JournalStudentWithMarksDTO) obj;
		if (marks == null) {
			if (other.marks != null)
				return false;
		} else if (!marks.equals(other.marks))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (studentId != other.studentId)
			return false;
		return true;
	}

}