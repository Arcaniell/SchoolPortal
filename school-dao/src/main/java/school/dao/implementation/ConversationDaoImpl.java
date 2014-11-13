package school.dao.implementation;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ConversationDao;
import school.model.Conversation;
import school.model.User;

@Repository
public class ConversationDaoImpl extends BaseDaoImpl<Conversation, Long>
		implements ConversationDao {

	public ConversationDaoImpl() {
		super(Conversation.class);
	}

	@SuppressWarnings({ "unchecked", "finally" })
	@Transactional
	public List<Conversation> findInboxConversationsForUser(User receiver) {
		List<Conversation> list = new ArrayList<Conversation>();
		try {
			list = (List<Conversation>) entityManager
					.createNamedQuery("Conversation.INBOX_CONVERSATIONS")
					.setParameter("receiver", receiver).getResultList();
		} catch (NoResultException e) {
			e.printStackTrace();
		} finally {
			return list;
		}
	}

	@SuppressWarnings({ "unchecked", "finally" })
	@Transactional
	public List<Conversation> findSentConversationsForUser(User sender) {
		List<Conversation> list = new ArrayList<Conversation>();
		try {
			list = (List<Conversation>) entityManager
					.createNamedQuery("Conversation.SENT_CONVERSATIONS")
					.setParameter("sender", sender).getResultList();
		} catch (NoResultException e) {
			e.printStackTrace();
		} finally {
			return list;
		}
	}

	@SuppressWarnings("finally")
	@Transactional
	public Date findDateForReceiversConversation(Conversation conversation) {
		Date date = null;
		try {
			date = (Date) entityManager
					.createNamedQuery("Conversation.FIND_DATE_RECEIVER")
					.setParameter("conversation", conversation)
					.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
		} finally {
			return date;
		}
	}

	@SuppressWarnings("finally")
	@Transactional
	public Date findDateForSendersConversation(Conversation conversation) {
		Date date = null;
		try {
			date = (Date) entityManager
					.createNamedQuery("Conversation.FIND_DATE_SENDER")
					.setParameter("conversation", conversation)
					.getSingleResult();
		} catch (NoResultException e) {
			e.printStackTrace();
		} finally {
			return date;
		}
	}
}
