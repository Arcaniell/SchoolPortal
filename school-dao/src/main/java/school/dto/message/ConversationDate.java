package school.dto.message;

import java.util.Date;

import school.model.Conversation;

public class ConversationDate {

	private Conversation conversation;
	private Date date;

	public ConversationDate(Conversation conversation, Date date) {
		this.conversation = conversation;
		this.date = date;
	}

	public Conversation getConversation() {
		return conversation;
	}

	public void setConversation(Conversation conversation) {
		this.conversation = conversation;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
