package page;


import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.firefox.FirefoxDriver;

import school.model.User;
import utils.WebDriverRunner;

public class LoginPageTest {
	private HomePage homePage; 
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		WebDriverRunner.start(new FirefoxDriver());
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		WebDriverRunner.stop();
	}
	
	@Before
	public void setUp() throws Exception {
		homePage = new HomePage();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testLogin() throws InterruptedException {
		LoginPage loginPage = homePage.gotoLoginPage();
		Thread.sleep(2000);
		User user = new User();
		user.setEmail("headteacher@gmail.com");
		user.setPassword("headteacher");
//		user.setFirstName("asd");
//		user.setLastName("asd");
		loginPage.logIn(user);
//		Assert.assertEquals(user.getFirstName()+" "+user.getLastName(), homePage.getUserName());
		
	}

}
