package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.MessageDao;
import school.model.Conversation;
import school.model.Message;

@Repository
public class MessageDaoImpl extends BaseDaoImpl<Message, Long> implements
		MessageDao {

	public MessageDaoImpl() {
		super(Message.class);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Message> findMessagesOfConversation(Conversation conversation) {
		try {
			return (List<Message>) entityManager.createNamedQuery("Message.FIND_MESSAGES")
					.setParameter("conversation", conversation).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}
}