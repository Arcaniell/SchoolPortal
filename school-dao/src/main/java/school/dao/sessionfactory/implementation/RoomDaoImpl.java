package school.dao.sessionfactory.implementation;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

import school.dao.RoomDao;
import school.model.Room;


public class RoomDaoImpl extends BaseDaoImpl<Room> implements RoomDao{
	private Session session;
	
	public RoomDaoImpl() {
		super(Room.class);
		
	}
	public Room findByRoomNumber(int roomNumber) {
		Room room = null;
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			room = (Room) session.createQuery(Room.FIND_BY_ROOM_NUMBER_QUERY).
					setInteger("roomNumber", roomNumber).uniqueResult();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return room;
	}
	
	@SuppressWarnings("unchecked")
	public List<Room> findByRoomSize(int size) {
		List<Room> rooms = new ArrayList<Room>();
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			rooms = (List<Room>) session.createQuery(Room.FIND_BY_ROOM_SIZE_QUERY).
					setInteger("size", size).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return rooms;
	}
	@SuppressWarnings("unchecked")
	public List<Room> findByRoomAvailable(boolean availability) {
		List<Room> rooms = new ArrayList<Room>();
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			rooms = (List<Room>) session.createQuery(Room.FIND_BY_AVAILABLE_ROOM_QUERY).
					setBoolean("available", availability).list();
			transaction.commit();
		} finally {
			if ((session != null) && (session.isOpen())) {
				session.close();
			}
		}
		return rooms;
	}
}
