package school.dao;

import java.util.List;

import school.model.Conversation;
import school.model.Message;

public interface MessageDao extends BaseDao<Message, Long> {
	List<Message> findMessagesOfConversation(Conversation conversation);
}
