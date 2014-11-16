package school.service;

import java.util.List;

import school.dto.MessageDto;
import school.model.Conversation;
import school.model.Message;

public interface MessagesService {

	List<Message> findMessagesOfConversation(long conversationId, long userId);
	List<MessageDto> constructMessagesDto(List<Message> messages, long receiverId, long senderId);
	void deleteMessages(String[] ids, long id);
	Message findById(long repliedMessageId);
	void createNewMessage(Conversation conversation, String text);
	void replyMessage(Conversation conversation, String text, long principalId);
}
