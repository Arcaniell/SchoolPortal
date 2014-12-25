package school.dto.schedule;

public class ScheduleDTO {

	private GroupScheduleDTO group;
	private UserDTO teacher;
	private long userId;
	private long scheduleId;

	public ScheduleDTO(GroupScheduleDTO group, UserDTO teacher, long userId,
			long scheduleId, boolean loginned, CourseScheduleDTO course,
			RoomDTO room, LessonDTO lesson, String date) {
		super();
		this.group = group;
		this.teacher = teacher;
		this.userId = userId;
		this.scheduleId = scheduleId;
		this.loginned = loginned;
		this.course = course;
		this.room = room;
		this.lesson = lesson;
		this.date = date;
	}

	public boolean isLoginned() {
		return loginned;
	}

	public void setLoginned(boolean loginned) {
		this.loginned = loginned;
	}

	private boolean loginned;

	public ScheduleDTO(GroupScheduleDTO group, UserDTO teacher, long userId,
			long scheduleId, CourseScheduleDTO course, RoomDTO room,
			LessonDTO lesson, String date) {
		super();
		this.group = group;
		this.teacher = teacher;
		this.userId = userId;
		this.scheduleId = scheduleId;
		this.course = course;
		this.room = room;
		this.lesson = lesson;
		this.date = date;
	}

	public long getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	private CourseScheduleDTO course;
	private RoomDTO room;
	private LessonDTO lesson;

	private String date;

	public ScheduleDTO() {

	}

	public ScheduleDTO(GroupScheduleDTO groupNeme, LessonDTO lessonNumb,
			String dateOfLesson) {
		super();
		this.group = groupNeme;
		this.teacher = null;
		this.course = null;
		this.room = null;
		this.lesson = lessonNumb;

		this.date = dateOfLesson;
	}

	public ScheduleDTO(GroupScheduleDTO group, UserDTO teacher, long userId,
			CourseScheduleDTO course, RoomDTO room, LessonDTO lesson,
			String date) {
		super();
		this.group = group;
		this.teacher = teacher;
		this.userId = userId;
		this.course = course;
		this.room = room;
		this.lesson = lesson;
		this.date = date;
	}

	public ScheduleDTO(GroupScheduleDTO groupNeme, UserDTO teacherName,
			CourseScheduleDTO courseName, RoomDTO roomNumb,
			LessonDTO lessonNumb, String dateOfLesson) {
		super();
		this.group = groupNeme;
		this.teacher = teacherName;
		this.course = courseName;
		this.room = roomNumb;
		this.lesson = lessonNumb;

		this.date = dateOfLesson;
	}

	public GroupScheduleDTO getGroup() {
		return group;
	}

	public void setGroup(GroupScheduleDTO groupNeme) {
		this.group = groupNeme;
	}

	public UserDTO getTeacher() {
		return teacher;
	}

	public void setTeacher(UserDTO teacherName) {
		this.teacher = teacherName;
	}

	public CourseScheduleDTO getCourse() {
		return course;
	}

	public void setCourse(CourseScheduleDTO courseName) {
		this.course = courseName;
	}

	public RoomDTO getRoom() {
		return room;
	}

	public void setRoom(RoomDTO roomNumb) {
		this.room = roomNumb;
	}

	public LessonDTO getLesson() {
		return lesson;
	}

	public void setLesson(LessonDTO lessonNumb) {
		this.lesson = lessonNumb;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String dateOfLesson) {
		this.date = dateOfLesson;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((course == null) ? 0 : course.hashCode());
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + ((lesson == null) ? 0 : lesson.hashCode());
		result = prime * result + ((room == null) ? 0 : room.hashCode());
		result = prime * result + (int) (scheduleId ^ (scheduleId >>> 32));
		result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
		result = prime * result + (int) (userId ^ (userId >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ScheduleDTO other = (ScheduleDTO) obj;
		if (course == null) {
			if (other.course != null)
				return false;
		} else if (!course.equals(other.course))
			return false;
		if (date == null) {
			if (other.date != null)
				return false;
		} else if (!date.equals(other.date))
			return false;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (lesson == null) {
			if (other.lesson != null)
				return false;
		} else if (!lesson.equals(other.lesson))
			return false;
		if (room == null) {
			if (other.room != null)
				return false;
		} else if (!room.equals(other.room))
			return false;
		if (scheduleId != other.scheduleId)
			return false;
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ScheduleDTO [group=" + group + ", teacher=" + teacher
				+ ", userId=" + userId + ", scheduleId=" + scheduleId
				+ ", course=" + course + ", room=" + room + ", lesson="
				+ lesson + ", date=" + date + "]";
	}

}
