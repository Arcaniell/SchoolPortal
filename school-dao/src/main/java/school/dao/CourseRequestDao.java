package school.dao;

import java.util.Date;
import java.util.Set;

import school.model.CourseRequest;

public interface CourseRequestDao extends BaseDao<CourseRequest> {
	Set<CourseRequest> findByDate(Date date);

	Set<CourseRequest> findByInterval(Date from, Date till);

	Set<CourseRequest> findArchived();

	Set<CourseRequest> findActive();
}
