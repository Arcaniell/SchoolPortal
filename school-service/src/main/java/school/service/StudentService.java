package school.service;

import java.util.List;

import school.model.Group;

public interface StudentService {

    List<Group> getStudentGoupsByUserId(long id);

}
