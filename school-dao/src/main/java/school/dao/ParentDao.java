package school.dao;

import school.model.Parent;

public interface ParentDao extends BaseDao<Parent, Long> {

	Parent findByUserId(long userId);

}
