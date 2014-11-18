package school.service;

import java.util.List;

import school.model.Role;
import school.model.User;

public interface RoleRequestService {

	void createRoleRequest(User user, List<Role> roles);

}
