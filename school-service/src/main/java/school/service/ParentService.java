package school.service;

import java.util.List;

import school.model.Parent;

public interface ParentService {
	
	List<Parent> getAllParentsOfGroup(String group);
}
