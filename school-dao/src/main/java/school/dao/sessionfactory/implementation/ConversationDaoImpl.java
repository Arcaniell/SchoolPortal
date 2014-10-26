package school.dao.sessionfactory.implementation;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.ConversationDao;
import school.model.Conversation;
import school.model.User;

public class ConversationDaoImpl extends BaseDaoImpl<Conversation> implements ConversationDao {
	
	public ConversationDaoImpl() {
		super(Conversation.class);
	}
	
	@Override
	public Conversation update(Conversation conv) {
		Session session = null;
		Conversation conversation = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession(); 
			Transaction transaction = session.beginTransaction();
			conversation = (Conversation) session.merge(conv);
			transaction.commit();
			
			if(conversation != null) {
				Hibernate.initialize(conversation.getMessages());
			}
			
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return conversation;
	}
	
	@SuppressWarnings("unchecked")
	public List<Conversation> findAll() {
		Session session = null;
		List<Conversation> conversations = new ArrayList<Conversation>();
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession(); 
			Transaction transaction = session.beginTransaction();
			conversations = session.createQuery("from Conversation").list();
			transaction.commit();
			
			for(Conversation c : conversations) {
				if(c != null) {
					Hibernate.initialize(c.getMessages());
				}
			}
			
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return conversations;
	}
	
	@Override
	public Conversation findById(long id) {
		Session session = null;
		Conversation conversation = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession(); 
			Transaction transaction = session.beginTransaction();
			conversation = (Conversation) session.get(Conversation.class, id);
			transaction.commit();
			if(conversation != null) {
				Hibernate.initialize(conversation.getMessages());
			}
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return conversation;
	}
	
	@SuppressWarnings("unchecked")
	public List<Conversation> findInboxConversationsForUser(User receiver) {
		Session session = null;
        List<Conversation> list = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            list = (List<Conversation>) session.createQuery(Conversation.SELECT_INBOX_CONVERSATIONS_QUERY)
            		.setParameter("receiver", receiver).list();
            transaction.commit();
            
            for(Conversation c : list) {
            	Hibernate.initialize(c.getMessages());
            }
            
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return list;
	}

	@SuppressWarnings("unchecked")
	public List<Conversation> findSentConversationsForUser(User receiver) {
		Session session = null;
        List<Conversation> list = null;
        try {
            session = HibernateSessionFactory.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            list = (List<Conversation>) session.createQuery(Conversation.SELECT_SENT_CONVERSATIONS_QUERY)
            		.setParameter("receiver", receiver).list();
            transaction.commit();
            
            for(Conversation c : list) {
            	Hibernate.initialize(c.getMessages());
            }
            
        } finally {
            if ((session != null) && (session.isOpen())) {
                session.close();
            }
        }
        return list;
	}
	
	
}
