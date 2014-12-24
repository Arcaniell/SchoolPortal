package school.service.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import school.dto.journal.MarkDTO;

public class JournalUtil {

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

	public static final String SPLITTER = "j";

	public static final int FIRST_DATE_OF_QUARTER = 0;
	public static final int LAST_DATE_OF_QUARTER = 1;

	public static final Date FIRST_DAY_FIRST_QUARTER = new Date(1409518800000L);
	public static final Date LAST_DAY_FIRST_QUARTER = new Date(1414706400000L);
	public static final Date FIRST_DAY_SECOND_QUARTER = new Date(1414792800000L);
	public static final Date LAST_DAY_SECOND_QUARTER = new Date(1419976800000L);
	public static final Date FIRST_DAY_THIRD_QUARTER = new Date(1422741600000L);
	public static final Date LAST_DAY_THIRD_QUARTER = new Date(1427749200000L);
	public static final Date FIRST_DAY_FOURTH_QUARTER = new Date(1427835600000L);
	public static final Date LAST_DAY_FOURTH_QUARTER = new Date(1433019600000L);

	public static final int DAYS_DEFORE = -5;
	public static final int DAYS_AFTER = 5;

	public static List<Date> getWeek(Calendar date) {
		date.setTime(getDateWithoutHours(date.getTime()));
		date.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		List<Date> week = new ArrayList<>();
		for (int i = 0; i < Calendar.DAY_OF_WEEK; i++) {
			week.add(date.getTime());
			date.add(Calendar.DATE, 1);
		}
		return week;
	}

	public static Date getHoursOfDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(HOURS_OF_DATE);
		try {
			return dateFormat.parse(dateFormat.format(date));
		} catch (ParseException e) {
			return date;
		}
	}

	public static Date getDateWithoutHours(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
		try {
			return dateFormat.parse(dateFormat.format(date));
		} catch (ParseException e) {
			return date;
		}
	}

	public static long getClosestValue(long currentNumber, List<Long> numbers) {
		long distance = Math.abs(numbers.get(0) - currentNumber);
		int idx = 0;
		for (int i = 1; i < numbers.size(); i++) {
			long cdistance = Math.abs(numbers.get(i) - currentNumber);
			if (cdistance < distance) {
				idx = i;
				distance = cdistance;
			}
		}
		return numbers.get(idx);
	}

	public static int getQuarterMark(Set<MarkDTO> marks) {
		int markSum = NOTHING;
		int size = NOTHING;
		for (MarkDTO markDTO : marks) {
			if (markDTO.getMark() > NOTHING) {
				markSum += markDTO.getMark() * markDTO.getMarkCoefficient();
				size += markDTO.getMarkCoefficient();
			}
		}
		try {
			return Math.round((float) markSum / size);
		} catch (ArithmeticException ae) {
			return NOTHING;
		}
	}

	public static String getQuarterByDate(Date date) {
		if (date.before(FIRST_DAY_SECOND_QUARTER)) {
			return FIRST_QUARTER;
		} else if (date.after(LAST_DAY_FIRST_QUARTER)
				&& date.before(FIRST_DAY_THIRD_QUARTER)) {
			return SECOND_QUARTER;
		} else if (date.after(LAST_DAY_SECOND_QUARTER)
				&& date.before(FIRST_DAY_FOURTH_QUARTER)) {
			return THIRD_QUARTER;
		} else if (date.after(LAST_DAY_THIRD_QUARTER)) {
			return FOURTH_QUARTER;
		}
		return null;
	}

	public static Date[] getDatesByQuarter(String quarter) {
		switch (quarter) {
		case JournalUtil.FIRST_QUARTER:
			return new Date[] { JournalUtil.FIRST_DAY_FIRST_QUARTER,
					JournalUtil.LAST_DAY_FIRST_QUARTER };
		case JournalUtil.SECOND_QUARTER:
			return new Date[] { JournalUtil.FIRST_DAY_SECOND_QUARTER,
					JournalUtil.LAST_DAY_SECOND_QUARTER };
		case JournalUtil.THIRD_QUARTER:
			return new Date[] { JournalUtil.FIRST_DAY_THIRD_QUARTER,
					JournalUtil.LAST_DAY_THIRD_QUARTER };
		case JournalUtil.FOURTH_QUARTER:
			return new Date[] { JournalUtil.FIRST_DAY_FOURTH_QUARTER,
					JournalUtil.LAST_DAY_FOURTH_QUARTER };
		}
		return null;
	}

}