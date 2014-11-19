package school.dao.implementation;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import school.dao.RegistrationDataDao;
import school.model.RegistrationData;
@Repository
public class RegistrationDataDaoImpl extends BaseDaoImpl<RegistrationData, Long> implements RegistrationDataDao{

	public RegistrationDataDaoImpl() {
		super(RegistrationData.class);
	}

	@Override
	public RegistrationData findByUserAndCode(long userId, int code) {
		try{
			return (RegistrationData) entityManager.createNamedQuery(RegistrationData.FIND_BY_USER_AND_CODE)
					.setParameter("userId", userId)
					.setParameter("registrationCode", code)
					.getSingleResult();
			}catch(NoResultException e){
				return null;
			}
	}

	@Override
	public RegistrationData findByUserQuestionAnswer(
			RegistrationData registrationData) {
		try{
			return (RegistrationData) entityManager.createNamedQuery(RegistrationData.FIND_BY_USER_QUESTION_ANSWER)
					.setParameter("userId", registrationData.getUser().getId())
					.setParameter("question", registrationData.getQuestion())
					.setParameter("answer", registrationData.getAnswer())
					.getSingleResult();
			}catch(NoResultException e){
				return null;
			}
	}

}
