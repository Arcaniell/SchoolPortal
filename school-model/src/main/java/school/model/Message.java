package school.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Message {
	@Id
	@GeneratedValue (strategy=GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	@JoinColumn(name="sender")
	private User sender;
	@ManyToOne
	@JoinColumn(name="receiver")
	private User receiver;
	@Lob
	private String message;
	private Date date;
	@OneToOne (fetch=FetchType.LAZY)
	@JoinColumn (name = "messageId")
	private Message messageId;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
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