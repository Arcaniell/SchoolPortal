package school.dao;

import java.util.List;

import school.model.Teacher;
import school.model.User;

public interface TeacherDao extends BaseDao<Teacher, Long> {

    Teacher findByUserId(long id);

    List<User> findAllUsers();

}
