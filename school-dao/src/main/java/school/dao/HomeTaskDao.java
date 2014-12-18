package school.dao;

import school.model.HomeTask;

public interface HomeTaskDao extends BaseDao<HomeTask, Long> {

	HomeTask findBySchedule(long scheduleId);

}