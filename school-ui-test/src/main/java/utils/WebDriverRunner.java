package utils;

import org.openqa.selenium.WebDriver;

public class WebDriverRunner {

	private static WebDriver webDriver;
	
	public static WebDriver getWebDriver() {
		return webDriver;
	}

	public static void start(WebDriver webDriver){
		WebDriverRunner.webDriver = webDriver;
	}
	
	public static void stop(){
		if (webDriver != null) {
			webDriver.quit();
		}
		webDriver = null;
	}
	
	
	
}
