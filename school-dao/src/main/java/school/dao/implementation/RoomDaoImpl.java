package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import school.dao.RoomDao;
import school.model.Room;

@Repository
public class RoomDaoImpl extends BaseDaoImpl<Room, Integer> implements RoomDao {

	public RoomDaoImpl() {
		super(Room.class);
	}

	@Transactional
	public Room findByRoomNumber(int roomNumber) {
		try {
			return (Room) entityManager.createNamedQuery(Room.FIND_BY_ROOM_NUMBER)
					.setParameter("roomNumber", roomNumber).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Room> findByRoomAvailable(boolean available) {
		try {
			return entityManager.createNamedQuery(Room.FIND_BY_AVAILABLE_ROOM)
					.setParameter("available", available).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Room> findByRoomSize(int size) {
		try {
			return entityManager.createNamedQuery(Room.FIND_BY_ROOM_SIZE)
					.setParameter("size", size).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

}
