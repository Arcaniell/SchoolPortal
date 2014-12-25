package school.service.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.hibernate.sql.Select;

import school.service.ScheduleService.Duration;



public class ScheduleUtil {
	public static int month = 0;
	public static int day = 1;
	public static int year = 2;
	private static final String[] select={"Room", "Group", "Teacher", "All"};
	
	public static DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	public static DateFormat form = new SimpleDateFormat("MM/dd/yyyy");
	
	public static long idLongStr(String str) {
		if (str == null || str.equals(select[3]) || str.equals(select[0]) || str.equals(select[1]) || str.equals(select[2])) {
			return new Long(0);
		} else {
			return Long.parseLong(str);
		}
	}

	public static int idIntegStr(String str) {
		if (str == null || str.equals(select[3]) || str.equals(select[0]) || str.equals(select[1]) || str.equals(select[2])) {
			return 0;
		} else {
			return Integer.parseInt(str);
		}
	}
	
	public static Duration parseDrtn(String str){
		if(str == null){
			return Duration.week;
		} else{
			return Duration.valueOf(str);
		}
	}
	
	public static String formDateFrom (String dateFrom){
		if (dateFrom == null) {

			Calendar c = Calendar.getInstance();
			String date = form.format(c.getTime());
			
			return date;
			

		} else {
			return dateFrom;

		}
	}
	
	public static String getDateForSch( String dateFrom){
		if (dateFrom == null) {

			Calendar c = Calendar.getInstance();
			String date = formatter.format(c.getTime());

			return date;

		} else {

			String[] str = dateFrom.split("/");
			return str[day] + "-" + str[month] + "-" + str[year];

		}
	}
}
