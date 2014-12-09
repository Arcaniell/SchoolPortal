package school.service.implementation;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.ParentDao;
import school.dao.RoleRequestDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.model.Group;
import school.model.Parent;
import school.model.Role;
import school.model.RoleRequest;
import school.model.Student;
import school.model.Teacher;
import school.model.User;
import school.service.RoleRequestService;

@Service
public class RoleRequestServiceImpl implements RoleRequestService {

	@Autowired
	private RoleRequestDao roleRequestDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private ParentDao parentDao;
	@Autowired
	private TeacherDao teacherDao;
	

	@Override
	public void createRoleRequest(User user, List<Role> roles, Long groupId) {
		for (Role role : roles) {
			RoleRequest roleRequest = new RoleRequest();
			roleRequest.setRole(role);
			roleRequest.setUser(user);
			roleRequest.setRequestDate(new Date());
			if (groupId != 0) {
				Group group = new Group();
				group.setId(groupId);
				roleRequest.setGroup(group);
			}
			roleRequestDao.update(roleRequest);
		}
	}

	@Override
	public RoleRequest findRoleRequest(long id) {
		return roleRequestDao.findById(id);
	}

	@Override
	public boolean addRole(long roleRequestId, long studentId) {
		RoleRequest roleRequest = roleRequestDao.findById(roleRequestId);
		switch (roleRequest.getRole().getName()) {
		case Role.Secured.STUDENT: {

			Student student = new Student();
			student.setGroup(roleRequest.getGroup());
			student.setActive(true);
			student.setUser(roleRequest.getUser());
			studentDao.update(student);
			roleRequest.setConfirmed(true);
			roleRequestDao.update(roleRequest);
			return true;

		}
		case Role.Secured.PARENT: {

			Parent parent = new Parent();
			parent.setUserId(roleRequest.getUser());
			Student student = studentDao.findById(studentId);
			student.getParents().add(parent);
			studentDao.update(student);
			roleRequest.setConfirmed(true);
			roleRequestDao.update(roleRequest);
			return true;

		}
		case Role.Secured.TEACHER: {

			Teacher teacher = new Teacher();
			teacher.setActive(true);
			teacher.setRate(1);
			teacher.setUser(roleRequest.getUser());
			teacherDao.update(teacher);
			roleRequest.setConfirmed(true);
			roleRequestDao.update(roleRequest);
			return true;

		}

		default:
			return false;
		}
	}

	@Override
	public List<RoleRequest> findAllNotConfirmedRoleRequests() {
		return roleRequestDao.findAllRoleRequests(false);
	}

}
