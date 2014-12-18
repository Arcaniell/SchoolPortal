package school.dao.implementation;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.HomeTaskDao;
import school.model.HomeTask;

@Repository
public class HomeTaskDaoImpl extends BaseDaoImpl<HomeTask, Long> implements
		HomeTaskDao {

	public HomeTaskDaoImpl() {
		super(HomeTask.class);
	}

	@Transactional
	public HomeTask findBySchedule(long scheduleId) {
		try {
			return (HomeTask) entityManager
					.createNamedQuery(HomeTask.FIND_BY_SCHEDULE)
					.setParameter("scheduleId", scheduleId).getSingleResult();
		} catch (NoResultException e) {
			return new HomeTask();
		}
	}

}