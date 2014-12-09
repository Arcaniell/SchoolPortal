package school.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import school.dto.message.ConversationDto;
import school.model.Conversation;

public interface ConversationService {

	List<Conversation> findConversations(long id, String inboxOrSent);

	List<String> getNames(List<Conversation> conversations);

	List<Date> getDates(List<Conversation> conversations, long id);

	List<ConversationDto> constructConversationDto(
			List<Conversation> conversations, long id, Locale loc);

	void deleteConversations(String[] ids, long id);

	Conversation findById(long id);
	
	void createConversation(String subject, long senderId, long receiverId, String text);
	
	boolean hasNewMessages(Conversation conversation, long userId);

	boolean isGroup(String to);

	void sendToGroup(String subject, Long principalId, String to, String text);
}
