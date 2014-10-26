package school.dao;

import java.util.List;

import school.model.Conversation;
import school.model.User;

public interface ConversationDao extends BaseDao<Conversation> {
	List<Conversation> findInboxConversationsForUser(User receiver);
	List<Conversation> findSentConversationsForUser(User receiver);
}
