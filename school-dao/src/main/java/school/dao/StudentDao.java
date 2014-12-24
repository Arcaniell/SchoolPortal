package school.dao;

import java.util.List;

import school.model.Student;

public interface StudentDao extends BaseDao<Student, Long> {
    Student findByUserId(long id);
}
