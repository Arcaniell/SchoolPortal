package school.service.utils;

public class SalaryUtil {
	public static final String[] MONTH = { "January", "February", "March",
			"April", "May", "June", "July", "August", "September", "October",
			"November", "December" };
	
	public static String getMonth (int num) {
		String monthString;
		if(num < MONTH.length)
		    monthString = MONTH[num];
		else
		    monthString = "Invalid month";
		return monthString;
	}
}
