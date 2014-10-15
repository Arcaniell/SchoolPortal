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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Lesson")
public class Lesson {

@Id
@Column(name="id", unique = true)
@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

@Column(name="startTime")
private Date startTime;

@OneToMany(fetch = FetchType.LAZY)
@JoinColumn(name="id")
private List<Schedule> listSchedule;

public void setLesId(int id){
	this.id = id;
}

public void setLesStartTime(Date startTime){
	this.startTime = startTime;
}

public void setListSchedule(List<Schedule> listSchedule){
	this.listSchedule = listSchedule;
}

public int getLesId() {
    return id;
}

public Date getLesStartTime(){
	return startTime;
}

public List<Schedule> getListSchedule() {
	return listSchedule;
}




}
