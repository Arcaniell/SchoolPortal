package school.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;

@Entity
public class Message {
	@Id
	@GeneratedValue
	private long id;
	private long senderId;
	private long receiverId;
	@Lob
	private String message;
	private Date date;
	@OneToOne (fetch=FetchType.LAZY)
	@JoinColumn (name = "id")
	private Message messageId;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getSenderId() {
		return senderId;
	}
	public void setSenderId(long sender_id) {
		this.senderId = sender_id;
	}
	public long getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(long receiver_id) {
		this.receiverId = receiver_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Message getMessageId() {
		return messageId;
	}
	public void setMessageId(Message messageId) {
		this.messageId = messageId;
	}
	
	
}