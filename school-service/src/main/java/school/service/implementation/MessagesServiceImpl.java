package school.service.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ConversationDao;
import school.dao.GroupDao;
import school.dao.MessageDao;
import school.dao.ParentDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.dto.message.EmailObjectDTO;
import school.dto.message.MessageDto;
import school.dto.message.NewMessagesObjectDTO;
import school.model.Conversation;
import school.model.Group;
import school.model.Message;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;
import school.service.utils.ConversationUtils;
import school.service.utils.DateUtil;

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

	@Autowired
	private ParentDao parentDao;

	@Autowired
	private TeacherDao teacherDao;

	@Autowired
	private GroupDao groupDao;

	@Transactional
	@Override
	public List<Message> findMessagesOfConversation(Conversation conversation,
			long userId) {
		if (conversation.getReceiverId().getId() == userId) {
			return messageDao.findReceiversMessagesOfConversation(conversation);
		} else {
			return messageDao.findSendersMessagesOfConversation(conversation);
		}
	}

	@Transactional
	@Override
	public void createNewMessage(Conversation conversation, String text) {
		Message message = new Message(conversation, true, text, new Date(),
				false, true, false, false);
		messageDao.save(message);
	}

	@Transactional
	@Override
	public void replyMessage(Conversation conversation, String text,
			long principalId) {
		Message message;
		if (conversation.getReceiverId().getId() == principalId) {
			message = new Message(conversation, text, new Date(), false, false);
			message.setFromSender(false);
			conversation.setAnsweredReceiver(true);
			conversation.setDeletedSender(false);
			message.setReadSender(false);
		} else {
			message = new Message(conversation, text, new Date(), false, false);
			message.setFromSender(true);
			conversation.setAnsweredSender(true);
			conversation.setDeletedReceiver(false);
			message.setReadReceiver(false);
		}
		messageDao.save(message);
	}

	@Override
	public List<MessageDto> constructMessagesDto(List<Message> messages,
			long receiverId, long senderId, Locale loc) {
		List<MessageDto> dtos = new ArrayList<MessageDto>();
		List<String> names = getNames(messages, receiverId, senderId);
		for (int i = 0; i < messages.size(); i++) {
			MessageDto dto = new MessageDto(String.valueOf(messages.get(i)
					.getId()), names.get(i), DateUtil.getFormattedDate(messages
					.get(i).getDateTime(), DateUtil.MESSAGE_DATE_FORMAT, loc),
					messages.get(i).getText());
			if (messages.get(i).isFromSender()) {
				dto.setUserId(senderId);
			} else
				dto.setUserId(receiverId);
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
	@Override
	public void deleteMessage(long messageId, long id) {
		Message message = messageDao.findById(messageId);
		Conversation conversation = message.getConversationId();
		int receiversSize = messageDao.findReceiversMessagesOfConversation(
				conversation).size();
		int sendersSize = messageDao.findSendersMessagesOfConversation(
				conversation).size();
		ConversationUtils.deleteMessage(conversation, message, id,
				receiversSize, sendersSize);
	}

	@Transactional
	@Override
	public Message findById(long repliedMessageId) {
		return messageDao.findById(repliedMessageId);
	}

	@Transactional
	@Override
	public void markMessagesAsRead(List<Message> messages, long principalId) {
		for (Message m : messages) {
			Conversation conversation = m.getConversationId();
			if (conversation.getReceiverId().getId() == principalId) {
				m.setReadReceiver(true);
			} else {
				m.setReadSender(true);
			}
		}
	}

	@Transactional
	@Override
	public int countOfNewMessages(long userId) {
		User user = userDao.findById(userId);
		/* Find inboxConversations for user */
		List<Conversation> conversations = conversationDao
				.findInboxConversations(user);
		/* If inbox is not empty, count new messages */
		if (conversations.size() != 0) {
			List<Message> messageList = messageDao
					.getListOfMessages(conversations);
			return ConversationUtils.countOfNewMessagesForUser(messageList,
					userId);
		}
		return 0;
	}

	@Transactional
	@Override
	public List<Object> simulateSearchResult(String tagName, boolean isParent,
			String emailOrGroup) {

		List<Object> usersOrGroups = new ArrayList<Object>();
		if (isParent) {
			if (emailOrGroup.equals("Name or email")) {
				List<User> teachers = teacherDao.findAllUsers();
				for (User u : teachers) {
					if (ConversationUtils.userContainsLetter(u, tagName))
						usersOrGroups.add(u);
				}
			} else if (emailOrGroup.equals("Group")) {
				List<Group> groups = groupDao.findAll();
				for (Group g : groups) {
					if (ConversationUtils.groupContainsLetter(g, tagName)) {
						usersOrGroups.add(g);
					}
				}
			}

		} else {
			if (emailOrGroup.equals("Name or email")) {
				List<User> parents = parentDao.findAllUsers();
				for (User u : parents) {
					if (ConversationUtils.userContainsLetter(u, tagName))
						usersOrGroups.add(u);
				}
			} else {
				List<Group> groups = groupDao.findAll();
				
				for (Group g : groups) {
					if (ConversationUtils.groupContainsLetter(g, tagName)) {
						usersOrGroups.add(g);
					}
				}
			}
		}
		return usersOrGroups;
	}

	@Override
	public List<EmailObjectDTO> contructEmailObjectDTO(List<Object> usersOrGroups) {
		List<EmailObjectDTO> emailObjectDTOs = new ArrayList<EmailObjectDTO>();
		int id = 1;
		if(usersOrGroups.size() > 0) {
			if(usersOrGroups.get(0) instanceof User) {
				for (Object u : usersOrGroups) {
					emailObjectDTOs.add(new EmailObjectDTO(((User) u).getFirstName() + " "
							+ ((User) u).getLastName() + " - " + ((User) u).getEmail(), id));
					id++;
				}
			} else if(usersOrGroups.get(0) instanceof Group) {
				for (Object g : usersOrGroups) {
					emailObjectDTOs.add(new EmailObjectDTO(((Group) g).getNumber() + " - "
							+ ((Group) g).getLetter(), id));
					id++;
				}
			}
		}
		
		return emailObjectDTOs;
	}

	@Override
	public NewMessagesObjectDTO constructNewMessagesObjectDTO(Long userId) {
		return new NewMessagesObjectDTO(
				String.valueOf(countOfNewMessages(userId)));
	}
}
