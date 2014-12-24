package school.service;

import java.util.List;

import school.model.Parent;
import school.model.User;

public interface ParentService {
	
	List<Parent> getAllParentsOfGroup(String group);

	Parent findByUserId(User user);
}
