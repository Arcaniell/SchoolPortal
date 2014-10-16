package school.dao.realization;

import org.hibernate.Session;

import school.dao.session.implementation.HibernateSessionFactory;

public class Main {

	public static void main(String[] args) {
		Session session = HibernateSessionFactory.getSessionFactory().openSession();
		session.close();
		HibernateSessionFactory.shutdown();
	}
}
