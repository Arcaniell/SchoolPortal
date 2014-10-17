package school.dao;

import java.util.Date;
import java.util.Set;

import school.model.CourseRequest;

public interface CourseRequestDao extends BaseDao<CourseRequest> {
	CourseRequest findByData(Date date);

	Set<CourseRequest> findBetweenDates(Date from, Date till);

	Set<CourseRequest> findArchived();

	Set<CourseRequest> findActive();
}
