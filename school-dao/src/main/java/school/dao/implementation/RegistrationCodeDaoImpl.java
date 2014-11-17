package school.dao.implementation;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import school.dao.RegistrationCodeDao;
import school.model.RegistrationCode;
@Repository
public class RegistrationCodeDaoImpl extends BaseDaoImpl<RegistrationCode, Long> implements RegistrationCodeDao{

	public RegistrationCodeDaoImpl() {
		super(RegistrationCode.class);
	}

	@Override
	public RegistrationCode findByUserAndCode(long userId, int code) {
		try{
			return (RegistrationCode) entityManager.createNamedQuery(RegistrationCode.FIND_BY_USER_AND_CODE)
					.setParameter("userId", userId)
					.setParameter("registrationCode", code)
					.getSingleResult();
			}catch(NoResultException e){
				return null;
			}
	}

}
