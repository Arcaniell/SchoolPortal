package school.service;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import school.model.Group;

public interface GroupService {

    @Secured("ROLE_STUDENT")
    List<Group> getStudentGoupsByUserId(long id);

}
