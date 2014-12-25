package school.service;

import java.util.Locale;

public interface Strategy {
	String[] findStartDuration(String[] dayDuration, String way, Locale loc);
}