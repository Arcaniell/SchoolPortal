package school.dao.implementation;

import java.util.Date;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.LessonDao;
import school.model.Lesson;

@Repository
public class LessonDaoImpl extends BaseDaoImpl<Lesson, Long> implements
		LessonDao {

	public LessonDaoImpl() {
		super(Lesson.class);
	}

	@Transactional
	public Lesson findByStartTime(Date startTime) {
		try {
			return (Lesson) entityManager
					.createNamedQuery(Lesson.FIND_BY_START_TIME)
					.setParameter("startTime", startTime).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public Lesson findByCurrentTime(Date currentTime) {
		try {
			return (Lesson) entityManager
					.createNamedQuery(Lesson.FIND_BY_CURRENT_TIME)
					.setParameter("currentTime", currentTime).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
