package school.service;

import school.model.RoleRequest;
import school.model.User;

public interface RoleRequestService {

	RoleRequest createRoleRequest(User user, Integer roleId);
	
}
