package school.service.implementation;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;



import school.service.Strategy;
import school.service.utils.DateUtil;
import school.service.utils.ScheduleUtil;

class WeekDurationStrategy implements Strategy {
	public String[] findStartDuration(String[] dayDuration, String way,
			Locale loc) {
		String reportDate = "";
		String df = ScheduleUtil.getDateForSch(dayDuration[0]);

		String[] arr = df.split("-");
		String str = arr[ScheduleUtil.month] + "-" + arr[ScheduleUtil.day] + "-" + arr[ScheduleUtil.year];

		try {

			Date date = DateUtil.getFormattedDate(str,
					DateUtil.SCHEDULE_DATE_FORMAT);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);

			if (way.equals(ScheduleServiceImpl.NEXT)) {
				cal.add(Calendar.DATE, +7);
			} else if (way.equals(ScheduleServiceImpl.BACK)) {

				cal.add(Calendar.DATE, -7);
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

