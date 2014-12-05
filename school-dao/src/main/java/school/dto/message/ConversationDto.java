package school.dto.message;

public class ConversationDto {

	private String name;
	private String subject;
	private String date;
	private String id;
	private boolean hasNewMessages;
	private String inboxCount;
	private String sentCount;
	
	public ConversationDto(String inboxCount, String sentCount) {
		this.inboxCount = inboxCount;
		this.sentCount = sentCount;
	}
	
	public ConversationDto(String name, String subject, String date, String id,
			boolean hasNewMessages, String inboxCount, String sentCount) {
		this.name = name;
		this.subject = subject;
		this.date = date;
		this.id = id;
		this.hasNewMessages = hasNewMessages;
		this.inboxCount = inboxCount;
		this.sentCount = sentCount;
	}
		
	public String getInboxCount() {
		return inboxCount;
	}
	public void setInboxCount(String inboxCount) {
		this.inboxCount = inboxCount;
	}
	public String getSentCount() {
		return sentCount;
	}
	public void setSentCount(String sentCount) {
		this.sentCount = sentCount;
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
