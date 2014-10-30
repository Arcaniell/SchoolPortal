package school.dao;

import java.util.List;

import school.model.Teacher;

public interface TeacherDao extends BaseDao<Teacher, Long> {
    List<Teacher> findAllByStatus(boolean status);

    List<Teacher> findAllInRateRange(int from, int till);

    Teacher findByUserId(long id);

}
