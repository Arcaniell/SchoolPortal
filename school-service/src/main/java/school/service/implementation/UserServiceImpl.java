package school.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.UserDao;
import school.model.User;
import school.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Transactional
	public User createUser(User user) {
		if (userDao.findByEmail(user.getEmail()) == null) {
			return userDao.update(user);
		} else
			return null;
	}

}
