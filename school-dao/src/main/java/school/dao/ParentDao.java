package school.dao;

import java.util.List;

import school.model.Parent;
import school.model.User;

public interface ParentDao extends BaseDao<Parent, Long> {

	Parent findByUserId(long userId);

}
