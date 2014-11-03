package school.dao;

import java.util.List;

import school.model.Student;

public interface StudentDao extends BaseDao<Student, Long> {
    List<Student> findAllByStatus(boolean value);
    Student findById(long id);
    Student findByUserId(long id);

}
