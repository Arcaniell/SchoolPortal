package school.dao.implementation;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.transaction.annotation.Transactional;

import school.dao.HomeTaskDao;
import school.model.HomeTask;

public class HomeTaskDaoImpl extends BaseDaoImpl<HomeTask, Long> implements
		HomeTaskDao {

	public HomeTaskDaoImpl() {
		super(HomeTask.class);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<HomeTask> findByDate(Date date) {
		try {
			return entityManager.createNamedQuery(HomeTask.FIND_BY_DATE)
					.setParameter("date", date).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<HomeTask> findByGroup(long groupId) {
		try {
			return entityManager.createNamedQuery(HomeTask.FIND_BY_GROUP)
					.setParameter("groupId", groupId).getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public HomeTask findByGroupAndDate(long groupId, Date date) {
		try {
			return (HomeTask) entityManager
					.createNamedQuery(HomeTask.FIND_BY_GROUP_DATE)
					.setParameter("groupId", groupId)
					.setParameter("date", date).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
