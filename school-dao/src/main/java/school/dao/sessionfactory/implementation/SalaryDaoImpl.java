package school.dao.sessionfactory.implementation;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.Session;
import org.hibernate.Transaction;
import school.dao.SalaryDao;
import school.model.Salary;


public class SalaryDaoImpl extends BaseDaoImpl<Salary> implements SalaryDao{
	private Session session;
	private Set<Salary> salaries;
	
	public SalaryDaoImpl() {
		super(Salary.class);
	}

	@SuppressWarnings("unchecked")
	public Set<Salary> findByDate(Date date) {
		try {
			salaries = new HashSet<Salary>();
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			salaries = (Set<Salary>) session
					.createQuery(Salary.FIND_BY_DATE_QUERY)
					.setDate("issueDate", date).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return salaries;
	}

	@SuppressWarnings("unchecked")
	public Set<Salary> findByPeriod(Date from, Date until) {
		try {
			salaries = new HashSet<Salary>();
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			salaries = (Set<Salary>) session
					.createQuery(Salary.FIND_BY_DATE_QUERY)
					.setDate("from", from).setDate("until", until).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return salaries;
	}

	@SuppressWarnings("unchecked")
	public Set<Salary> findByTeacherId(long teacherId) {
		try {
			salaries = new HashSet<Salary>();
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			salaries = (Set<Salary>) session
					.createQuery(Salary.FIND_BY_TEACHER_ID_QUERY)
					.setLong("teacherId", teacherId).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return salaries;
	}


	}


