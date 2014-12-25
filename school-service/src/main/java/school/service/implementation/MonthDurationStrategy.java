package school.service.implementation;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;



import school.service.Strategy;
import school.service.utils.DateUtil;
import school.service.utils.ScheduleUtil;

class MonthDurationStrategy implements Strategy {
	public String[] findStartDuration(String[] dayDuration, String way,
			Locale loc) {

		String reportDate = "";
		String df = ScheduleUtil.getDateForSch(dayDuration[ScheduleUtil.month]);

		String[] arr = df.split("-");
		String str = arr[ScheduleUtil.month] + "-" + arr[ScheduleUtil.day] + "-" + arr[ScheduleUtil.year];

		try {

			Date date = DateUtil.getFormattedDate(str,
					DateUtil.SCHEDULE_DATE_FORMAT);

			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			Calendar cal1 = Calendar.getInstance();
			cal1.setTime(date);
			if (way.equals(ScheduleServiceImpl.NEXT)) {
				cal1.add(Calendar.MONTH, 1);
			} else if (way.equals(ScheduleServiceImpl.BACK)) {
				cal1.add(Calendar.MONTH, -1);
			}
			int daysInMonth = cal1.getActualMaximum(Calendar.DAY_OF_MONTH);
			if (way.equals(ScheduleServiceImpl.NEXT)) {
				cal.add(Calendar.DATE, (daysInMonth));
			} else if (way.equals(ScheduleServiceImpl.BACK)) {
				cal.add(Calendar.DATE, -(daysInMonth));
			}

			Date dt = cal.getTime();

			reportDate = DateUtil.getFormattedDate(dt,
					DateUtil.SCHEDULE_DATEPICKER_FORMAT, loc);

		} catch (Exception e) {
			e.printStackTrace();
		}

		dayDuration[ScheduleUtil.month] = reportDate;
		return dayDuration;
	}
}
