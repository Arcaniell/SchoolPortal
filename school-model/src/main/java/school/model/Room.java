<<<<<<< HEAD
package school.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Room")
public class Room {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="room_number")
	private int roomNumber;
	
	@Column(name="available")
	private boolean available;
	
	public void setRoomId(int id){
		this.id = id;
	}
	
	public void setRoomNumber(int roomNumber){
		this.roomNumber = roomNumber;
	}
	
	public void setRoomAvailable(boolean available){
		this.available = available;
	}
	
	public int getRoomId(){
		return id;
	}
	
	public int getRoomNumber(){
        return roomNumber;     	
	}
	
	public boolean getRoomAvailable(){
		return available;
	}

}
=======
package school.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Room {
	@Id
	@GeneratedValue
	private Integer id;
	@Column
	private int roomNumber;
	@Column
	private boolean available;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "room")
	private List<Schedule> schedule;

	public Room() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public List<Schedule> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<Schedule> schedule) {
		this.schedule = schedule;
	}

}
>>>>>>> 8474151b47f53d997a47385ac4d915dd349bfbf9
