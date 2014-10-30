package school.dao.implementation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import school.dao.BaseDao;


public abstract class BaseDaoImpl<E> implements BaseDao<E>{
	private Class<E> entityClass;
	
	public BaseDaoImpl(Class<E> entityClass) {
		super();
		this.entityClass = entityClass;
	}
	
	@PersistenceContext(name = "primary")
	EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public E findById(long id) {
		return (E) entityManager.createQuery("select e from "+entityClass.getSimpleName()
				+" e where e.id = :id")
				.setParameter("id", id).getSingleResult();
	}
	@Transactional
	public void save(E entity) {
		entityManager.persist(entity);
		entityManager.flush();
	}
	@Transactional
	public void remove(E entity) {
		entityManager.remove(entityManager.merge(entity));
	}
	@Transactional
	public E update(E entity) {
		return entityManager.merge(entity);
	}

	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		return entityManager.createQuery("from "+entityClass.getSimpleName()).getResultList();
	}

}
