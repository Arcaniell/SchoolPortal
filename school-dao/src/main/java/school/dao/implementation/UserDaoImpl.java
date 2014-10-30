package school.dao.implementation;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.UserDao;
import school.model.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User, Long> implements UserDao {

	public UserDaoImpl() {
		super(User.class);
	}
	@Transactional
	public User findByEmail(String email) {
		return (User) entityManager.createNamedQuery(User.FIND_BY_EMAIL)
				.setParameter("email", email).getSingleResult();
	}
	@Transactional
	public User findByEmailAndPassword(String email, String password) {
		return (User) entityManager.createNamedQuery(User.FIND_BY_EMAIL_AND_PASSWORD)
				.setParameter("email", email)
				.setParameter("password", password).getSingleResult();
	}
}
