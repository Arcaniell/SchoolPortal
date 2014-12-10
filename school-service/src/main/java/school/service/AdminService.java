package school.service;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.model.Role;
import school.model.RoleRequest;

public interface AdminService {

	@Secured(Role.Secured.ADMIN)
	List<RoleRequest> findAllNotConfirmedRoleRequests();
	@Secured(Role.Secured.ADMIN)
	RoleRequest findRoleRequest(long id);
	@Secured(Role.Secured.ADMIN)
	boolean addRoleToUser(long roleRequestId, long studentId);
}
