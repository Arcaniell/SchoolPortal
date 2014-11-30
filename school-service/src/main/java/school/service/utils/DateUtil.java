package school.service.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

	// ENGLISH(example)
	// SHORT - 12.13.52
	// MEDIUM - Jan 12, 1952
	// LONG - January 12, 1952
	// FULL - Tuesday, April 12, 1952 AD

	public static int SHORT = DateFormat.SHORT;
	public static int MEDIUM = DateFormat.MEDIUM;
	public static int LONG = DateFormat.LONG;
	public static int FULL = DateFormat.FULL;

	//example
	public static String MYFORMAT = "yyyy-MM-dd";

	/* Method to convert String to Date */
	public static String getFormattedDate(Date date, int size, Locale loc) {
		DateFormat dateFormat = DateFormat.getDateInstance(size, loc);
		return dateFormat.format(date);
	}

	/* Method to convert String to Date */
	public static String getFormattedDate(Date date, String format, Locale loc) {
		SimpleDateFormat sdf = new SimpleDateFormat(format, loc);

		return sdf.format(date);
	}

	/* Method to convert Date to String */
	public static Date getFormattedDate(String date, int size)
			throws ParseException {
		DateFormat dateFormat = DateFormat.getDateInstance(size);

		return dateFormat.parse(date);
	}

	/* Method to convert Date to String */
	public static Date getFormattedDate(String date, String format)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);

		return sdf.parse(date);
	}
}
