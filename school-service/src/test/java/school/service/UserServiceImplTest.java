package school.service;

import java.util.Date;
import java.util.Random;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import school.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/service-context.xml"})
public class UserServiceImplTest {
	
	@Autowired
	private UserService userService;
	private User user;
	
	
	@Before
	public void setUp() throws Exception {
		Random r = new Random();
		user = new User();
		user.setEmail("testemaill"+r.nextInt()+"@gmail.com");
		user.setFirstName("Roman");
		user.setLastName("Petrov");
		user.setPassword("password");
		user.setRegistration(new Date());
		user.setSex(User.SexType.MALE.getSex());
	}

	@Test
	public void testCreateUser() {
		Assert.assertNotNull(userService.createUser(user));
	}

}
