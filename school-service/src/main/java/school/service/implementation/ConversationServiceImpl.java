package school.service.implementation;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ConversationDao;
import school.dao.UserDao;
import school.dto.ConversationDto;
import school.model.Conversation;
import school.model.User;
import school.service.ConversationService;

@Service
public class ConversationServiceImpl implements ConversationService {

	@Autowired
	private ConversationDao conversationDao;

	@Autowired
	private UserDao userDao;
	private User user;

	@Transactional
	public List<Conversation> findInbox() {
		User receiver = userDao.findById(10L);
		return conversationDao.findInboxConversationsForUser(receiver);
	}

	@Transactional
	public List<Conversation> findSent() {
		User sender = userDao.findById(14L);
		List<Conversation> list = conversationDao
				.findSentConversationsForUser(sender);
		return list;
	}

	@Transactional
	public Conversation findById(Long id) {
		Conversation conversation = conversationDao.findById(id);
		return conversation;
	}

	@Transactional
	public List<ConversationDto> constructConversationsDto(
			List<Conversation> conversations) {
		List<ConversationDto> conversationsDto = new ArrayList<ConversationDto>();
		List<String> firstNames = getFirstNames(conversations);
		List<String> lastNames = getLastNames(conversations);
		List<String> dates = getDates(conversations);
		for (int i = 0; i < conversations.size(); i++) {
			ConversationDto convDto = new ConversationDto();
			convDto.setFirstName(firstNames.get(i));
			convDto.setLastName(lastNames.get(i));
			convDto.setDate(dates.get(i));
			convDto.setSubject(conversations.get(i).getSubject());
			conversationsDto.add(convDto);
		}
		return conversationsDto;
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

	@Transactional
	public List<String> getDates(List<Conversation> conversations) {

		List<String> dates = new ArrayList<String>();

		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		for (Conversation c : conversations) {
			String date = dateFormat.format(conversationDao
					.findDateForConversation(c));
			dates.add(date);
		}
		return dates;
	}

}
