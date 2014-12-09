package school.service.implementation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.GroupDao;
import school.model.Group;
import school.model.Parent;
import school.model.Student;
import school.service.ParentService;

@Service
public class ParentServiceImpl implements ParentService {
	
	@Autowired
	private GroupDao groupDao;

	@Transactional
	@Override
	public List<Parent> getAllParentsOfGroup(String group) {
		byte number = Byte.valueOf(group.split("-")[0].trim());
		char letter = group.split("-")[1].trim().charAt(0);
		Group ourGroup = groupDao.findByNumberAndLetter(number, letter);
		List<Student> students = ourGroup.getStudent();
		List<Parent> parents = new ArrayList<Parent>();
		for(Student s:students) {
			for(Parent p:s.getParents()) {
				parents.add(p);
			}
		}
		return parents;
	}
	
	
}
