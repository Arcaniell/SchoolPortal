package school.dao;

import java.util.Date;
import java.util.List;

import school.model.Group;
import school.model.Schedule;
import school.model.Teacher;

public interface ScheduleDao extends BaseDao<Schedule, Long> {

	List<Schedule> findByGroup(Group group);

	List<Schedule> findByTeacher(Teacher teacher);

	List<Schedule> findByDates(Date from, Date till);

	List<Schedule> findByTeacherInterval(long teacherId, Date from, Date till);

	List<Schedule> findByGroupInterval(long groupId, Date from, Date till);

	List<Schedule> findByRoomInterval(int roomId, Date from, Date till);

	List<Schedule> findByGroupCourseInterval(long groupId, String courseName,
			Date from, Date till);

	List<Schedule> findByRoom(int roomId);

}
