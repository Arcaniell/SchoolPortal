package school.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Schedule")
public class Schedule {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="date")
	private Date date;
	
	@ManyToOne
	@JoinColumn(name="id")
	private Teacher teacher;
	
	@JoinColumn(name="lesson_id", referencedColumnName="id")
	private Lesson lesson;
	
	@JoinColumn(name="group_id", referencedColumnName="id")
	private Group group;
	
	@JoinColumn(name="subject_id", referencedColumnName="id")
	private Subject subject;

	@JoinColumn(name="room_id", referencedColumnName="id")
	private Room room;
	
	public void setScheduleId(int id){
		this.id = id;
	}
	
	public void setScheduleDate(Date date){
		this.date = date;
	}
	
	public void setScheduleTeacher(Teacher teacher){
		this.teacher = teacher;
	}
	
	public void setScheduleLesson(Lesson lesson){
		this.lesson = lesson;
	}
	
	public void setScheduleGroup(Group group){
		this.group = group;
	}
	
	public void setScheduleSubject(Subject subject){
		this.subject = subject;
	}
	
	public void setScheduleRoom(Room room){
		this.room = room;
	}
	public int getScheduleId(){
		return id;
	}
	
	public Date getScheduleDate(){
		return date;
	}
	
	public Teacher getScheduleTeacher(){
		return teacher;
	}
	
	public Lesson getScheduleLesson(){
		return lesson;
	}
	
	public Group getScheduleGroup(){
	    return group; 
	}

	public Subject getScheduleSubject(){
		return subject;
	}
	
	public Room getScheduleRoom(){
		return room;
	}
}
