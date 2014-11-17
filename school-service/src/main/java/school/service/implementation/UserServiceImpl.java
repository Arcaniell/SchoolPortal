package school.service.implementation;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.UserDao;
import school.model.Role;
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

	/**
	 * @param id
	 *            id of our logged user
	 * @return true if user is a head teacher
	 * @author Blowder
	 */
	@Override
	public boolean isUserHeadTeacher(long id) {
		if (userDao == null) {
			return false;
		}
		User user = userDao.findById(id);
		if (user == null) {
			return false;
		}
		Set<Role> roles = user.getRoles();
		for (Role role : roles) {
			if (role.getName().equals("ROLE_HEAD_TEACHER")) {
				return true;
			}
		}
		return false;
	}

	/**
	 * @param id
	 *            id of our logged user
	 * @return true if user is a student
	 * @author Blowder
	 */
	@Override
	public boolean isUserStudent(long id) {
		if (userDao == null) {
			return false;
		}
		User user = userDao.findById(id);
		if (user == null) {
			return false;
		}
		Set<Role> roles = user.getRoles();
		for (Role role : roles) {
			if (role.getName().equals("ROLE_STUDENT")) {
				return true;
			}
		}
		return false;
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
