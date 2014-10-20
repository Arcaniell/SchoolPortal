package school.dao.testmain;

import java.util.Date;

import org.hibernate.Session;

import school.dao.session.implementation.HibernateSessionFactory;
import school.dao.session.implementation.UserDaoImpl;
import school.model.User;

public class Main {

	public static void main(String[] args) {
		User user = new User();
		user.setId(1L);
		user.setFirstName("Roman");
		user.setEmail("testmail6@gmail.com");
		user.setLastName("Mudrij");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE.getSex());
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		userDaoImpl.save(user);
		System.out.println(userDaoImpl.findById(1L).getLastName());
	}

}
