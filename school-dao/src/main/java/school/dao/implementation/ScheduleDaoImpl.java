package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ScheduleDao;
import school.model.Group;
import school.model.Room;
import school.model.Schedule;
import school.model.Teacher;

@Repository
public class ScheduleDaoImpl extends BaseDaoImpl<Schedule, Long> implements
		ScheduleDao {

	public ScheduleDaoImpl() {
		super(Schedule.class);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByGroup(Group group) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_GROUP)
					.setParameter("group", group).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByRoom(Room room) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_ROOM)
					.setParameter("room", room).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByTeacher(Teacher teacher) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_TEACHER)
					.setParameter("teacher", teacher).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByDates(Date from, Date till) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_DATES)
					.setParameter("from", from).setParameter("till", till)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByTeacherInterval(long teacherId, Date from,
			Date till) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_TEACHER_INTERVAL)
					.setParameter("teacherId", teacherId)
					.setParameter("from", from).setParameter("till", till)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByGroupInterval(long groupId, Date from, Date till) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_GROUP_INTERVAL)
					.setParameter("groupId", groupId)
					.setParameter("from", from).setParameter("till", till)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByRoomInterval(int roomId, Date from, Date till) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_ROOM_INTERVAL)
					.setParameter("roomId", roomId).setParameter("from", from)
					.setParameter("till", till).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Schedule> findByGroupCourseInterval(long groupId,
			String courseName, Date from, Date till) {
		try {
			return (List<Schedule>) entityManager
					.createNamedQuery(Schedule.FIND_BY_GROUP_COURSE_INTERVAL)
					.setParameter("groupId", groupId)
					.setParameter("courseName", courseName)
					.setParameter("from", from).setParameter("till", till)
					.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public Schedule findByTeacherDateLesson(long teacherId, Date date,
			long lessonId) {
		try {
			return (Schedule) entityManager
					.createNamedQuery(Schedule.FIND_BY_TEACHER_DATE_LESSON)
					.setParameter("teacherId", teacherId)
					.setParameter("date", date)
					.setParameter("lessonId", lessonId).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
