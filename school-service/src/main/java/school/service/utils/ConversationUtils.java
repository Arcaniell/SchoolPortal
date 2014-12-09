package school.service.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import school.dto.message.ConversationDate;
import school.model.Conversation;
import school.model.Group;
import school.model.Message;
import school.model.User;

public class ConversationUtils {

	/* Method to sort Conversations */
	public static void sortConversations(List<Conversation> conversations,
			List<Date> dates) {

		List<ConversationDate> base = new ArrayList<ConversationDate>();

		for (int i = 0; i < conversations.size(); i++) {
			base.add(new ConversationDate(conversations.get(i), dates.get(i)));
		}

		Collections.sort(base, new Comparator<ConversationDate>() {

			@Override
			public int compare(ConversationDate c1, ConversationDate c2) {
				if (c1.getDate().before(c2.getDate())) {
					return 1;
				} else {
					return -1;
				}
			}
		});

		conversations.clear();
		dates.clear();
		for (ConversationDate c : base) {
			conversations.add(c.getConversation());
			dates.add(c.getDate());
		}
	}

	public static List<Conversation> removeDoubledConversations(
			List<Conversation> conversations) {
		Iterator<Conversation> i = conversations.iterator();
		while (i.hasNext()) {
			Conversation c = i.next();
			if (c.getCountOfReceivers() == -1) {
				i.remove();
			}
		}
		return conversations;
	}

	/* Method to check if user contains tag */
	public static boolean userContainsLetter(User u, String tagName) {
		if (u.getFirstName().toLowerCase().contains(tagName)
				|| u.getLastName().toLowerCase().contains(tagName)
				|| u.getEmail().toLowerCase().contains(tagName)) {
			return true;
		} else
			return false;
	}

	/* Method to count new messages for user */
	public static int countOfNewMessagesForUser(List<Message> messageList,
			long userId) {
		int count = 0;
		for (Message m : messageList) {
			Conversation conversation = m.getConversationId();
			if (conversation.getReceiverId().getId() == userId
					&& !m.isReadReceiver() && !m.isDeletedReceiver()) {
				count++;
			} else if (conversation.getSenderId().getId() == userId
					&& !m.isReadSender() && !m.isDeletedSender()) {
				count++;
			}
		}
		return count;
	}

	/* Method to delete message */
	public static void deleteMessage(Conversation conversation,
			Message message, long id, int receiversSize, int sendersSize) {

		if (conversation.getReceiverId().getId() == id) {
			message.setDeletedReceiver(true);
			if (receiversSize - 1 == 0) {
				markConversationAsDeleted(conversation, id);
			}
		} else {
			message.setDeletedSender(true);
			if (sendersSize - 1 == 0) {
				markConversationAsDeleted(conversation, id);
			}
		}
	}

	/* Method to delete conversation */
	public static void deleteConversation(Conversation conversation, long id) {

		if (conversation.getReceiverId().getId() == id) {
			markConversationAsDeleted(conversation, id);
			for (Message m : conversation.getMessages()) {
				m.setDeletedReceiver(true);
			}
		} else {
			markConversationAsDeleted(conversation, id);
			for (Message m : conversation.getMessages()) {
				m.setDeletedSender(true);
			}
		}
	}

	/* Method to mark conversations as deleted */
	public static void markConversationAsDeleted(Conversation conversation,
			long id) {

		if (conversation.getReceiverId().getId() == id) {
			conversation.setDeletedReceiver(true);
			conversation.setAnsweredReceiver(false);
		} else {
			conversation.setDeletedSender(true);
			conversation.setAnsweredSender(false);
		}
	}

	public static boolean groupContainsLetter(Group g, String tagName) {
		if (tagName.contains(Character.toString(g.getLetter()).toLowerCase())
				|| tagName.contains(String.valueOf(g.getNumber()))) {
			return true;
		} else
			return false;
	}
}
