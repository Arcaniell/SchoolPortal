package school.dao.implementation;

import org.springframework.stereotype.Repository;

import school.dao.RoleRequestDao;
import school.model.RoleRequest;

@Repository
public class RoleRequestDaoImpl extends BaseDaoImpl<RoleRequest, Long> implements RoleRequestDao{

	public RoleRequestDaoImpl() {
		super(RoleRequest.class);
	}

}
