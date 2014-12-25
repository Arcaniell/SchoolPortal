package school.service;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import school.dto.journal.JournalSearch;
import school.dto.schedule.GroupScheduleDTO;
import school.dto.schedule.RoomDTO;
import school.dto.schedule.ScheduleDTO;
import school.dto.schedule.SchedulePerGroupDTO;
import school.dto.schedule.UserDTO;
import school.model.Group;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;

public interface ScheduleService {

	public enum Duration {

		day, week, month;

		@Override
		public String toString() {

			return super.toString();
		}
	}

	public List<Schedule> findByDates(Date from, Date till);

	public List<Schedule> current(long teacherId, int roomId, long groupId,
			String date, Duration duaration);

	public List<Teacher> allTeacher();

	public List<Room> allRoom();

	public List<Group> allGroup();

	public Set<String> intervalForHeader(List<Schedule> schedule, Locale loc);

	public List<ScheduleDTO> getScheduleDto(List<Schedule> schedule,
			Locale loc, boolean isAvtor);

	public List<SchedulePerGroupDTO> sortScheduleForTable(
			List<ScheduleDTO> schDto, Set<String> dates);

	public List<GroupScheduleDTO> getGroupName(List<Group> groups, String id);

	public List<RoomDTO> getRoomName(List<Room> room, String id);

	public List<UserDTO> getTeacherName(List<Teacher> teacher, String id);

	public String[] getScheduleWithWay(String[] dayDuration, String way,
			Locale loc);

	List<Schedule> getSchedulesByRole(long userId, String string);

	List<Schedule> getSchedulesForStudentMarks(JournalSearch search, Group group);

	List<Schedule> getSchedulesByRoleAndSubject(long userId, String role,
			String subject);

}
