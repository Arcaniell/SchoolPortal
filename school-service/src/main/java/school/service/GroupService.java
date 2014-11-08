package school.service;

import java.util.List;

import school.model.Group;

public interface GroupService {

    List<Group> getStudentGoupsByUserId(long id);

}
