package school.dto.journal;

public class AddMarkDTO {

	private String studentAndSchedule;
	private byte mark;

	public String getStudentAndSchedule() {
		return studentAndSchedule;
	}

	public void setStudentAndSchedule(String studentAndSchedule) {
		this.studentAndSchedule = studentAndSchedule;
	}

	public byte getMark() {
		return mark;
	}

	public void setMark(byte mark) {
		this.mark = mark;
	}

}
