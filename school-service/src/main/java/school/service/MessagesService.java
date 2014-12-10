package school.service;

import java.util.List;
import java.util.Locale;

import school.dto.message.EmailObjectDTO;
import school.dto.message.MessageDto;
import school.dto.message.NewMessagesObjectDTO;
import school.model.Conversation;
import school.model.Message;
import school.model.User;

public interface MessagesService {

	List<Message> findMessagesOfConversation(Conversation conversation, long userId);

	List<MessageDto> constructMessagesDto(List<Message> messages,
			long receiverId, long senderId, Locale loc);

	void deleteMessage(long messageId, long id);

	Message findById(long repliedMessageId);

	void createNewMessage(Conversation conversation, String text);

	void replyMessage(Conversation conversation, String text, long principalId);

	void markMessagesAsRead(List<Message> messages, long principalId);

	int countOfNewMessages(long userId);

	List<Object> simulateSearchResult(String tagName, boolean isParent, String emailOrGroup);

	List<EmailObjectDTO> contructEmailObjectDTO(List<Object> users);

	NewMessagesObjectDTO constructNewMessagesObjectDTO(Long userId);

	List<MessageDto> constructGroupMessagesDto(List<Message> messages, long senderId, Locale loc);
}
