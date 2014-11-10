package school.service.implementation;

import java.util.Date;
import java.util.Random;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import school.model.User;
import school.service.UserService;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:/META-INF/service-context.xml"})
//@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class UserServiceImplTest {
	
//	@Autowired
//	private UserService userService;
//	private User user;
//	@Before
//	public void setUp() throws Exception {
//		user = new User();
//		user.setEmail("testemail"+(new Random()).nextInt()+"@gmail.com");
//		user.setFirstName("Oleg");
//		user.setLastName("Olgenko");
//		user.setPassword("password");
//		user.setRegistration(new Date());
//		user.setSex(User.SexType.MALE.getSex());
//	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCreateUser() {
//		User newUser = userService.createUser(user);
//		Assert.assertNotNull(newUser);
	}

}
