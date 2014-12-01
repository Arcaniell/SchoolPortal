package school.dto.message;

public class ConversationDto {

	private String name;
	private String subject;
	private String date;
	private String id;
	private boolean hasNewMessages;
	
	public ConversationDto(String name, String subject, String date, String id,
			boolean hasNewMessages) {
		this.name = name;
		this.subject = subject;
		this.date = date;
		this.id = id;
		this.hasNewMessages = hasNewMessages;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean isHasNewMessages() {
		return hasNewMessages;
	}
	public void setHasNewMessages(boolean hasNewMessages) {
		this.hasNewMessages = hasNewMessages;
	}
}
