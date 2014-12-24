package school.dto.journal;

public class EditMarkDTO {

	private String studentAndSchedule;
	private byte mark;
	private int quarterMark;
	private long studentId;
	private JournalSearch searchData;

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

	public int getQuarterMark() {
		return quarterMark;
	}

	public void setQuarterMark(int quarterMark) {
		this.quarterMark = quarterMark;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public JournalSearch getSearchData() {
		return searchData;
	}

	public void setSearchData(JournalSearch searchData) {
		this.searchData = searchData;
	}

}
