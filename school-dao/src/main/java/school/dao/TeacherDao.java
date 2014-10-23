package school.dao;

import java.util.Set;

import school.model.Teacher;

public interface TeacherDao extends BaseDao<Teacher> {
    Set<Teacher> findAllByRate(int rate);

    Teacher findByUserId(long id);

}
