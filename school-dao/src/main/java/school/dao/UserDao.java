package school.dao;

import school.model.User;

public interface UserDao extends BaseDao<User>{
		User findByEmail(String email);
		User findByEmailAndPassword(String email, String password);
}
