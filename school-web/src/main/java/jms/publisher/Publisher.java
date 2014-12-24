package jms.publisher;

import java.util.Date;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import school.model.Conversation;

public class Publisher {

	private JmsTemplate jmsTemplate;
	private Long senderId;
	private String group;
	private String subject;
	private Date date = new Date();
	private boolean isReply;
	private int hashCode;
	private Conversation conversation;

	public void sendMessage(String message) {

		final String msg = message;

		jmsTemplate.send(new MessageCreator() {

			@Override
			public Message createMessage(Session session) throws JMSException {
				TextMessage textMessage = session.createTextMessage();
				if (isReply) {
					textMessage.setStringProperty("group", group);
					textMessage.setBooleanProperty("isReply", true);
					textMessage.setIntProperty("hashCode", hashCode);
					textMessage.setStringProperty("conversation",
							String.valueOf(conversation.getId()));
					textMessage.setText(msg);
				} else {
					textMessage.setStringProperty("sender",
							String.valueOf(senderId));
					textMessage.setStringProperty("subject", subject);
					textMessage.setStringProperty("group", group);
					textMessage.setIntProperty("hashCode", myHashCode());
					textMessage.setText(msg);
				}
				return textMessage;
			}
		});
	}

	public int myHashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result
				+ ((senderId == null) ? 0 : senderId.hashCode());
		result = prime * result + ((subject == null) ? 0 : subject.hashCode());
		return result;
	}

	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public Long getSenderId() {
		return senderId;
	}

	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isReply() {
		return isReply;
	}

	public void setReply(boolean isReply) {
		this.isReply = isReply;
	}

	public int getHashCode() {
		return hashCode;
	}

	public void setHashCode(int hashCode) {
		this.hashCode = hashCode;
	}

	public Conversation getConversation() {
		return conversation;
	}

	public void setConversation(Conversation conversation) {
		this.conversation = conversation;
	}
}
