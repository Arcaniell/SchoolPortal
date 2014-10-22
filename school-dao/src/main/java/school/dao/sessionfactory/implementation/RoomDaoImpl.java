package school.dao.sessionfactory.implementation;

import java.util.HashSet;
import java.util.Set;

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
	public Set<Room> findByRoomSize(int size) {
		Set<Room> rooms = new HashSet<Room>();
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			rooms = (Set<Room>) session.createQuery(Room.FIND_BY_ROOM_SIZE_QUERY).
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
	public Set<Room> findByRoomAvailable(boolean availability) {
		Set<Room> rooms = new HashSet<Room>();
		try {
			session = HibernateSessionFactory.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			rooms = (Set<Room>) session.createQuery(Room.FIND_BY_AVAILABLE_ROOM_QUERY).
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
