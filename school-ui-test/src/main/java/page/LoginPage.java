package page;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import school.model.User;
import utils.WebDriverRunner;

public class LoginPage {

	private WebDriver webDriver = WebDriverRunner.getWebDriver();

	public void logIn(User user){
		WebElement email = webDriver.findElement(By.id("j_username"));
		email.clear();
		email.sendKeys(user.getEmail());
		WebElement password = webDriver.findElement(By.id("j_password"));
		password.clear();
		password.sendKeys(user.getPassword());
		password.submit();
	}
	
	
}
