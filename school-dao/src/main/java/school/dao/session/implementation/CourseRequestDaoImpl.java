package school.dao.session.implementation;

import java.util.Date;
import java.util.Set;

import school.dao.CourseRequestDao;
import school.model.CourseRequest;

public class CourseRequestDaoImpl extends BaseDaoImpl<CourseRequest> implements CourseRequestDao{
	CourseRequestDaoImpl(){
		super(CourseRequest.class);
	}

	public CourseRequest findByData(Date date) {
		// TODO Auto-generated method stub
		return null;
	}

	public Set<CourseRequest> findBetweenDates(Date from, Date till) {
		// TODO Auto-generated method stub
		return null;
	}

	public Set<CourseRequest> findArchived() {
		// TODO Auto-generated method stub
		return null;
	}

	public Set<CourseRequest> findActive() {
		// TODO Auto-generated method stub
		return null;
	}
}
