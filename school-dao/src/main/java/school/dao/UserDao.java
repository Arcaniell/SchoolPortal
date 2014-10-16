package school.dao;

import school.model.User;

public interface UserDao extends BaseDao<User>{
		User findByEmail(User user);
}
