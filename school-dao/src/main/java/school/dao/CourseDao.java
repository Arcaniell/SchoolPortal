package school.dao;

import java.util.Set;

import school.model.Course;

public interface CourseDao extends BaseDao<Course> {
    Set<Course> findAllAdditionCourses();

    Set<Course> findAllByClassLevel(int level);

    Set<Course> findAllByCoeficient(int coeficient);

    Set<Course> findAllByName(String name);

    Set<Course> findAllByNameAndClassLevel(String name, int level);

    Set<Course> findAllByPrice(int price);

    Set<Course> findAllMandatoryCourses();

}
