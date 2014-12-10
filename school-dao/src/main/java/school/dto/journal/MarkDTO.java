package school.dto.journal;

import java.util.Date;

public class MarkDTO implements Comparable<MarkDTO> {

	private Long lessonId;
	private long scheduleId;
	private String courseName;
	private String homeTask;
	private Date date;
	private byte mark;
	private byte markCoefficient;

	public MarkDTO() {

	}

	// for diary
	public MarkDTO(long lessonId, long scheduleId, String courseName,
			String homeTask, Date date, byte markCoefficient) {
		this.lessonId = lessonId;
		this.scheduleId = scheduleId;
		this.courseName = courseName;
		this.homeTask = homeTask;
		this.date = date;
		this.markCoefficient = markCoefficient;
	}

	// for diary
	public MarkDTO(long lessonId, long scheduleId, String courseName,
			String homeTask, Date date, byte mark, byte markCoefficient) {
		this.lessonId = lessonId;
		this.scheduleId = scheduleId;
		this.courseName = courseName;
		this.homeTask = homeTask;
		this.date = date;
		this.mark = mark;
		this.markCoefficient = markCoefficient;
	}

	// for journal
	public MarkDTO(long lessonId, long scheduleId, String homeTask, Date date,
			byte markCoefficient) {
		this.lessonId = lessonId;
		this.scheduleId = scheduleId;
		this.homeTask = homeTask;
		this.date = date;
		this.markCoefficient = markCoefficient;
	}

	// for journal
	public MarkDTO(long lessonId, long scheduleId, String homeTask, Date date,
			byte mark, byte markCoefficient) {
		this.lessonId = lessonId;
		this.scheduleId = scheduleId;
		this.homeTask = homeTask;
		this.date = date;
		this.mark = mark;
		this.markCoefficient = markCoefficient;
	}

	public Long getLessonId() {
		return lessonId;
	}

	public void setLessonId(Long lessonId) {
		this.lessonId = lessonId;
	}

	public long getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getHomeTask() {
		return homeTask;
	}

	public void setHomeTask(String homeTask) {
		this.homeTask = homeTask;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public byte getMark() {
		return mark;
	}

	public void setMark(byte mark) {
		this.mark = mark;
	}

	public byte getMarkCoefficient() {
		return markCoefficient;
	}

	public void setMarkCoefficient(byte markCoefficient) {
		this.markCoefficient = markCoefficient;
	}

	@Override
	public int compareTo(MarkDTO markDTO) {
		if (this.date.before(markDTO.getDate())) {
			return -1;
		} else if (this.date.after(markDTO.getDate())) {
			return 1;
		}
		return this.lessonId.compareTo(markDTO.getLessonId());
	}
}
