package school.dao;

import school.model.User;

public interface UserDao extends BaseDao<User, Long>{
		User findByEmail(String email);
		User findByEmailAndPassword(String email, String password);
}
