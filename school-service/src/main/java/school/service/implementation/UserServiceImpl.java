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
	public User loadUser(long id) {
		return userDao.findById(id);
	}

	@Override
	public boolean isEmailAviable(String email) {
		if (userDao.findByEmail(email) == null)
			return true;
		else
			return false;
	}

	@Override
	public User createUser(User user) {
		try{
		return userDao.update(user);
		}catch(Exception e){
		return null;
		}
	}

	@Override
	public void test403() {
		// TODO Auto-generated method stub
		
	}
}
