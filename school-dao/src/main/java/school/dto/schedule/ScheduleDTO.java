package school.dto.schedule;

public class ScheduleDTO {

	private GroupScheduleDTO group;
	private UserDTO teacher;
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
		result = prime * result + ((teacher == null) ? 0 : teacher.hashCode());
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
		if (teacher == null) {
			if (other.teacher != null)
				return false;
		} else if (!teacher.equals(other.teacher))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ScheduleDTO [groupNeme=" + group + ", teacherName=" + teacher
				+ ", courseName=" + course + ", roomNumb=" + room
				+ ", lessonNumb=" + lesson + ", dateOfLesson=" + date + "]";
	}

}
