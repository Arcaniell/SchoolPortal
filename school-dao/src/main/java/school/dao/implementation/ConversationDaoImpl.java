package school.dao.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ConversationDao;
import school.dao.MessageDao;
import school.model.Conversation;
import school.model.Message;
import school.model.User;

@Repository
public class ConversationDaoImpl extends BaseDaoImpl<Conversation, Long>
		implements ConversationDao {

	public ConversationDaoImpl() {
		super(Conversation.class);
	}
	
	@Autowired
	private MessageDao messageDao;

	@SuppressWarnings({ "unchecked", "finally" })
	@Transactional
	public List<Conversation> findInboxConversations(User user) {
		List<Conversation> list = new ArrayList<Conversation>();
		try {
			list = (List<Conversation>) entityManager
					.createNamedQuery("Conversation.INBOX_CONVERSATIONS")
					.setParameter("user", user).getResultList();
		} catch (NoResultException e) {
			return list;
		} 
		return list;
	}

	@SuppressWarnings({ "unchecked", "finally" })
	@Transactional
	public List<Conversation> findSentConversations(User user) {
		List<Conversation> list = new ArrayList<Conversation>();
		try {
			list = (List<Conversation>) entityManager
					.createNamedQuery("Conversation.SENT_CONVERSATIONS")
					.setParameter("user", user).getResultList();
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
