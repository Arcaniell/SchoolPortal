package school.dto.message;

public class MessageDto {

	private String id;
	private String name;
	private long userId;
	private String dateTime;
	private String text;
	
	public MessageDto(String id, String name, String dateTime,
			String text) {
		this.id = id;
		this.name = name;
		this.dateTime = dateTime;
		this.text = text;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
}
