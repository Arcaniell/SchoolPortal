package school.dto.journal;

import java.util.Date;

public class Mark2DTO implements Comparable<Mark2DTO> {

	private long scheduleId;
	private Date date;
	private byte mark;
	private byte markCoefficient;

	public Mark2DTO() {

	}

	public Mark2DTO(long scheduleId, Date date, byte mark, byte markCoefficient) {
		this.scheduleId = scheduleId;
		this.date = date;
		this.mark = mark;
		this.markCoefficient = markCoefficient;
	}

	public Mark2DTO(long scheduleId, Date date, byte markCoefficient) {
		this.scheduleId = scheduleId;
		this.date = date;
		this.markCoefficient = markCoefficient;
	}

	public long getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
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
	public int compareTo(Mark2DTO markDTO) {
		if (this.date.before(markDTO.getDate())) {
			return -1;
		} else if (this.date.after(markDTO.getDate())) {
			return 1;
		}
		return 0;
	}
}
