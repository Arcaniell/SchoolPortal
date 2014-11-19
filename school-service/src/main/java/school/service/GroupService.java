package school.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.dto.GroupDTO;
import school.model.Course;
import school.model.Group;
import school.model.Role;
import school.model.Student;

/**
 * @author Blowder
 */
public interface GroupService {

    // @Secured(Role.Secured.STUDENT)
    List<Group> getStudentGroupsByUserId(long id);

    void createAdditionGroup(List<Student> students, Course course, Date from,
            Date till);

    List<GroupDTO> getStudentGroups(Principal user);

    List<GroupDTO> getTeacherGroups(Principal user, Date from, Date till);

    List<GroupDTO> getHeadTeacherGroups();

}
