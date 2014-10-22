package school.dao;

import java.util.Set;


public interface BaseDao <E>{
	E findById(long id);
	void save(E entity);
	void remove(E entity);
	E update(E entity);
	Set<E> findAll();
	
	
}
