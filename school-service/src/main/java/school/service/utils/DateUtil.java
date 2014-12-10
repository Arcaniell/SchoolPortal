package school.service.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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

	public static String MESSAGE_DATE_FORMAT = "yyyy-MM-dd hh:mm";
	public static String SCHEDULE_DATE_FORMAT = "dd-MM-yyyy";
	public static String SCHEDULE_DATEPICKER_FORMAT = "MM/dd/yyyy";
	
	
	/* Method to convert Date to String */
	public static String getFormattedDate(Date date, int size, Locale loc) {
		DateFormat dateFormat = DateFormat.getDateInstance(size, loc);
		return dateFormat.format(date);
	}

	/* Method to convert Date to String */
	public static String getFormattedDate(Date date, String format, Locale loc) {
		SimpleDateFormat sdf = new SimpleDateFormat(format, loc);

		return sdf.format(date);
	}

	/* Method to convert String to Date */
	public static Date getFormattedDate(String date, int size)
			throws ParseException {
		DateFormat dateFormat = DateFormat.getDateInstance(size);

		return dateFormat.parse(date);
	}

	/* Method to convert String to Date */
	public static Date getFormattedDate(String date, String format)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);

		return sdf.parse(date);
	}

	/*
	 * Method for add or remove days from some given date; Sample; Add : 10
	 * March + 5 days = 15 March; Remove : 10 March - 5 days = 5 March;
	 */
	public static Date addOrDelDays(Date fch, int days) {
		Calendar cal = new GregorianCalendar();
		cal.setTimeInMillis(fch.getTime());
		cal.add(Calendar.DATE, days);
		return new Date(cal.getTimeInMillis());
	}

	/* Specific method for date picker date generation */
	public static Date dateProceed(String date, SimpleDateFormat format,
			int days, boolean forwardFlag) {
		Date generatedDate;
		try {
			if (date == null) {
				if (forwardFlag) {
					generatedDate = addOrDelDays(new Date(), -days);
				} else {
					generatedDate = addOrDelDays(new Date(), days);
				}
				return generatedDate;
			}
			generatedDate = format.parse(date);
		} catch (ParseException e) {
			if (forwardFlag) {
				generatedDate = addOrDelDays(new Date(), -days);
			} else {
				generatedDate = addOrDelDays(new Date(), days);
			}
		}
		return generatedDate;
	}

}
