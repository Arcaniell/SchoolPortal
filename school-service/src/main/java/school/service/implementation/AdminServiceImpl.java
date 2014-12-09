package school.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.model.RoleRequest;
import school.service.AdminService;
import school.service.RoleRequestService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	RoleRequestService roleRequestService;

	@Override
	public List<RoleRequest> findAllNotConfirmedRoleRequests() {
		return roleRequestService.findAllNotConfirmedRoleRequests();
	}

	@Override
	public boolean addRoleToUser(long roleRequestId, long studentId) {
		return roleRequestService.addRole(roleRequestId, studentId);
	}

	@Override
	public RoleRequest findRoleRequest(long id) {
		return roleRequestService.findRoleRequest(id);
	}
	

}
