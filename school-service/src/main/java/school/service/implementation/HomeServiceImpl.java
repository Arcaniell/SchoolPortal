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
import school.dao.UserDao;
import school.dto.RegistrationDTO;
import school.model.News;
import school.model.RegistrationData;
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
	public boolean registrateUser(RegistrationDTO registrationDTO, String url) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		registrationDTO.getUser().setPassword(passwordEncoder
				.encode(registrationDTO.getUser().getPassword()));
		List<Role> roles = registrationDTO.getUser().getRoles();
		registrationDTO.getUser().setRoles(null);
		registrationDTO.getUser().setRegistration(new Date());
		registrationDTO.setUser(userService.createUser(registrationDTO.getUser()));
		if (registrationDTO.getUser() != null) {
			roleRequestService.createRoleRequest(registrationDTO.getUser(), roles);
			registrationDTO.getRegistrationData().setUser(registrationDTO.getUser());
				Random random = new Random();
				registrationDTO.getRegistrationData().setRegistrationCode(Math.abs(random.nextInt()));
				registrationDTO.setRegistrationData(registrationDataDao
						.update(registrationDTO.getRegistrationData()));
				if (registrationDTO.getRegistrationData() != null) {
					if (emailService.sendRegistrationEmail(registrationDTO, url))
						return true;
				}
			
		}
		return false;
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
	public boolean forgotAPassword(String email) {
		if(userService.isEmailAviable(email)){
			emailService.sendNewPassword(null, null, null);
			return true;
		}
		return false;
	}

}
