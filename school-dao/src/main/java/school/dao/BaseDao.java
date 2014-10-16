package school.dao;

import java.util.List;


public interface BaseDao <E>{
	// E findById(E entity);
	void save(E entity);
	void remove(E entity);
	E update(E entity);
	List<E> findAll();
}
