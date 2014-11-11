package school.service.implementation;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.runners.MockitoJUnitRunner;

import school.model.User;
import school.service.EmailService;

@RunWith(MockitoJUnitRunner.class)
public class EmailServiceImplTest {
	
	private EmailService emailService = new EmailServiceImpl();
	private User user;
	@Before
	public void setUp(){
		user = new User();
		user.setEmail("rmudrij@mail.ru");
		user.setFirstName("Billlll");
		user.setLastName("Gates");
	}

	@Test
	public void testSendRegistrationEmail() {
		emailService.sendRegistrationEmail(user);
	}

}
