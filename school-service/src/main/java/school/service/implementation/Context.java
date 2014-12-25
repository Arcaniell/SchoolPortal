package school.service.implementation;

import java.util.Locale;

import school.service.Strategy;




class Context {
	private Strategy strategy;

	public Context() {
	}

	public void setStrategy(Strategy strategy) {
		this.strategy = strategy;
	}

	public String[] executeStrategy(String[] dayDuration, String way,
			Locale loc) {

		return strategy.findStartDuration(dayDuration, way, loc);
	}
}
