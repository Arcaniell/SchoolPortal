package school.dao;

import school.model.RestorePassword;

public interface RestorePasswordDao extends BaseDao<RestorePassword, Long> {

	RestorePassword findByUserAndCode(long userId, int code);
}
