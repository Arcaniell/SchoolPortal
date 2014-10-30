package school.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.UserDao;
import school.model.User;
import school.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	public User createUser(User user) {
		userDao.save(user);
		return userDao.findById(1L);
	}

}
