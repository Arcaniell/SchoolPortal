package school.service.implementation;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.NewsDao;
import school.dao.RegistrationDataDao;
import school.dao.RestorePasswordDao;
import school.dao.UserDao;
import school.model.News;
import school.model.RegistrationData;
import school.model.RestorePassword;
import school.model.Role;
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
	RegistrationDataDao registrationDataDao;
	@Autowired
	RestorePasswordDao restorePasswordDao;
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
	public boolean registrateUser(RegistrationData registrationData, String url) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		registrationData.getUser().setPassword(passwordEncoder
				.encode(registrationData.getUser().getPassword()));
		List<Role> roles = registrationData.getUser().getRoles();
		registrationData.getUser().setRoles(null);
		registrationData.getUser().setRegistration(new Date());
		registrationData.setUser(userService.createUser(registrationData.getUser()));
		roleRequestService.createRoleRequest(registrationData.getUser(), roles);
		Random random = new Random();
		registrationData.setRegistrationCode(Math.abs(random.nextInt(10000)));
		registrationData = registrationDataDao.update(registrationData);
		return emailService.sendRegistrationEmail(registrationData, url);
	}

	@Override
	public User confirmUser(long userId, int code) {
		RegistrationData registrationData = registrationDataDao
				.findByUserAndCode(userId, code);
		if (registrationData != null){
			User user = userDao.findById(userId);
			user.setConfirmed(User.ConfirmType.CONFIRMED);
			return userDao.update(user);
			
		}return null;
	}

	@Override
	public boolean forgotAPassword(RegistrationData registrationData, String url) {
		User user = userDao.findByEmail(registrationData.getUser().getEmail());
		registrationData.setUser(user);
		registrationData = registrationDataDao.findByUserQuestionAnswer(registrationData);
		if(registrationData != null){
			RestorePassword restorePassword = new RestorePassword();
			Random random = new Random();
			restorePassword.setRestoreCode(Math.abs(random.nextInt(10000)));
			restorePassword.setNewPassword(generateRandomString(12));
			restorePassword.setUser(user);
			restorePassword = restorePasswordDao.update(restorePassword);
			return emailService.sendNewPassword(restorePassword, url);
		}
		return false;
	}
	
	private String generateRandomString(int length){
		char[] chars = "abcdefghijklmnopqrstuvwxyz123456789".toCharArray();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < length; i++) {
		    char c = chars[random.nextInt(chars.length)];
		    sb.append(c);
		}
		return sb.toString();
	}


	@Override
	public User confirmPassword(long userId, int code) {
		RestorePassword restorePassword = restorePasswordDao.findByUserAndCode(userId, code);
		if(restorePassword != null){
		User user = userDao.findById(userId);
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setPassword(passwordEncoder
				.encode(restorePassword.getNewPassword()));
		return userDao.update(user);
		}return null;
	}

}
