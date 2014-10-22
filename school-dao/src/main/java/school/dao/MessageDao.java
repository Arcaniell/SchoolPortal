package school.dao;

import java.util.List;

import school.model.Message;
import school.model.User;

public interface MessageDao extends BaseDao<Message> {

	List<Message> findAllMessagesByReceiver(User receiverId);
	List<Message> findAllMessagesBySender(User senderId);
	List<User> selectDistincSendersIdForReceiverId(User receiverId);
	List<Message> findAllMessagesWithUsers(List<User> users);
	long countOfLettersWithUsers(List<User> users);
	long countOfNewMessagesBetweenUsers(List<User> users);
}
