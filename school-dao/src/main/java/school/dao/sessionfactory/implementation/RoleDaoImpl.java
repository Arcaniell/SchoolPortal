package school.dao.sessionfactory.implementation;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.RoleDao;
import school.model.Role;

public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{

	public RoleDaoImpl() {
		super(Role.class);
		// TODO Auto-generated constructor stub
	}

	public Role findById(int id) {
		Session session = null;
		Role newEntity = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession(); 
			Transaction transaction = session.beginTransaction();
			newEntity = (Role) session.get(Role.class, id);
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return newEntity;
	}

}
