package school.dao;

import school.model.RegistrationData;

public interface RegistrationDataDao extends BaseDao<RegistrationData, Long>{
	
	RegistrationData findByUserAndCode(long userId, int code);
}
