package school.dao;

import java.util.List;

import school.model.RoleRequest;

public interface RoleRequestDao extends BaseDao<RoleRequest, Long>{
	public List<RoleRequest> findAllRoleRequests(boolean confirmed);
}
