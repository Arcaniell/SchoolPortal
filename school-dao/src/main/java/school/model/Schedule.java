package school.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SCHEDULE")
@NamedQueries({
		@NamedQuery(name = Schedule.FIND_BY_DATES, query = Schedule.FIND_BY_DATES_QUERY),
		@NamedQuery(name = Schedule.FIND_BY_GROUP, query = Schedule.FIND_BY_GROUP_QUERY),
//		@NamedQuery(name = Schedule.FIND_BY_ROOM, query = Schedule.FIND_BY_ROOM_QUERY),
		@NamedQuery(name = Schedule.FIND_BY_TEACHER, query = Schedule.FIND_BY_TEACHER_QUERY),
		
  //  	@NamedQuery(name = Schedule.FIND_BY_GROUP_ID, query = Schedule.FIND_BY_GROUP_ID_QUERY),
	
    	@NamedQuery(name = Schedule.FIND_BY_ROOM, query = Schedule.FIND_BY_ROOM_QUERY),
		
  //  	@NamedQuery(name = Schedule.FIND_BY_TEACHER_ID, query = Schedule.FIND_BY_TEACHER_ID_QUERY),
		
    	@NamedQuery(name = Schedule.FIND_BY_TEACHER_INTERVAL, query = Schedule.FIND_BY_TEACHER_INTERVAL_QUERY),
		@NamedQuery(name = Schedule.FIND_BY_ROOM_INTERVAL, query = Schedule.FIND_BY_ROOM_INTERVAL_QUERY),
		@NamedQuery(name = Schedule.FIND_BY_GROUP_INTERVAL, query = Schedule.FIND_BY_GROUP_INTERVAL_QUERY),
		@NamedQuery(name = Schedule.FIND_BY_GROUP_COURSE_INTERVAL, query = Schedule.FIND_BY_GROUP_COURSE_INTERVAL_QUERY), })
public class Schedule implements Comparable<Schedule> {

	public static final String FIND_BY_DATES = "Schedule.findByDates";
	public static final String FIND_BY_DATES_QUERY = "SELECT sch FROM Schedule sch WHERE sch.date BETWEEN :from AND :till";

	public static final String FIND_BY_GROUP_COURSE_INTERVAL = "Schedule.findByGroupCourseInterval";
	public static final String FIND_BY_GROUP_COURSE_INTERVAL_QUERY = "SELECT sch FROM Schedule sch WHERE sch.group.id = :groupId AND sch.course.courseName = :courseName AND sch.date BETWEEN :from AND :till";

	public static final String FIND_BY_GROUP = "Schedule.findByGroup";
	public static final String FIND_BY_GROUP_QUERY = "SELECT sch FROM Schedule sch WHERE sch.group = :group";

//	public static final String FIND_BY_ROOM = "Schedule.findByRoom";
//	public static final String FIND_BY_ROOM_QUERY = "SELECT sch FROM Schedule sch WHERE sch.room = :room";

	public static final String FIND_BY_TEACHER = "Schedule.findByTeacher";
	public static final String FIND_BY_TEACHER_QUERY = "SELECT sch FROM Schedule sch WHERE sch.teacher = :teacher";

//	public static final String FIND_BY_GROUP_ID = "Schedule.findByGroup";
//	public static final String FIND_BY_GROUP_ID_QUERY = "SELECT sch FROM Schedule sch WHERE sch.group.id = :groupId";
	
	public static final String FIND_BY_ROOM = "Schedule.findByRoom";
	public static final String FIND_BY_ROOM_QUERY = "SELECT sch FROM Schedule sch WHERE sch.room.id = :roomId";
	
//	public static final String FIND_BY_TEACHER_ID = "Schedule.findByTeacher";
//	public static final String FIND_BY_TEACHER_ID_QUERY = "SELECT sch FROM Schedule sch WHERE sch.teacher.id = :teacherId";
	
	
	
	public static final String FIND_BY_TEACHER_INTERVAL = "Schedule.findByTeacherInterval";
	public static final String FIND_BY_TEACHER_INTERVAL_QUERY = "SELECT sch FROM Schedule sch WHERE sch.teacher.id = :teacherId AND sch.date  BETWEEN :from AND :till";

	public static final String FIND_BY_ROOM_INTERVAL = "Schedule.findByRoomInterval";
	public static final String FIND_BY_ROOM_INTERVAL_QUERY = "SELECT sch FROM Schedule sch WHERE sch.room.id = :roomId AND sch.date  BETWEEN :from AND :till";

	public static final String FIND_BY_GROUP_INTERVAL = "Schedule.findGroupInterval";
	public static final String FIND_BY_GROUP_INTERVAL_QUERY = "SELECT sch FROM Schedule sch WHERE sch.group.id = :groupId AND sch.date  BETWEEN :from AND :till";

	// public static final String FIND_BY_COURSE_QUERY =
	// "SELECT sch FROM Schedule sch WHERE sch.course = :course";
	// public static final String FIND_BY_LESSON_QUERY =
	// "SELECT sch FROM Schedule sch WHERE sch.lesson = :lesson";
	// public static final String FIND_BY_TEACHER_GROUP_INTERVAL_QUERY =
	// "SELECT sch FROM Schedule sch WHERE sch.teacher.id = :teacherId AND sch.group.id = :groupId AND sch.date  BETWEEN :from AND :till";
	// public static final String FIND_BY_TEACHER_ROOM_INTERVAL_QUERY =
	// "SELECT sch FROM Schedule sch WHERE sch.teacher.id = :teacherId AND sch.room.id = :roomId AND sch.date  BETWEEN :from AND :till";
	// public static final String FIND_BY_GROUP_ROOM_INTERVAL_QUERY =
	// "SELECT sch FROM Schedule sch WHERE sch.group.id = :groupId AND sch.room.id = :roomId AND sch.date  BETWEEN :from AND :till";
	// public static final String FIND_BY_TEACHER_GROUP_ROOM_INTERVAL_QUERY =
	// "SELECT sch FROM Schedule sch WHERE sch.teacher.id = :teacherId AND sch.group.id = :groupId AND sch.room.id =:roomId AND sch.date  BETWEEN :from AND :till";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false)
	private Date date;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "schedule")
	private List<Journal> journal;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, name = "groupId")
	private Group group;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, name = "teacherId")
	private Teacher teacher;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, name = "lessonId")
	private Lesson lesson;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, name = "roomId")
	private Room room;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false, name = "courseId")
	private Course course;

	public Schedule() {
		super();

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<Journal> getJournal() {
		return journal;
	}

	public void setJournal(List<Journal> journal) {
		this.journal = journal;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public int compareTo(Schedule schedule) {
		if (this.date.getTime() < schedule.getDate().getTime()) {
			return -1;
		} else if (this.date.getTime() > schedule.getDate().getTime()) {
			return 1;
		}
		return this.lesson.getId()
				.compareTo(schedule.getLesson().getId());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((course == null) ? 0 : course.hashCode());
		result = prime * result + ((date == null) ? 0 : date.hashCode());
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((journal == null) ? 0 : journal.hashCode());
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
		Schedule other = (Schedule) obj;
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
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (journal == null) {
			if (other.journal != null)
				return false;
		} else if (!journal.equals(other.journal))
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

}
