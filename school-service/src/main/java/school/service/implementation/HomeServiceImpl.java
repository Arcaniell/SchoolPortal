package school.service.implementation;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.NewsDao;
import school.dao.RegistrationCodeDao;
import school.dao.UserDao;
import school.model.News;
import school.model.RegistrationCode;
import school.model.RoleRequest;
import school.model.User;
import school.service.EmailService;
import school.service.HomeService;
import school.service.RoleRequestService;
import school.service.UserService;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	NewsDao newsDao;
	@Autowired
	UserDao userDao;
	@Autowired
	RegistrationCodeDao registrationCodeDao;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleRequestService roleRequestService;
	@Autowired
	private EmailService emailService;

	@Transactional
	public List<News> findAllNews() {
		return newsDao.findAll();
	}

	@Override
	public boolean registrateUser(User user, Integer role, String url) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		User newUser = userService.createUser(user);
		if (newUser != null) {
			RoleRequest roleRequest = roleRequestService.createRoleRequest(
					newUser, role);
			if (roleRequest != null) {

				RegistrationCode registrationCode = new RegistrationCode();
				registrationCode.setUser(newUser);
				Random random = new Random();
				registrationCode
						.setRegistrationCode(Math.abs(random.nextInt()));
				RegistrationCode newRegistrationCode = registrationCodeDao
						.update(registrationCode);
				if (newRegistrationCode != null) {
					if (emailService.sendRegistrationEmail(newUser,
							newRegistrationCode, url))
						return true;
				}
			}
		}
		return false;
	}

	@Override
	public User confirmUser(long userId, int code) {
		RegistrationCode registrationCode = registrationCodeDao
				.findByUserAndCode(userId, code);
		if (registrationCode != null){
			User user = userDao.findById(userId);
			user.setConfirmed(User.ConfirmType.CONFIRMED);
			return userDao.update(user);
			
		}return null;
	}

	@Override
	public boolean forgotAPassword(String email) {
		if(userService.isEmailAviable(email)){
			emailService.sendNewPassword(null, null, null);
			return true;
		}
		return false;
	}

}
