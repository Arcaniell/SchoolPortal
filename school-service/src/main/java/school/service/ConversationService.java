package school.service;

import java.util.Date;
import java.util.List;

import school.dto.ConversationDto;
import school.model.Conversation;

public interface ConversationService {

	List<Conversation> findInbox(long id);
	List<Conversation> findSent(long id);
	List<String> getFirstNames(List<Conversation> conversations);
	List<String> getLastNames(List<Conversation> conversations);
	List<Date> getDates(List<Conversation> conversations, long id);
	List<ConversationDto> constructInboxConversationsDto(List<Conversation> conversations, long id);
	List<ConversationDto> constructSentConversationsDto(List<Conversation> conversations, long id);
	void deleteConversations(String[] ids, long id);
	Conversation findById(long id);
}
