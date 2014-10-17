package school.dao.session.implementation;

import java.util.Set;

import school.dao.StudentDao;
import school.model.Student;

public class StudentDaoImpl extends BaseDaoImpl<Student> implements StudentDao{
	StudentDaoImpl(){
		super(Student.class);
	}

	public Set<Student> findArchived() {
		// TODO Auto-generated method stub
		return null;
	}

	public Set<Student> findActive() {
		// TODO Auto-generated method stub
		return null;
	}
}
