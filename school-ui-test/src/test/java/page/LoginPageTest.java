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
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}
	
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testLogin() throws InterruptedException {
		/*LoginPage loginPage = homePage.gotoLoginPage();
		Thread.sleep(2000);
		User user = new User();
		user.setEmail("schoolportalservice@mail.ru");
		user.setPassword("4wiky6eoouj8");
		user.setFirstName("asd");
		user.setLastName("asd");
		loginPage.logIn(user);
		Assert.assertEquals(user.getFirstName()+" "+user.getLastName(), homePage.getUserName());*/
	}

}
