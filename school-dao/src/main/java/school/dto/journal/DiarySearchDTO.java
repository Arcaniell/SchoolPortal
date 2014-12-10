package school.dto.journal;

import java.util.Date;

public class DiarySearchDTO {

	private Date date;
	private long userId;
	private String weekChange;

	public DiarySearchDTO() {
	}

	public DiarySearchDTO(Date date, long userId, String weekChange) {
		this.date = date;
		this.userId = userId;
		this.weekChange = weekChange;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getWeekChange() {
		return weekChange;
	}

	public void setWeekChange(String weekChange) {
		this.weekChange = weekChange;
	}

}
