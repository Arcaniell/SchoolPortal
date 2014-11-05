package school.dao;

import java.util.Date;

import school.model.Lesson;



public interface LessonDao extends BaseDao<Lesson, Long> {

	Lesson findByStartTime (Date startTime);

}
