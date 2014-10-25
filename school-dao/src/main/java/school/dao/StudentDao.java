package school.dao;

import java.util.List;

import school.model.Student;

public interface StudentDao extends BaseDao<Student> {
    List<Student> findAllByStatus(boolean value);

    Student findByUserId(long id);

}
