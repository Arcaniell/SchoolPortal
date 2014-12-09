package school.service;

import java.util.List;

import school.model.Role;
import school.model.RoleRequest;
import school.model.User;

public interface RoleRequestService {

	void createRoleRequest(User user, List<Role> roles, Long groupId);
	RoleRequest findRoleRequest(long id); 
	boolean addRole(long roleRequestId, long studentId);
	List<RoleRequest> findAllNotConfirmedRoleRequests();

}
