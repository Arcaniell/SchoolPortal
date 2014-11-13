package school.dao;


import java.util.Date;
import java.util.List;


import school.model.Group;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;

public interface ScheduleDao extends BaseDao<Schedule, Long> {

//List<Schedule> findByCourse (Course course);
//List<Schedule> findByLesson (Lesson lesson);
//List<Schedule> findByTeacherGroupInterval (long teacherId, long groupId, Date from, Date till);
//List<Schedule> findByTeacherRoomInterval (long teacherId, long roomId, Date from, Date till);
//List<Schedule> findByGroupRoomInterval (long groupId, long roomId, Date from, Date till);
//List<Schedule> findByTeacherGroupRoomInterval (long teacherId, long groupId, long roomId, Date from, Date till);

List<Schedule> findByGroup (Group group); 
List<Schedule> findByRoom (Room room);
List<Schedule> findByTeacher (Teacher teacher);
List<Schedule> findByDates (Date from, Date till);
List<Schedule> findByTeacherInterval(long teacherId, Date from, Date till );
List<Schedule> findByGroupInterval(long groupId, Date from, Date till );
List<Schedule> findByRoomInterval(int roomId, Date from, Date till );
}
