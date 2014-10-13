package school.dao;


public interface BaseDao <Entity>{
	Entity findById(Entity entity);
	void save(Entity entity);
	void remove(Entity entity);
	Entity update(Entity entity);

}
