<<<<<<< HEAD
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
=======
package school.model;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Schedule {
	@Id
	@GeneratedValue
	private Integer id;
	@Column
	private Integer number;
	@Column
	private Calendar date;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "schedule")
	private List<Journal> journal;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "groupId")
	private Group group;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "teacherId")
	private Teacher teacher;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lessonId")
	private Lesson lesson;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roomId")
	private Room room;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subjectId")
	private Subject subject;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Calendar getDate() {
		return date;
	}
	public void setDate(Calendar date) {
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
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}

}
>>>>>>> 8474151b47f53d997a47385ac4d915dd349bfbf9
