package school.service.implementation;

import java.util.Date;

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
	public RoleRequest createRoleRequest(User user, Integer roleId) {
		Role role = new Role();
		role.setId(roleId);
		RoleRequest roleRequest = new RoleRequest();
		roleRequest.setRole(role);
		roleRequest.setUser(user);
		roleRequest.setRequestDate(new Date());
		try{
			return roleRequestDao.update(roleRequest);
		}catch(Exception e){
			return null;
		}
		
	}
	

}
