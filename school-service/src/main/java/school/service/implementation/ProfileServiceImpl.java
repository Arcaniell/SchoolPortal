package school.service.implementation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import school.service.utils.DateUtil;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	UserService userService;
	@Autowired
	ParentDao parentDao;
	@Autowired
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
		profileDTO.setBirthday(DateUtil.getFormattedDate(user.getBirthday(), DateUtil.SHORT, Locale.ENGLISH));
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
				profileDTO.setFamily(parents);
				if (profileDTO.getFamily().size() == 1)
					profileDTO.setProfileFamilyDescription("Parent");
				else if (profileDTO.getFamily().size() > 1)
					profileDTO.setProfileFamilyDescription("Parents");
				profileDTO.setProfileRole(generateStudentProfileRole(student));

			}
				break;
			case "ROLE_PARENT": {
				Parent parent = parentDao.findByUserId(user.getId());
				List<ProfileDTO> chieldren = new ArrayList<ProfileDTO>();
				for (Student student : parent.getStudents()) {
					ProfileDTO chieldrenDTO = generalProfileInformation(student
							.getUser());
					chieldrenDTO
							.setProfileRole(generateStudentProfileRole(student));
					chieldren.add(chieldrenDTO);
				}
				profileDTO.setFamily(chieldren);
				if (profileDTO.getFamily().size() == 1)
					profileDTO.setProfileFamilyDescription("Chield");
				else if (profileDTO.getFamily().size() > 1)
					profileDTO.setProfileFamilyDescription("Children");
				profileDTO.setProfileRole(generateParentProfileRole(parent));

			}
				break;

			default:
				break;
			}

			if (profileRolePriority < rolePriority.get(role.getName()))
				profileRolePriority = rolePriority.get(role.getName());
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

	private String generateStudentProfileRole(Student student) {
		return "Student of " + student.getGroup().getNumber() + " "
				+ student.getGroup().getLetter();
	}

	private String generateParentProfileRole(Parent parent) {
		return "Parent";
	}

}
