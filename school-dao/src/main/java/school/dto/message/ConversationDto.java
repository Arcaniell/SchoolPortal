package school.dto.message;

public class ConversationDto {

	private String firstName;
	private String lastName;
	private String subject;
	private String date;
	private String id;
	private boolean hasNewMessages;
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
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
