package school.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "MESSAGE")
@NamedQueries({
	@NamedQuery(name = "Message.FIND_RECEIVERS_MESSAGES", query = "SELECT m from Message m "
			+ "where m.conversationId = :conversation "
			+ "and m.isDeletedReceiver = false order by m.dateTime asc"),
	@NamedQuery(name = "Message.FIND_SENDERS_MESSAGES", query = "SELECT m from Message m "
			+ "where m.conversationId = :conversation "
			+ "and m.isDeletedSender = false order by m.dateTime asc"),
	@NamedQuery(name = "Message.FIND_NEW_MESSAGES", query = "SELECT m from Message m "
			+ "where m.conversationId IN (:conversations)") })
public class Message {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@ManyToOne
	@JoinColumn(name = "conversationId", nullable = false)
	private Conversation conversationId;

	@Column(nullable = false)
	private boolean isFromSender;

	@Lob
	private String text;

	@Column(nullable = false)
	private Date dateTime;

	@Column(nullable = false)
	private boolean isReadReceiver;
	
	@Column(nullable = false)
	private boolean isReadSender;

	@Column(nullable = false)
	private boolean isDeletedReceiver;

	@Column(nullable = false)
	private boolean isDeletedSender;
	
	public Message() {
	}

	public Message(Conversation conversationId, boolean isFromSender,
			String text, Date dateTime, boolean isReadReceiver,
			boolean isReadSender, boolean isDeletedReceiver,
			boolean isDeletedSender) {
		this.conversationId = conversationId;
		this.isFromSender = isFromSender;
		this.text = text;
		this.dateTime = dateTime;
		this.isReadReceiver = isReadReceiver;
		this.isReadSender = isReadSender;
		this.isDeletedReceiver = isDeletedReceiver;
		this.isDeletedSender = isDeletedSender;
	}
	
	public Message(Conversation conversationId,
			String text, Date dateTime, boolean isDeletedReceiver,
			boolean isDeletedSender) {
		this.conversationId = conversationId;
		this.text = text;
		this.dateTime = dateTime;
		this.isDeletedReceiver = isDeletedReceiver;
		this.isDeletedSender = isDeletedSender;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Conversation getConversationId() {
		return conversationId;
	}

	public void setConversationId(Conversation conversationId) {
		this.conversationId = conversationId;
	}

	public boolean isFromSender() {
		return isFromSender;
	}

	public void setFromSender(boolean isFromSender) {
		this.isFromSender = isFromSender;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public boolean isReadReceiver() {
		return isReadReceiver;
	}

	public void setReadReceiver(boolean isReadReceiver) {
		this.isReadReceiver = isReadReceiver;
	}

	public boolean isReadSender() {
		return isReadSender;
	}

	public void setReadSender(boolean isReadSender) {
		this.isReadSender = isReadSender;
	}

	public boolean isDeletedReceiver() {
		return isDeletedReceiver;
	}

	public void setDeletedReceiver(boolean isDeletedReceiver) {
		this.isDeletedReceiver = isDeletedReceiver;
	}

	public boolean isDeletedSender() {
		return isDeletedSender;
	}

	public void setDeletedSender(boolean isDeletedSender) {
		this.isDeletedSender = isDeletedSender;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((conversationId == null) ? 0 : conversationId.hashCode());
		result = prime * result
				+ ((dateTime == null) ? 0 : dateTime.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + (isDeletedReceiver ? 1231 : 1237);
		result = prime * result + (isDeletedSender ? 1231 : 1237);
		result = prime * result + (isFromSender ? 1231 : 1237);
		result = prime * result + (isReadReceiver ? 1231 : 1237);
		result = prime * result + (isReadSender ? 1231 : 1237);
		result = prime * result + ((text == null) ? 0 : text.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Message other = (Message) obj;
		if (conversationId == null) {
			if (other.conversationId != null)
				return false;
		} else if (!conversationId.equals(other.conversationId))
			return false;
		if (dateTime == null) {
			if (other.dateTime != null)
				return false;
		} else if (!dateTime.equals(other.dateTime))
			return false;
		if (id != other.id)
			return false;
		if (isDeletedReceiver != other.isDeletedReceiver)
			return false;
		if (isDeletedSender != other.isDeletedSender)
			return false;
		if (isFromSender != other.isFromSender)
			return false;
		if (isReadReceiver != other.isReadReceiver)
			return false;
		if (isReadSender != other.isReadSender)
			return false;
		if (text == null) {
			if (other.text != null)
				return false;
		} else if (!text.equals(other.text))
			return false;
		return true;
	}
}