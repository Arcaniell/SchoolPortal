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
import javax.persistence.Table;

@Entity
@Table(name = "MESSAGE")
//@NamedQueries ({@NamedQuery (name = "FIND_BY_RECEIVER", query = "from Message as m where m.receiver = :receiver"),  
//@NamedQuery (name = "FIND_BY_SENDER", query = "from Message as m where m.sender = :sender")})
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@ManyToOne
	@JoinColumn(nullable = false, name = "senderId")
	private User senderId;

	@ManyToOne
	@JoinColumn(nullable = false, name = "receiverId")
	private User receiverId;

	@Lob
	@Column(nullable = false)
	private String text;

	@Column(nullable = false)
	private Date date;
	
	@Column(nullable = false)
	private boolean isRead;

/*	@OneToOne
	@JoinColumn(name = "messageId")
	private Message messageId;*/
	
	public static final String SELECT_ALL_MESSAGES_BY_RECEIVERID = "from Message as m where m.receiverId = :receiverId";
	public static final String SELECT_ALL_MESSAGES_BY_SENDERID = "from Message as m where m.senderId = :senderId";
	public static final String SELECT_DISTINCT_SENDERS_FOR_RECEIVER = "select distinct senderId from Message as m where m.receiverId = :receiverId";
	public static final String SELECT_ALL_MESSAGES_WITH_USERS = "from Message as m where m.receiverId in (:users) and m.senderId in (:users)";
	public static final String GET_COUNT_OF_LETTERS_WITH_USERS = "SELECT COUNT(m) FROM Message m where m.receiverId in (:users) and m.sender in (:users)";
	public static final String GET_COUNT_OF_NEW_LETTERS_WITH_USERS = "SELECT COUNT(m) FROM Message m where m.receiverId in (:users) and m.sender in (:users) and m.isRead = true";
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public User getSenderId() {
		return senderId;
	}
	public void setSenderId(User senderId) {
		this.senderId = senderId;
	}
	public User getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(User receiverId) {
		this.receiverId = receiverId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public boolean isRead() {
		return isRead;
	}
	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + (isRead ? 1231 : 1237);
		result = prime * result
				+ ((receiverId == null) ? 0 : receiverId.hashCode());
		result = prime * result
				+ ((senderId == null) ? 0 : senderId.hashCode());
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
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (id != other.id)
			return false;
		if (isRead != other.isRead)
			return false;
		if (receiverId == null) {
			if (other.receiverId != null)
				return false;
		} else if (!receiverId.equals(other.receiverId))
			return false;
		if (senderId == null) {
			if (other.senderId != null)
				return false;
		} else if (!senderId.equals(other.senderId))
			return false;
		if (text == null) {
			if (other.text != null)
				return false;
		} else if (!text.equals(other.text))
			return false;
		return true;
	}
	
	
}