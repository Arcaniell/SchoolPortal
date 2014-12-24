package school.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CONVERSATION")
@NamedQueries({
		@NamedQuery(name = "Conversation.INBOX_CONVERSATIONS", query = "SELECT c FROM Conversation c where (c.senderId = :user and "
				+ "c.isAnsweredReceiver = true and c.isDeletedSender = false) or"
				+ " (c.receiverId = :user and c.isDeletedReceiver = false) "
				+ "or (c.senderId = :user and c.isDeletedReceiver = true and c.isDeletedSender = false) or "
				+ "(c.senderId = :user and ((SELECT m from Message m where m.conversationId = c and "
				+ "m.isFromSender = false and m.isDeletedSender = false) is not null))"),

		@NamedQuery(name = "Conversation.SENT_CONVERSATIONS", query = "SELECT c FROM Conversation c where (c.senderId = :user and "
				+ "c.isAnsweredSender = true and c.isDeletedSender = false) or "
				+ "(c.receiverId = :user and c.isAnsweredReceiver = true and c.isDeletedReceiver = false)"),

		@NamedQuery(name = "Conversation.FIND_DATE_RECEIVER", query = "select max(m.dateTime) "
				+ "from Message m where m.conversationId = :conversation and m.isDeletedReceiver = false"),
		@NamedQuery(name = "Conversation.FIND_DATE_SENDER", query = "select max(m.dateTime) "
				+ "from Message m where m.conversationId = :conversation and m.isDeletedSender = false") })
public class Conversation {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@ManyToOne
	@JoinColumn(nullable = false, name = "senderId")
	private User senderId;

	@ManyToOne
	@JoinColumn(nullable = false, name = "receiverId")
	private User receiverId;

	@OneToMany(mappedBy = "conversationId")
	private List<Message> messages;

	@Column(nullable = false, length = 100)
	private String subject;
	private Integer hashCode;
	private Integer countOfReceivers;

	@Column(nullable = false)
	private boolean isAnsweredReceiver;

	@Column(nullable = false)
	private boolean isAnsweredSender;

	@Column(nullable = false)
	private boolean isDeletedReceiver;

	@Column(nullable = false)
	private boolean isDeletedSender;

	@Column(nullable = false)
	private boolean isNewForReceiver;

	@Column(nullable = false)
	private boolean isNewForSender;

	@Column(nullable = false)
	private String outcomeName;

	@Column(nullable = false)
	private String incomeName;

	public Conversation() {
	}

	public Conversation(User senderId, User receiverId, String subject,
			boolean isAnsweredReceiver, boolean isAnsweredSender,
			boolean isDeletedReceiver, boolean isDeletedSender,
			boolean isNewForReceiver, boolean isNewForSender,
			String incomeName, String outcomeName) {
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.subject = subject;
		this.isAnsweredReceiver = isAnsweredReceiver;
		this.isAnsweredSender = isAnsweredSender;
		this.isDeletedReceiver = isDeletedReceiver;
		this.isDeletedSender = isDeletedSender;
		this.isNewForReceiver = isNewForReceiver;
		this.isNewForSender = isNewForSender;
		this.incomeName = incomeName;
		this.outcomeName = outcomeName;
	}

	public Conversation(User senderId, User receiverId, String subject,
			boolean isAnsweredReceiver, boolean isAnsweredSender,
			boolean isDeletedReceiver, boolean isDeletedSender,
			boolean isNewForReceiver, boolean isNewForSender,
			String incomeName, String outcomeName, int hashCode, int countOfReceivers) {
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.subject = subject;
		this.isAnsweredReceiver = isAnsweredReceiver;
		this.isAnsweredSender = isAnsweredSender;
		this.isDeletedReceiver = isDeletedReceiver;
		this.isDeletedSender = isDeletedSender;
		this.isNewForReceiver = isNewForReceiver;
		this.isNewForSender = isNewForSender;
		this.incomeName = incomeName;
		this.outcomeName = outcomeName;
		this.hashCode = hashCode;
		this.countOfReceivers = countOfReceivers;
	}

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

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public boolean isAnsweredReceiver() {
		return isAnsweredReceiver;
	}

	public void setAnsweredReceiver(boolean isAnsweredReceiver) {
		this.isAnsweredReceiver = isAnsweredReceiver;
	}

	public boolean isAnsweredSender() {
		return isAnsweredSender;
	}

	public void setAnsweredSender(boolean isAnsweredSender) {
		this.isAnsweredSender = isAnsweredSender;
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

	public boolean isNewForReceiver() {
		return isNewForReceiver;
	}

	public void setNewForReceiver(boolean isNewForReceiver) {
		this.isNewForReceiver = isNewForReceiver;
	}

	public boolean isNewForSender() {
		return isNewForSender;
	}

	public void setNewForSender(boolean isNewForSender) {
		this.isNewForSender = isNewForSender;
	}

	public String getOutcomeName() {
		return outcomeName;
	}

	public void setOutcomeName(String outcomeName) {
		this.outcomeName = outcomeName;
	}

	public String getIncomeName() {
		return incomeName;
	}

	public void setIncomeName(String incomeName) {
		this.incomeName = incomeName;
	}
	
	public Integer getHashCode() {
		return hashCode;
	}

	public void setHashCode(Integer hashCode) {
		this.hashCode = hashCode;
	}

	public Integer getCountOfReceivers() {
		return countOfReceivers;
	}

	public void setCountOfReceivers(Integer countOfReceivers) {
		this.countOfReceivers = countOfReceivers;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + hashCode;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result
				+ ((incomeName == null) ? 0 : incomeName.hashCode());
		result = prime * result + (isAnsweredReceiver ? 1231 : 1237);
		result = prime * result + (isAnsweredSender ? 1231 : 1237);
		result = prime * result + (isDeletedReceiver ? 1231 : 1237);
		result = prime * result + (isDeletedSender ? 1231 : 1237);
		result = prime * result + (isNewForReceiver ? 1231 : 1237);
		result = prime * result + (isNewForSender ? 1231 : 1237);
		result = prime * result
				+ ((messages == null) ? 0 : messages.hashCode());
		result = prime * result
				+ ((outcomeName == null) ? 0 : outcomeName.hashCode());
		result = prime * result
				+ ((receiverId == null) ? 0 : receiverId.hashCode());
		result = prime * result
				+ ((senderId == null) ? 0 : senderId.hashCode());
		result = prime * result + ((subject == null) ? 0 : subject.hashCode());
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
		Conversation other = (Conversation) obj;
		if (hashCode != other.hashCode)
			return false;
		if (id != other.id)
			return false;
		if (incomeName == null) {
			if (other.incomeName != null)
				return false;
		} else if (!incomeName.equals(other.incomeName))
			return false;
		if (isAnsweredReceiver != other.isAnsweredReceiver)
			return false;
		if (isAnsweredSender != other.isAnsweredSender)
			return false;
		if (isDeletedReceiver != other.isDeletedReceiver)
			return false;
		if (isDeletedSender != other.isDeletedSender)
			return false;
		if (isNewForReceiver != other.isNewForReceiver)
			return false;
		if (isNewForSender != other.isNewForSender)
			return false;
		if (messages == null) {
			if (other.messages != null)
				return false;
		} else if (!messages.equals(other.messages))
			return false;
		if (outcomeName == null) {
			if (other.outcomeName != null)
				return false;
		} else if (!outcomeName.equals(other.outcomeName))
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
		if (subject == null) {
			if (other.subject != null)
				return false;
		} else if (!subject.equals(other.subject))
			return false;
		return true;
	}
}