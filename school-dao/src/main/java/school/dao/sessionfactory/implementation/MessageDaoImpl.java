package school.dao.sessionfactory.implementation;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.MessageDao;
import school.model.Message;
import school.model.User;

public class MessageDaoImpl extends BaseDaoImpl<Message> implements MessageDao {

	public MessageDaoImpl() {
		super(Message.class);
	}

	@SuppressWarnings("unchecked")
	public List<Message> findAllMessagesByReceiver(User receiverId) {
		Session session = null;
		List<Message> list = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.SELECT_ALL_MESSAGES_BY_RECEIVERID_QUERY);
			query.setParameter("receiverId", receiverId);
	        list = query.list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Message> findAllMessagesWithUsers(List<User> users) {
		Session session = null;
		List<Message> list = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.SELECT_ALL_MESSAGES_WITH_USERS_QUERY);
			query.setParameterList("users", users);
	        list = query.list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Message> findAllMessagesBySender(User senderId) {
		Session session = null;
		List<Message> list = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.SELECT_ALL_MESSAGES_BY_SENDERID_QUERY);
			query.setParameter("senderId", senderId);
	        list = query.list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<User> selectDistinctSendersForReceiver(User receiverId) {
		Session session = null;
		List<User> list = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.SELECT_DISTINCT_SENDERS_FOR_RECEIVER_QUERY);
			query.setParameter("receiverId", receiverId);
	        list = query.list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return list;
	}

	public int countOfLettersWithUsers(List<User> users) {
		Session session = null;
		Integer letters = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.GET_COUNT_OF_LETTERS_WITH_USERS_QUERY);
			query.setParameterList("users", users);
	        letters = Integer.valueOf(query.uniqueResult().toString());
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return letters;
	}

	public int countOfNewMessagesBetweenUsers(List<User> users) {
		Session session = null;
		Integer letters = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.GET_COUNT_OF_NEW_LETTERS_WITH_USERS_QUERY);
			query.setParameterList("users", users);
	        letters = Integer.valueOf(query.uniqueResult().toString());
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return letters;
	}
	
	
/*	@SuppressWarnings("unchecked")
	public List<Message> findMessagesByDate(Date date) {
		Session session = null;
		List<Message> list = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();	
			Query query = session.createQuery(Message.FIND_BY_DATE_QUERY);
	        list = query.list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return list;
	}*/

}
