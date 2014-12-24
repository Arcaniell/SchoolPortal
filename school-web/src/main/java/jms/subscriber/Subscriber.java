package jms.subscriber;

import java.util.Date;
import java.util.List;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import javax.jms.Topic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;

import school.dao.ConversationDao;
import school.dao.GroupDao;
import school.dao.MessageDao;
import school.dao.UserDao;
import school.model.Conversation;
import school.model.User;
import school.service.MessagesService;
import school.service.utils.ConversationUtils;

public class Subscriber implements MessageListener {

	public JmsTemplate jmsTemplate;
	public Topic topic;

	@Autowired
	private ConversationDao conversationDao;
	@Autowired
	private MessagesService messagesService;
	private User principal;
	@Autowired
	private GroupDao groupDao;
	private boolean isReply;
	private Conversation conversation;
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private UserDao userDao;

	@Override
	public void onMessage(Message msg) {

		try {
			isReply = msg.getBooleanProperty("isReply");
		} catch (JMSException e1) {
			e1.printStackTrace();
		}
		if (!isReply) {

			try {
				String subject = msg.getStringProperty("subject");
				String sender = msg.getStringProperty("sender");
				String group = msg.getStringProperty("group");
				Integer hashCode = msg.getIntProperty("hashCode");
				String text = ((TextMessage) msg).getText();

				User senderUser = userDao.findById(Long.valueOf(sender));

				if (principal.getId() != Long.valueOf(sender)) {

					Conversation conversation = new Conversation(senderUser,
							principal, subject, false, true, false, false,
							true, false, "From: " + senderUser.getFirstName()
									+ " " + senderUser.getLastName(), "To: "
									+ group, hashCode, -1);

					conversationDao.save(conversation);
					messagesService.createNewMessage(conversation, text);
				}

			} catch (JMSException e) {
				e.printStackTrace();
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		} else {
			try {
				Integer hashCode = msg.getIntProperty("hashCode");
				String replyText = ((TextMessage) msg).getText();
				String conversationId = msg.getStringProperty("conversation");
				
				conversation = conversationDao.findById(Long.valueOf(
						conversationId).longValue());

				List<Conversation> sentConversationsOfSender = conversationDao
						.findInboxConversations(principal);
				Conversation receiverConversation = null;
				for (Conversation c : sentConversationsOfSender) {
					if (c.getCountOfReceivers() == -1
							&& c.getHashCode().equals(hashCode)) {
						receiverConversation = c;
					}
				}

				school.model.Message receiverMessage = new school.model.Message(
						receiverConversation, true, replyText, new Date(), false,
						false);
				ConversationUtils.markSendersConversationAsNew(conversation);
				receiverMessage.setReadReceiver(false);

				messageDao.save(receiverMessage);
				
			} catch (JMSException e) {
				e.printStackTrace();
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} 
		}
	}

	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public User getPrincipal() {
		return principal;
	}

	public void setPrincipal(User principal) {
		this.principal = principal;
	}

	public boolean isReply() {
		return isReply;
	}

	public void setReply(boolean isReply) {
		this.isReply = isReply;
	}

	public Conversation getConversation() {
		return conversation;
	}

	public void setConversation(Conversation conversation) {
		this.conversation = conversation;
	}
}
