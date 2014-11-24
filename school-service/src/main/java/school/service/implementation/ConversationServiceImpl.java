package school.service.implementation;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ConversationDao;
import school.dao.UserDao;
import school.dto.message.ConversationDto;
import school.model.Conversation;
import school.model.Message;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;
import school.service.utils.ConversationsUtils;

@Service
public class ConversationServiceImpl implements ConversationService {

	@Autowired
	private ConversationDao conversationDao;

	@Autowired
	private MessagesService messagesService;

	@Autowired
	private UserDao userDao;
	private User user;
	private ConversationsUtils conversationsUtils = new ConversationsUtils();

	@Transactional
	public List<Conversation> findInbox(long id) {
		User user = userDao.findById(id);
		List<Conversation> list = conversationDao.findInboxConversations(user);
		return list;
	}

	@Transactional
	public List<Conversation> findSent(long id) {
		User user = userDao.findById(id);
		List<Conversation> list = conversationDao.findSentConversations(user);
		return list;
	}

	@Transactional
	public List<Date> getDates(List<Conversation> conversations, long id) {

		List<Date> dates = new ArrayList<Date>();
		Date date;
		for (Conversation c : conversations) {
			if (c.getReceiverId().getId() == id) {
				date = conversationDao.findDateForReceiversConversation(c);
				if (date != null) {
					dates.add(date);
				}
			} else {
				date = conversationDao.findDateForSendersConversation(c);
				if (date != null) {
					dates.add(date);
				}
			}
		}
		return dates;
	}

	@Transactional
	public void deleteConversations(String[] ids, long id) {
		for (String s : ids) {
			Conversation conversation = conversationDao.findById(Long
					.valueOf(s));
			if (conversation.getReceiverId().getId() == id) {
				conversation.setDeletedReceiver(true);
				conversation.setAnsweredReceiver(false);
				for (Message m : conversation.getMessages()) {
					m.setDeletedReceiver(true);
				}
			} else {
				conversation.setDeletedSender(true);
				conversation.setAnsweredSender(false);
				for (Message m : conversation.getMessages()) {
					m.setDeletedSender(true);
				}
			}
		}
	}

	@Transactional
	public List<ConversationDto> constructInboxConversationsDto(
			List<Conversation> conversations, long id, Locale loc) {
		List<ConversationDto> dtos = new ArrayList<ConversationDto>();
		List<Date> dates = getDates(conversations, id);
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.MEDIUM,
				loc);

		conversationsUtils.sortConversations(conversations, dates);

		List<String> fNames = getFirstNames(conversations);
		List<String> lNames = getLastNames(conversations);
		for (int i = 0; i < conversations.size(); i++) {
			ConversationDto dto = new ConversationDto();
			dto.setSubject(conversations.get(i).getSubject());
			dto.setId(String.valueOf(conversations.get(i).getId()));
			String date = dateFormat.format(dates.get(i));
			dto.setDate(date);
			dto.setFirstName(fNames.get(i));
			dto.setLastName(lNames.get(i));
			dto.setHasNewMessages(hasNewMessages(conversations.get(i), id));
			dtos.add(dto);
		}
		return dtos;
	}

	@Transactional
	public List<ConversationDto> constructSentConversationsDto(
			List<Conversation> conversations, long id, Locale loc) {
		List<ConversationDto> dtos = new ArrayList<ConversationDto>();
		List<Date> dates = getDates(conversations, id);
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.MEDIUM,
				loc);

		conversationsUtils.sortConversations(conversations, dates);

		List<String> fNames = getFirstNames(conversations);
		List<String> lNames = getLastNames(conversations);
		for (int i = 0; i < conversations.size(); i++) {
			ConversationDto dto = new ConversationDto();
			dto.setSubject(conversations.get(i).getSubject());
			dto.setId(String.valueOf(conversations.get(i).getId()));
			String date = dateFormat.format(dates.get(i));
			dto.setDate(date);
			dto.setFirstName(fNames.get(i));
			dto.setLastName(lNames.get(i));
			dto.setHasNewMessages(hasNewMessages(conversations.get(i), id));
			dtos.add(dto);
		}
		return dtos;
	}

	@Transactional
	public List<String> getFirstNames(List<Conversation> conversations) {

		List<String> names = new ArrayList<String>();

		for (Conversation c : conversations) {
			Long id = c.getSenderId().getId();
			user = userDao.findById(id);
			String name = user.getFirstName();
			names.add(name);
		}
		return names;
	}

	@Transactional
	public List<String> getLastNames(List<Conversation> conversations) {

		List<String> names = new ArrayList<String>();

		for (Conversation c : conversations) {
			Long id = c.getSenderId().getId();
			user = userDao.findById(id);
			String name = user.getLastName();
			names.add(name);
		}
		return names;
	}

	@Override
	public Conversation findById(long id) {
		return conversationDao.findById(id);
	}

	@Override
	public void createConversation(String subject, long sender, long receiver, String text) {
		Conversation conversation = new Conversation();
		conversation.setSubject(subject);
		conversation.setAnsweredReceiver(false);
		conversation.setAnsweredSender(true);
		conversation.setDeletedReceiver(false);
		conversation.setDeletedSender(false);
		User userReceiver = userDao.findById(receiver);
		conversation.setReceiverId(userReceiver);
		User userSender = userDao.findById(sender);
		conversation.setSenderId(userSender);

		conversationDao.save(conversation);

		messagesService.createNewMessage(conversation, text);
	}

	@Override
	public boolean hasNewMessages(Conversation conversation, long userId) {
		List<Message> messages = messagesService.findMessagesOfConversation(
				conversation.getId(), userId);
		for (Message m : messages) {
			if (conversation.getReceiverId().getId() == userId) {
				if (!m.isReadReceiver() && m.isFromSender()) {
					return true;
				}
			} else {
				if (!m.isReadSender() && !m.isFromSender()) {
					return true;
				}
			}
		}
		return false;
	}
}
