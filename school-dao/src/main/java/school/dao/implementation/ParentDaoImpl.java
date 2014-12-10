package school.dao.implementation;

import java.util.List;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import school.dao.ParentDao;
import school.model.Parent;
import school.model.User;

@Repository
public class ParentDaoImpl extends BaseDaoImpl<Parent, Long> implements
		ParentDao {

	public ParentDaoImpl() {
		super(Parent.class);
	}

	@Transactional
	public Parent findByUserId(long userId) {
		try {
			return (Parent) entityManager.createNamedQuery(Parent.FIND_BY_USER)
					.setParameter("userId", userId).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

    @SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<User> findAllUsers() {
		
		return entityManager.createQuery("select p.userId from Parent p").getResultList();
	}

}
