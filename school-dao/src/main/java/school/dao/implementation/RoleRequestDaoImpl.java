package school.dao.implementation;

import school.dao.RoleRequestDao;
import school.model.RoleRequest;

public class RoleRequestDaoImpl extends BaseDaoImpl<RoleRequest> implements RoleRequestDao{

	public RoleRequestDaoImpl() {
		super(RoleRequest.class);
	}

}
