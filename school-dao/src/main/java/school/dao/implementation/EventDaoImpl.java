package school.dao.implementation;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.EventDao;
import school.model.Event;

@Repository
public class EventDaoImpl extends BaseDaoImpl<Event, Long> implements EventDao {

	public EventDaoImpl() {
		super(Event.class);
	}

	@Transactional
	public Event findEventBySchedule(long scheduleId) {
		try {
			return (Event) entityManager
					.createNamedQuery(Event.FIND_BY_SCHEDULE)
					.setParameter("scheduleId", scheduleId).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
