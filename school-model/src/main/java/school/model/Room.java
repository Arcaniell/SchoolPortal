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
