package school.service.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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
import school.model.Parent;
import school.model.User;
import school.service.ConversationService;
import school.service.MessagesService;
import school.service.ParentService;
import school.service.utils.ConversationUtils;
import school.service.utils.DateUtil;

@Service
public class ConversationServiceImpl implements ConversationService {

	@Autowired
	private ConversationDao conversationDao;

	@Autowired
	private MessagesService messagesService;

	@Autowired
	private UserDao userDao;
	private User user;

	@Autowired
	private ParentService parentService;

	@Transactional
	@Override
	public List<Conversation> findConversations(long userId, String inboxOrSent) {
		User user = userDao.findById(userId);
		if (inboxOrSent.equals("inbox")) {
			return ConversationUtils.removeDoubledConversations(conversationDao
					.findInboxConversations(user));
		} else {
			return ConversationUtils.removeDoubledConversations(conversationDao
					.findSentConversations(user));
		}
	}

	@Transactional
	@Override
	public List<Date> getDates(List<Conversation> conversations, long userId) {
		List<Date> dates = new ArrayList<Date>();
		Date date;
		for (Conversation c : conversations) {
			if (c.getReceiverId().getId() == userId) {
				date = conversationDao.findDateForReceiversConversation(c);
				if (date != null)
					dates.add(date);
			} else {
				date = conversationDao.findDateForSendersConversation(c);
				if (date != null)
					dates.add(date);
			}
		}
		return dates;
	}

	@Transactional
	@Override
	public void deleteConversations(String[] ids, long id) {
		for (String s : ids) {
			Conversation conversation = conversationDao.findById(Long
					.valueOf(s));
			ConversationUtils.deleteConversation(conversation, id);
		}
	}

	@Override
	public List<ConversationDto> constructConversationDto(
			List<Conversation> conversations, long id, Locale loc) {
		/* Get dates of conversations */
		List<Date> dates = getDates(conversations, id);
		/* Sort conversations by date */
		ConversationUtils.sortConversations(conversations, dates);
		/* Get names of conversations */
		List<String> names = getNames(conversations);
		/* Construct dtos */
		List<ConversationDto> dtos = new ArrayList<ConversationDto>();
		String inboxCount = String.valueOf(findConversations(id, "inbox")
				.size());
		String sentCount = String.valueOf(findConversations(id, "sent").size());
		for (int i = 0; i < conversations.size(); i++) {
			int countOfReceivers = conversations.get(i).getCountOfReceivers();
			ConversationDto dto = new ConversationDto(
					countOfReceivers > 1 ? names.get(i) + " ("
							+ countOfReceivers + ")" : names.get(i),
					conversations.get(i).getSubject(),
					DateUtil.getFormattedDate(dates.get(i), DateUtil.MEDIUM,
							loc), String.valueOf(conversations.get(i).getId()),
					hasNewMessages(conversations.get(i), id), inboxCount,
					sentCount);

			dtos.add(dto);
		}
		if (conversations.size() == 0)
			dtos.add(new ConversationDto(inboxCount, sentCount));
		return dtos;
	}

	@Transactional
	@Override
	public List<String> getNames(List<Conversation> conversations) {
		List<String> names = new ArrayList<String>();
		for (Conversation c : conversations) {
			Long id = c.getSenderId().getId();
			user = userDao.findById(id);
			String name = user.getFirstName() + " " + user.getLastName();
			names.add(name);
		}
		return names;
	}

	@Transactional
	@Override
	public Conversation findById(long id) {
		return conversationDao.findById(id);
	}

	@Transactional
	@Override
	public void createConversation(String subject, long sender, long receiver,
			String text) {
		Conversation conversation = new Conversation(userDao.findById(sender),
				userDao.findById(receiver), subject, false, true, false, false,
				1);
		conversationDao.save(conversation);
		messagesService.createNewMessage(conversation, text);
	}

	@Transactional
	@Override
	public boolean hasNewMessages(Conversation conversation, long userId) {
		List<Message> messages = messagesService.findMessagesOfConversation(
				conversation, userId);

		for (Message m : messages) {
			if (conversation.getReceiverId().getId() == userId) {
				if (!m.isReadReceiver() && m.isFromSender()) {
					return true;
				}
			} else {
				if (!m.isReadSender() && !m.isFromSender()) {
					if ((!m.isReadReceiver() && m.isFromSender())
							|| (!m.isReadSender() && !m.isFromSender())) {
						return true;
					}
				}
			}
		}
		return false;
	}

	@Override
	public boolean isGroup(String to) {
		String[] splitted = to.split(" ");
		if (splitted[1].equals("-")) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void sendToGroup(String subject, Long principalId, String group,
			String text) {
		User sender = userDao.findById(principalId);
		List<Parent> parents = parentService.getAllParentsOfGroup(group);
		Conversation conversation;
		int counter = 0;
		for (Parent p : parents) {
			conversation = new Conversation(sender, p.getUserId(), subject,
					false, true, false, false, counter == 0 ? parents.size()
							: -1);
			counter++;
			conversationDao.save(conversation);
			messagesService.createNewMessage(conversation, text);
		}
	}
}
