package school.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class ControllersUtil {
    public static Date addOrDelDays(Date fch, int days) {
        Calendar cal = new GregorianCalendar();
        cal.setTimeInMillis(fch.getTime());
        cal.add(Calendar.DATE, days);
        return new Date(cal.getTimeInMillis());
    }
}
