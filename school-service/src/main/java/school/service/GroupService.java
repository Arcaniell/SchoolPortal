package school.service;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.model.Group;
import school.model.Role;

public interface GroupService {

    @Secured(Role.Secured.STUDENT)
    List<Group> getStudentGoupsByUserId(long id);

}
