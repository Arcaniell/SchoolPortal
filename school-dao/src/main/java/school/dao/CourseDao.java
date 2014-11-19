package school.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import com.mysql.jdbc.exceptions.MySQLSyntaxErrorException;

import school.model.Course;

public interface CourseDao extends BaseDao<Course, Long> {

    List<Course> findAllByStatus(boolean status);

    List<Course> findByGroupNumber(int groupNumber) throws NoResultException,
            MySQLSyntaxErrorException;

    List<Course> findByCoefficient(int coefficient);

    List<Course> findByCourseName(String courseName);

    List<Course> findByCourseNameAndGroupNumber(String courseName,
            int groupNumber);

    List<Course> findByPriceRange(int from, int to);

    List<Course> findByGroupIdAndDataRange(long groupId, Date from, Date till);

    List<Course> findAllByStatusAndYear(boolean status, int year);

    List<Course> findByTeacherIdAndDataRange(long teacherId, Date from,
            Date till);

}
