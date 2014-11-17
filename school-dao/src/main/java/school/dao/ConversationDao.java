package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Conversation;
import school.model.User;

public interface ConversationDao extends BaseDao<Conversation, Long> {
	
	List<Conversation> findInboxConversations(User user);

	List<Conversation> findSentConversations(User user);

	Date findDateForReceiversConversation(Conversation conversation);

	Date findDateForSendersConversation(Conversation conversation);
}
