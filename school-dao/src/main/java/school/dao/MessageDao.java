package school.dao;

import java.util.List;

import school.model.Message;
import school.model.User;

public interface MessageDao extends BaseDao<Message> {

	List<Message> findAllMessagesByReceiver(User receiverId);
	List<Message> findAllMessagesBySender(User senderId);
	List<User> selectDistinctSendersForReceiver(User receiverId);
	List<Message> findAllMessagesWithUsers(List<User> users);
	int countOfLettersWithUsers(List<User> users);
	int countOfNewMessagesBetweenUsers(List<User> users);
}
