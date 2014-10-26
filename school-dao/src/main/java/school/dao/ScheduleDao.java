package school.dao;


import java.util.Date;
import java.util.List;


import school.model.Group;
import school.model.Lesson;
import school.model.Room;
import school.model.Schedule;
import school.model.Course;
import school.model.Teacher;

public interface ScheduleDao extends BaseDao<Schedule> {
List<Schedule> findByGroup (Group group); 
List<Schedule> findByCourse (Course course);
List<Schedule> findByRoom (Room room);
List<Schedule> findByTeacher (Teacher teacher);
List<Schedule> findByDates (Date from, Date till);
List<Schedule> findByLesson (Lesson lesson);
List<Schedule> findByTeacherGroup (Teacher teacher, Group group, Date from, Date till);
List<Schedule> findByTeacherRoom (Teacher teacher, Room room, Date from, Date till);
List<Schedule> findByGroupRoom (Group group, Room room, Date from, Date till);
List<Schedule> findByTeacherGroupRoom (Teacher teacher, Group group, Room room, Date from, Date till);
}
