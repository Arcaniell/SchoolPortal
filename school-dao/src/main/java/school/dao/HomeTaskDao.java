package school.dao;

import java.util.Date;
import java.util.List;

import school.model.HomeTask;

public interface HomeTaskDao extends BaseDao<HomeTask, Long> {

	List<HomeTask> findByDate(Date date);

	List<HomeTask> findByGroup(long groupId);

	HomeTask findByGroupAndDate(long groupId, Date date);

}
