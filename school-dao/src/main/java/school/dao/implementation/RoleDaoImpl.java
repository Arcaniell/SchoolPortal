package school.dao.implementation;

import org.springframework.stereotype.Repository;

import school.dao.RoleDao;
import school.model.Role;

@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role, Integer> implements RoleDao{

	public RoleDaoImpl() {
		super(Role.class);
	}

}
