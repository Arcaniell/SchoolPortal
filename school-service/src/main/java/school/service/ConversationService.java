package school.service;

import java.util.List;

import school.dto.ConversationDto;
import school.model.Conversation;

public interface ConversationService {

	List<Conversation> findInbox();
	List<Conversation> findSent();
	List<String> getFirstNames(List<Conversation> conversations);
	List<String> getLastNames(List<Conversation> conversations);
	List<String> getDates(List<Conversation> conversations);
	List<ConversationDto> constructConversationsDto(List<Conversation> conversations);
}
