package school.dao;

import java.util.Set;

import school.model.Room;

public interface RoomDao extends BaseDao<Room>{
	Room findByRoomNumber (int roomNumber);
	Set<Room> findByRoomAvailable (boolean availability);
	Set<Room> findByRoomSize (int size);
}
