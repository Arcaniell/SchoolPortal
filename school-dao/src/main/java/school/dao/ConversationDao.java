package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Conversation;
import school.model.User;

public interface ConversationDao extends BaseDao<Conversation, Long> {
	List<Conversation> findInboxConversationsForUser(User receiver);
	List<Conversation> findSentConversationsForUser(User sender);
	Date findDateForConversation(Conversation conversation);
}
