package school.service;

import java.util.List;

import school.dto.MessageDto;
import school.model.Message;

public interface MessagesService {

	List<Message> findMessagesOfConversation(long conversationId, long userId);
	void saveMessage(Message message);
	List<MessageDto> constructMessagesDto(List<Message> messages, long receiverId, long senderId);
	void deleteMessages(String[] ids, long id);
	Message findById(long repliedMessageId);
}
