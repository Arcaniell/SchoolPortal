package school.dao;

import java.util.List;

import school.model.HomeTask;

public interface HomeTaskDao extends BaseDao<HomeTask, Long> {

	HomeTask findBySchedule(long scheduleId);

	HomeTask findByGroupAndSchedule(long groupId, long scheduleId);

}
