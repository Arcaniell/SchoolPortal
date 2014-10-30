package school.dao;

import java.util.List;

import school.model.Room;

public interface RoomDao extends BaseDao<Room, Integer>{
	Room findByRoomNumber (int roomNumber);
	List<Room> findByRoomAvailable (boolean availability);
	List<Room> findByRoomSize (int size);
}
