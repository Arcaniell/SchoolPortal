package school.service.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class JournalUtil extends SchoolUtil {

	public static final String MOD_ATT_DATES = "dates";
	public static final String MOD_ATT_GROUP_MARKS = "groupMarks";
	public static final String MOD_ATT_DIARY_MARKS = "diaryMarks";
	public static final String MOD_ATT_STAFF = "teacher";
	public static final String MOD_ATT_SEARCH_DATA = "searchData";

	public static final String FIRST_QUARTER = "1";
	public static final String SECOND_QUARTER = "2";
	public static final String THIRD_QUARTER = "3";
	public static final String FOURTH_QUARTER = "4";

	public static final String HOURS_OF_DATE = "HH:mm";
	public static final String DATE_FORMAT = "dd:MM:yyyy";

	public static final String EMPTY = "";
	public static final int NOTHING = 0;

	public static final int REGULAR_MARK = 1;

	public static final String SPLITTER = "j";

	public static final int FIRST_AND_LAST_DATE_OF_QUARTER = 2;
	public static final int FIRST_DATE_OF_QUARTER = 0;
	public static final int LAST_DATE_OF_QUARTER = 1;

	public static final String FIRST_DAY_FIRST_QUARTER = "09/01/2014";
	public static final String LAST_DAY_FIRST_QUARTER = "10/31/2014";
	public static final String FIRST_DAY_SECOND_QUARTER = "11/01/2014";
	public static final String LAST_DAY_SECOND_QUARTER = "12/31/2014";
	public static final String FIRST_DAY_THIRD_QUARTER = "02/01/2015";
	public static final String LAST_DAY_THIRD_QUARTER = "03/31/2015";
	public static final String FIRST_DAY_FOURTH_QUARTER = "04/01/2015";
	public static final String LAST_DAY_FOURTH_QUARTER = "05/31/2015";

	public static List<Date> getWeek(Calendar date) throws ParseException {

		SimpleDateFormat format = new SimpleDateFormat(UI_DATE_FORMAT);
		String formatedDate = (date.get(Calendar.MONTH) + 1) + "/"
				+ date.get(Calendar.DATE) + "/" + date.get(Calendar.YEAR);

		Date d = format.parse(formatedDate);
		date.setTime(d);

		date.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		List<Date> week = new ArrayList<Date>();
		for (int i = 0; i < Calendar.DAY_OF_WEEK; i++) {
			week.add(date.getTime());
			date.add(Calendar.DATE, 1);
		}
		return week;
	}

	public static long getClosestValue(long currentNumber, List<Long> numbers) {

		long distance = Math.abs(numbers.get(0) - currentNumber);
		int idx = 0;
		for (int c = 1; c < numbers.size(); c++) {
			long cdistance = Math.abs(numbers.get(c) - currentNumber);
			if (cdistance < distance) {
				idx = c;
				distance = cdistance;
			}
		}
		return numbers.get(idx);
	}
}
