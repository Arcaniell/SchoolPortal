package school.service.utils;

import java.util.Date;
import java.util.List;

import school.model.Conversation;

public class ConversationsUtils {

	public void sortConversations(List<Conversation> conversations, List<Date> dates) {
		
		boolean swapped = true;
		while (swapped) {
			swapped = false;
			for (int i = 0; i < dates.size() - 1; i++) {
				if (dates.get(i).before(dates.get(i + 1))) {
					Date temp = dates.get(i);
					dates.set(i, dates.get(i + 1));
					dates.set(i + 1, temp);
					Conversation tempc = conversations.get(i);
					conversations.set(i, conversations.get(i + 1));
					conversations.set(i + 1, tempc);
					swapped = true;
				}
			}
		}
	}
}
