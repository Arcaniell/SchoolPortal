package school.dao.implementation;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import school.dao.RestorePasswordDao;
import school.model.RestorePassword;

@Repository
public class RestorePasswordDaoImpl extends BaseDaoImpl<RestorePassword, Long> implements RestorePasswordDao{

	public RestorePasswordDaoImpl() {
		super(RestorePassword.class);
	}

	@Override
	public RestorePassword findByUserAndCode(long userId, int code) {
		try{
			return (RestorePassword) entityManager.createNamedQuery(RestorePassword.FIND_BY_USER_AND_CODE)
					.setParameter("userId", userId)
					.setParameter("restoreCode", code)
					.getSingleResult();
			}catch(NoResultException e){
				return null;
			}
	}

}
