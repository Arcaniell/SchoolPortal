package page;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import utils.WebDriverRunner;

public class HomePage {

	private WebDriver webDriver = WebDriverRunner.getWebDriver();
	
	public HomePage() {
		super();
		webDriver.get("http://localhost:10080/school-web/");
	}
	public WebElement getHideHomeInfoButton() {
		return webDriver.findElement(By.className("hidehomeinfo"));
	}
	public WebElement getShowHomeInfoButton() {
		return webDriver.findElement(By.className("showhomeinfo"));
	}
	public List<WebElement> getHomeInfo(){
		WebElement table = webDriver.findElement(By.className("home_info"))
				.findElement(By.tagName("table"));
//		tableRows.get(index).getText();
		return table.findElements(By.tagName("tr"));
	}
	
	public LoginPage gotoLoginPage(){
		webDriver.findElement(By.id("loginButton")).click();
		return new LoginPage();
	}
	

	public String getUserName(){
		return webDriver.findElement(By.className("profile-info")).getText();		
	}
	
	
}
