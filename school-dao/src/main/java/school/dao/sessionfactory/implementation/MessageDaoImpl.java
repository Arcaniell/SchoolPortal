package school.dao.sessionfactory.implementation;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.MessageDao;
import school.model.Conversation;
import school.model.Message;

public class MessageDaoImpl extends BaseDaoImpl<Message> implements MessageDao{

	public MessageDaoImpl() {
		super(Message.class);
	}

	@SuppressWarnings("unchecked")
	public List<Message> findMessagesOfConversation(Conversation conversation) {
		Session session = null;
        List<Message> messages = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            messages = (List<Message>) session.createQuery(Message.FIND_MESSAGES_OF_CONVERSATION_QUERY)
            		.setParameter("conversation", conversation).list();
            transaction.commit();
            
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return messages;
	}
	
}