package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Group;

public interface GroupDao extends BaseDao<Group, Long> {

    List<Group> findAllByTeacherIdCourseIdDataRange(long teacherId, long courseId, Date from,
            Date till);

    List<Group> findAllByTeacherIdDataRange(long teacherId, Date from, Date till);

    List<Group> findAllNotAdditional();

    List<Group> findByCourseId(long courseId);

    Group findByNumberAndLetter(byte number, char letter);
}
