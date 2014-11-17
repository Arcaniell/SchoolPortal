package school.dao;

import school.model.RegistrationCode;

public interface RegistrationCodeDao extends BaseDao<RegistrationCode, Long>{
	
	RegistrationCode findByUserAndCode(long userId, int code);
}
