package school.dao.implementation;

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

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Conversation> findInboxConversationsForUser(User receiver) {
		try {
			return (List<Conversation>) entityManager
					.createNamedQuery("Conversation.INBOX_QUERY")
					.setParameter("receiver", receiver)
					.setParameter("isAnswered", Boolean.TRUE)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Conversation> findSentConversationsForUser(User sender) {
		try {
			return (List<Conversation>) entityManager
					.createNamedQuery("Conversation.SENT_QUERY")
					.setParameter("sender", sender)
					.setParameter("isAnswered", Boolean.TRUE)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public Date findDateForConversation(Conversation conversation) {
		try {
			return (Date) entityManager
					.createNamedQuery("Conversation.FIND_DATE")
					.setParameter("conversation", conversation)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
