package school.model;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Lesson")
public class Lesson {

@Id
@Column(name="id")
@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

@Column(name="startTime")
// в базі Datetime
private Date startTime;

public void setLesId(int id){
	this.id = id;
}

public void setLesStartTime(Date startTime){
	this.startTime = startTime;
}

public int getLesId() {
    return id;
}

public Date getLesStartTime(){
	return startTime;
}

}
