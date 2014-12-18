package school.dao;

import school.model.Event;

public interface EventDao extends BaseDao<Event, Long> {
	
	Event findEventBySchedule (long scheduleId);
	
}
