package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import school.dao.RoleRequestDao;
import school.model.RoleRequest;

@Repository
public class RoleRequestDaoImpl extends BaseDaoImpl<RoleRequest, Long> implements RoleRequestDao{

	public RoleRequestDaoImpl() {
		super(RoleRequest.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RoleRequest> findAllRoleRequests(boolean confirmed) {
		try{
			return entityManager.createNamedQuery(RoleRequest.FIND_BY_CONFIRMED)
					.setParameter("confirmed", confirmed).getResultList();
			}catch(NoResultException e){
				return null;
			}
	}

}
