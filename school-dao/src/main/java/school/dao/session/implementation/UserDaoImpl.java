package school.dao.session.implementation;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.UserDao;
import school.model.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{


	public UserDaoImpl(Class<User> entityClass) {
		super(User.class);
	}

	public User findByEmail(User user) {
		Session session = null;
		User newEntity = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession(); 
			Transaction transaction = session.beginTransaction();
			newEntity = (User) session.get(User.class, user.getEmail());
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return newEntity;
	}

	

}
