package school.service.implementation;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ConversationDao;
import school.dao.MessageDao;
import school.dao.UserDao;
import school.dto.MessageDto;
import school.model.Conversation;
import school.model.Message;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;

@Service
public class MessagesServiceImpl implements MessagesService {

	@Autowired
	private MessageDao messageDao;

	@Autowired
	private ConversationDao conversationDao;
	
	@Autowired
	private ConversationService conversationService;

	@Autowired
	private UserDao userDao;

	@Transactional
	public List<Message> findMessagesOfConversation(long conversationId,
			long userId) {
		Conversation conversation = conversationDao.findById(conversationId);
		if (conversation.getReceiverId().getId() == userId) {
			return messageDao.findReceiversMessagesOfConversation(conversation);
		} else {
			return messageDao.findSendersMessagesOfConversation(conversation);
		}

	}

	@Transactional
	public void createNewMessage(Conversation conversation, String text) {
		Message message = new Message();
		message.setDateTime(new Date());
		message.setDeletedReceiver(false);
		message.setDeletedSender(false);
		message.setFromSender(true);
		message.setRead(false);
		message.setText(text);
		message.setConversationId(conversation);
		
		messageDao.save(message);
	}
	
	@Transactional
	public void replyMessage(Conversation conversation, String text, long principalId) {
		Message message = new Message();
		message.setRead(false);
		message.setDateTime(new Date());
		message.setConversationId(conversation);
		message.setDeletedReceiver(false);
		message.setDeletedSender(false);
		message.setText(text);
		
		if (conversation.getReceiverId().getId() == principalId) {
			message.setFromSender(false);
			conversation.setAnsweredReceiver(true);
			conversation.setDeletedSender(false);
		} else {
			message.setFromSender(true);
			conversation.setAnsweredSender(true);
			conversation.setDeletedReceiver(false);
		}
		
		messageDao.save(message);
	}

	@Transactional
	public List<MessageDto> constructMessagesDto(List<Message> messages,
			long receiverId, long senderId) {
		List<MessageDto> dtos = new ArrayList<MessageDto>();
		List<String> names = getNames(messages, receiverId, senderId);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		for (int i = 0; i < messages.size(); i++) {
			MessageDto dto = new MessageDto();
			dto.setId(String.valueOf(messages.get(i).getId()));
			dto.setDateTime(dateFormat.format(messages.get(i).getDateTime()));
			dto.setName(names.get(i));
			dto.setText(messages.get(i).getText());
			dtos.add(dto);
		}
		return dtos;
	}

	@Transactional
	public List<String> getNames(List<Message> messages, long receiverId,
			long senderId) {
		List<String> names = new ArrayList<String>();
		for (Message m : messages) {
			if (m.isFromSender() == true) {
				User sender = userDao.findById(senderId);
				names.add(sender.getFirstName() + " " + sender.getLastName());
			} else {
				User receiver = userDao.findById(receiverId);
				names.add(receiver.getFirstName() + " "
						+ receiver.getLastName());
			}
		}
		return names;
	}

	@Transactional
	public void deleteMessages(String[] ids, long id) {
		Conversation conversation = messageDao.findById(Long.valueOf(ids[0]))
				.getConversationId();
		if (conversation.getReceiverId().getId() == id) {
			for (String s : ids) {
				Message message = messageDao.findById(Long.valueOf(s));
				message.setDeletedReceiver(true);
				int size = messageDao.findReceiversMessagesOfConversation(
						conversation).size();
				if (size == 0) {
					conversation.setDeletedReceiver(true);
					conversation.setAnsweredReceiver(false);
				}
			}
		} else {
			for (String s : ids) {
				Message message = messageDao.findById(Long.valueOf(s));
				message.setDeletedSender(true);
				int size = messageDao.findSendersMessagesOfConversation(
						conversation).size();
				if (size == 0) {
					conversation.setDeletedSender(true);
					conversation.setAnsweredSender(false);
				}
			}
		}
	}

	@Override
	public Message findById(long repliedMessageId) {
		return messageDao.findById(repliedMessageId);
	}
}
