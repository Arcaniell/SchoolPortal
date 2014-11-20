package school.service;

import java.util.List;

import school.dto.message.EmailObjectDTO;
import school.dto.message.MessageDto;
import school.model.Conversation;
import school.model.Message;
import school.model.User;

public interface MessagesService {

	List<Message> findMessagesOfConversation(long conversationId, long userId);
	List<MessageDto> constructMessagesDto(List<Message> messages, long receiverId, long senderId);
	void deleteMessage(long messageId, long id);
	Message findById(long repliedMessageId);
	void createNewMessage(Conversation conversation, String text, long principalId);
	void replyMessage(Conversation conversation, String text, long principalId);
	void markAsRead(List<Message> messages, long principalId);
	int countOfNewMessages(long userId);
	List<User> simulateSearchResult(String tagName, boolean isParent);
	List<EmailObjectDTO> contructEmailObjectDTO(List<User> users);
}
