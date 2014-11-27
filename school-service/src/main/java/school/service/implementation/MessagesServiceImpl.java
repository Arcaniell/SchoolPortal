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
import school.dto.message.EmailObjectDTO;
import school.dto.message.MessageDto;
import school.dto.message.NewMessagesObjectDTO;
import school.model.Conversation;
import school.model.Message;
import school.model.Role;
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
		message.setReadSender(true);
		message.setReadReceiver(false);
		message.setText(text);
		message.setConversationId(conversation);

		messageDao.save(message);
	}

	@Transactional
	public void replyMessage(Conversation conversation, String text,
			long principalId) {
		Message message = new Message();
		message.setDateTime(new Date());
		message.setConversationId(conversation);
		message.setDeletedReceiver(false);
		message.setDeletedSender(false);
		message.setText(text);

		if (conversation.getReceiverId().getId() == principalId) {
			message.setFromSender(false);
			conversation.setAnsweredReceiver(true);
			conversation.setDeletedSender(false);
			message.setReadSender(false);
		} else {
			message.setFromSender(true);
			conversation.setAnsweredSender(true);
			conversation.setDeletedReceiver(false);
			message.setReadReceiver(false);
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
			if (messages.get(i).isFromSender()) {
				dto.setUserId(senderId);
			} else {
				dto.setUserId(receiverId);
			}
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
	public void deleteMessage(long messageId, long id) {
		Conversation conversation = messageDao.findById(messageId)
				.getConversationId();
		if (conversation.getReceiverId().getId() == id) {
			Message message = messageDao.findById(messageId);
			message.setDeletedReceiver(true);
			int size = messageDao.findReceiversMessagesOfConversation(
					conversation).size();
			if (size == 0) {
				conversation.setDeletedReceiver(true);
				conversation.setAnsweredReceiver(false);
			}
		} else {
			Message message = messageDao.findById(messageId);
			message.setDeletedSender(true);
			int size = messageDao.findSendersMessagesOfConversation(
					conversation).size();
			if (size == 0) {
				conversation.setDeletedSender(true);
				conversation.setAnsweredSender(false);
			}
		}
	}

	@Override
	public Message findById(long repliedMessageId) {
		return messageDao.findById(repliedMessageId);
	}

	@Override
	public void markAsRead(List<Message> messages, long principalId) {

		for (Message m : messages) {
			Conversation conversation = conversationDao.findById(m
					.getConversationId().getId());
			if (conversation.getReceiverId().getId() == principalId) {
				m.setReadReceiver(true);
			} else {
				m.setReadSender(true);
			}
		}
	}

	@Override
	public int countOfNewMessages(long userId) {
		User user = userDao.findById(userId);
		List<Conversation> conversations = conversationDao
				.findInboxConversations(user);
		int count = 0;
		if (conversations.size() != 0) {
			List<Message> messageList = messageDao
					.countOfNewMessages(conversations);
			for (Message m : messageList) {
				Conversation conversation = conversationDao.findById(m
						.getConversationId().getId());
				if (conversation.getReceiverId().getId() == userId
						&& !m.isReadReceiver() && !m.isDeletedReceiver()) {
					count++;
				} else if (conversation.getSenderId().getId() == userId
						&& !m.isReadSender() && !m.isDeletedSender()) {
					count++;
				}
			}
		}
		return count;
	}

	@Override
	public List<User> simulateSearchResult(String tagName, boolean isParent) {
		List<User> result = new ArrayList<User>();
		List<User> users = userDao.findAll();
		for (User u : users) {
			for (Role r : u.getRoles()) {
				if (isParent
						&& r.getName().equals("ROLE_TEACHER")
						&& (u.getLastName().contains(tagName)
								|| u.getFirstName().contains(tagName) || u
								.getEmail().contains(tagName))) {
					result.add(u);
				} else if (!isParent
						&& r.getName().equals("ROLE_PARENT")
						&& (u.getLastName().contains(tagName)
								|| u.getFirstName().contains(tagName) || u
								.getEmail().contains(tagName))) {
					result.add(u);
				}
			}
		}
		return result;
	}

	@Override
	public List<EmailObjectDTO> contructEmailObjectDTO(List<User> users) {
		List<EmailObjectDTO> emailObjectDTOs = new ArrayList<EmailObjectDTO>();
		for (User u : users) {
			EmailObjectDTO emailObjectDTO = new EmailObjectDTO();
			emailObjectDTO.setNameAndEmail(u.getFirstName() + " "
					+ u.getLastName() + " - " + u.getEmail());
			emailObjectDTOs.add(emailObjectDTO);
		}
		return emailObjectDTOs;
	}

	@Override
	public NewMessagesObjectDTO constructNewMessagesObjectDTO(Long userId) {
		NewMessagesObjectDTO newMessagesObjectDTO = new NewMessagesObjectDTO();
		newMessagesObjectDTO.setNewMessages(String.valueOf(countOfNewMessages(userId)));
		return newMessagesObjectDTO;
	}
}
