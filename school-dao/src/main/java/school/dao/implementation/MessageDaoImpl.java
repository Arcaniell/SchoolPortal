package school.dao.implementation;

import java.util.ArrayList;
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
	public List<Message> findReceiversMessagesOfConversation(
			Conversation conversation) {
		List<Message> list = new ArrayList<Message>();
		try {
			List<Message> mList = (List<Message>) entityManager
					.createNamedQuery("Message.FIND_RECEIVERS_MESSAGES")
					.setParameter("conversation", conversation).getResultList();
			if (mList != null) {
				return mList;
			}
		} catch (NoResultException e) {
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Message> findSendersMessagesOfConversation(
			Conversation conversation) {
		List<Message> list = new ArrayList<Message>();
		try {
			List<Message> mList = (List<Message>) entityManager
					.createNamedQuery("Message.FIND_SENDERS_MESSAGES")
					.setParameter("conversation", conversation).getResultList();
			if (mList != null) {
				return mList;
			}
		} catch (NoResultException e) {
			e.printStackTrace();
		}
		return list;
	}
}