package school.service.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

public class JournalUtil extends SchoolUtil {

	public static final String STUDENT_DTOS = "studentDtos";
	public static final String SCHEDULE_DATES = "scheduleDates";

	public static Set<Date> getCurrentWeek() {
		Calendar c = Calendar.getInstance();

		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		Set<Date> currentWeek = new TreeSet<Date>();
		for (int i = 0; i < 7; i++) {
			currentWeek.add(c.getTime());
			c.add(Calendar.DATE, 1);
		}

		return currentWeek;

	}

}
