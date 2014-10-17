package school.dao;

import java.util.Set;

import school.model.Student;

public interface StudentDao extends BaseDao<Student> {
	Set<Student> findArchived();

	Set<Student> findActive();

}
