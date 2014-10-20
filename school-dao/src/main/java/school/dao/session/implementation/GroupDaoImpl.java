package school.dao.session.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.GroupDao;
import school.model.Group;

public class GroupDaoImpl extends BaseDaoImpl<Group> implements GroupDao {

	private Session session;
	private Group newGroup;
	private List<Group> groups;

	public GroupDaoImpl() {
		super(Group.class);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findAllAdditional() {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			groups = (List<Group>) session
					.createQuery(Group.FIND_BY_ADDITIONAL_QUERY)
					.setBoolean("additional", true).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Group>(groups);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findAllNotAdditional() {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			groups = (List<Group>) session
					.createQuery(Group.FIND_BY_ADDITIONAL_QUERY)
					.setBoolean("additional", false).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Group>(groups);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findByNumber(byte number) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			groups = (List<Group>) session
					.createQuery(Group.FIND_BY_NUMBER_QUERY)
					.setByte("number", number).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Group>(groups);
	}

	@SuppressWarnings("unchecked")
	public List<Group> findByStartDate(Date startDate) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			groups = (List<Group>) session
					.createQuery(Group.FIND_BY_STARTDATE_QUERY)
					.setDate("startDate", startDate).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Group>(groups);
	}

	public Group findByTeacherId(long teacherId) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			newGroup = (Group) session.createQuery(Group.FIND_BY_TEACHER_QUERY)
					.setLong("teacherId", teacherId);
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return newGroup;
	}

	public Group findByNumberAndLetter(byte number, char letter) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			newGroup = (Group) session
					.createQuery(Group.FIND_BY_NUMBER_LETTER_QUERY)
					.setByte("number", number).setCharacter("letter", letter);
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return newGroup;
	}

	@SuppressWarnings("unchecked")
	public List<Group> findAllActiveGroups(Date actualDate) {
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			groups = (List<Group>) session
					.createQuery(Group.FIND_BY_ACTIVE_GROUP_QUERY)
					.setDate("actualDate", actualDate).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return new ArrayList<Group>(groups);
	}

}
