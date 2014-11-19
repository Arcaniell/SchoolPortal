package school.service.implementation;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.RoleRequestDao;
import school.model.Role;
import school.model.RoleRequest;
import school.model.User;
import school.service.RoleRequestService;

@Service
public class RoleRequestServiceImpl implements RoleRequestService{
	
	@Autowired
	private RoleRequestDao roleRequestDao;

	@Override
	public void createRoleRequest(User user, List<Role> roles) {
		for(Role role : roles){
		RoleRequest roleRequest = new RoleRequest();
		roleRequest.setRole(role);
		roleRequest.setUser(user);
		roleRequest.setRequestDate(new Date());
		roleRequestDao.update(roleRequest);
		}
	}
	

}
