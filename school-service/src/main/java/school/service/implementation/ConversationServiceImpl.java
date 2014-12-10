package school.service.implementation;

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
import school.model.Group;
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

	@Autowired
	private ParentService parentService;

	@Transactional
	@Override
	public List<Conversation> findConversations(long userId, String inboxOrSent) {
		User user = userDao.findById(userId);
		if (inboxOrSent.equals("inbox")) {
			return ConversationUtils.removeDoubledConversations(
					conversationDao.findInboxConversations(user), userId);
		} else {
			return ConversationUtils.removeDoubledConversations(
					conversationDao.findSentConversations(user), userId);
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
		/* Construct dtos */
		List<ConversationDto> dtos = new ArrayList<ConversationDto>();
		String inboxCount = String.valueOf(findConversations(id, "inbox")
				.size());
		String sentCount = String.valueOf(findConversations(id, "sent").size());
		
		for (int i = 0; i < conversations.size(); i++) {
			int countOfReceivers = conversations.get(i).getCountOfReceivers();

			ConversationDto dto = new ConversationDto(conversations.get(i)
					.getSubject(), DateUtil.getFormattedDate(dates.get(i),
					DateUtil.MEDIUM, loc), String.valueOf(conversations.get(i)
					.getId()), inboxCount, sentCount);

			if (conversations.get(i).getReceiverId().getId() == id) {
				dto.setName(conversations.get(i).getIncomeName());
				dto.setHasNewMessages(conversations.get(i).isNewForReceiver());
			} else {
				dto.setName(conversations.get(i).getOutcomeName()
						+ ((countOfReceivers > 1) ? ("(" + countOfReceivers + ")")
								: ""));
				dto.setHasNewMessages(conversations.get(i).isNewForSender());
			}

			dtos.add(dto);
		}
		if (conversations.size() == 0)
			dtos.add(new ConversationDto(inboxCount, sentCount));
		return dtos;
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
		User senderUser = userDao.findById(sender);
		User receiverUser = userDao.findById(receiver);
		Conversation conversation = new Conversation(senderUser, receiverUser,
				subject, false, true, false, false, 1, true, false, "From: "
						+ constructName(senderUser), "To: "
						+ constructName(receiverUser));
		conversationDao.save(conversation);
		messagesService.createNewMessage(conversation, text);
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

	/* Thread class */
	private class GroupThread implements Runnable {
		private String subject;
		private Long principalId;
		private String group;
		private String text;

		public GroupThread(String subject, Long principalId, String group,
				String text) {
			this.subject = subject;
			this.principalId = principalId;
			this.group = group;
			this.text = text;
		}

		@Override
		public void run() {

			User sender = userDao.findById(principalId);
			List<Parent> parents = parentService.getAllParentsOfGroup(group);
			Conversation conversation;
			int conversationCounter = 0;
			Group groupName = parents.get(0).getStudents().get(0).getGroup();
			for (Parent p : parents) {
				conversation = new Conversation(sender, p.getUserId(), subject,
						false, true, false, false,
						conversationCounter == 0 ? parents.size() : -1, true,
						false, "From: " + constructName(sender), "To: "
								+ groupName.getNumber() + " — "
								+ groupName.getLetter());
				conversationCounter++;
				conversationDao.save(conversation);
				messagesService.createNewMessage(conversation, text);
			}
		}
	}

	public String constructName(User user) {
		return user.getFirstName() + " " + user.getLastName();
	}

	@Override
	public void sendToGroup(String subject, Long principalId, String group,
			String text) {

		GroupThread groupThread = new GroupThread(subject, principalId, group,
				text);
		new Thread(groupThread).start();

	}
}
