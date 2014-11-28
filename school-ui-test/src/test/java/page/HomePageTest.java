package page;


import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.firefox.FirefoxDriver;

import utils.WebDriverRunner;
public class HomePageTest {
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
	public void testHideHomeInfoButton() throws InterruptedException {
/*		homePage.getHideHomeInfoButton().click();
		Thread.sleep(1000);*/
	}
	
	@Test
	public void testShowHomeInfoButton() throws InterruptedException {
/*		homePage.getHideHomeInfoButton().click();
		Thread.sleep(1000);
		homePage.getShowHomeInfoButton().click();
		Thread.sleep(1000);
		Assert.assertTrue(homePage.getHomeInfo().size()==3);*/
	}

}
