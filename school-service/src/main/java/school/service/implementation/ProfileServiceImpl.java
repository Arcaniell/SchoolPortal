package school.service.implementation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ParentDao;
import school.dao.StudentDao;
import school.dto.ProfileDTO;
import school.model.Parent;
import school.model.Role;
import school.model.Student;
import school.model.User;
import school.service.ProfileService;
import school.service.UserService;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Inject
	UserService userService;
	@Inject
	ParentDao parentDao;
	@Inject
	StudentDao studentDao;

	private Map<String, Integer> rolePriority;

	public ProfileServiceImpl() {
		super();
		int i = 0;
		rolePriority = new HashMap<String, Integer>();
		rolePriority.put("", i++);
		rolePriority.put("ROLE_ADMIN", i++);
		rolePriority.put("ROLE_PARENT", i++);
		rolePriority.put("ROLE_STUDENT", i++);
		rolePriority.put("ROLE_TEACHER", i++);
		rolePriority.put("ROLE_HEAD_TEACHER", i++);
		rolePriority.put("ROLE_DIRECTOR", i);
	}

	private ProfileDTO generalProfileInformation(User user) {
		ProfileDTO profileDTO = new ProfileDTO();
		profileDTO.setProfileName(user.getFirstName() + " "
				+ user.getLastName());
		profileDTO.setProfileId(user.getId());
		profileDTO.setProfileEmail(user.getEmail());
		return profileDTO;
	}

	@Override
	@Transactional
	public ProfileDTO loadProfile(long id) {
		User user = userService.loadUser(id);
		int profileRolePriority = 0;
		ProfileDTO profileDTO = generalProfileInformation(user);
		for (Role role : user.getRoles()) {
			
			switch (role.getName()) {
			case "ROLE_STUDENT": {
				Student student = studentDao.findByUserId(user.getId());
				List<ProfileDTO> parents = new ArrayList<ProfileDTO>();
				for (Parent parent : student.getParents()) {
					ProfileDTO parentDTO = generalProfileInformation(parent
							.getUserId());
					parentDTO.setProfileRole(generateParentProfileRole(parent));
					parents.add(parentDTO);
				}
				profileDTO.setParents(parents);
				profileDTO.setProfileRole(generateStudentProfileRole(student));

			}
				break;
			case "ROLE_PARENT": {
				Parent parent = parentDao.findByUserId(user.getId());
				List<ProfileDTO> chieldren = new ArrayList<ProfileDTO>();
				for (Student student : parent.getStudents()) {
					ProfileDTO chieldrenDTO = generalProfileInformation(student
							.getUser());
					chieldrenDTO.setProfileRole(generateStudentProfileRole(student));
					chieldren.add(chieldrenDTO);
				}
				profileDTO.setChieldren(chieldren);
				profileDTO.setProfileRole(generateParentProfileRole(parent));

			}
				break;

			default:
				break;
			}
			
			if (profileRolePriority < rolePriority
					.get(role.getName()))
				profileRolePriority = rolePriority
						.get(role.getName());
		}
		
		switch (profileRolePriority) {
		case 0:
			profileDTO.setProfileRole("");
			break;
		case 4:
			profileDTO.setProfileRole("Teacher");
			break;
		case 5:
			profileDTO.setProfileRole("Head Teacher");
			break;
		case 6:
			profileDTO.setProfileRole("Director");
			break;

		default:
			break;
		}
		
		return profileDTO;
	}
	private String generateStudentProfileRole(Student student){
		return "Student of "
				+ student.getGroup().getNumber() + " "
				+ student.getGroup().getLetter();
	}
	private String generateParentProfileRole(Parent parent){
		return "Parent";
	}

}
