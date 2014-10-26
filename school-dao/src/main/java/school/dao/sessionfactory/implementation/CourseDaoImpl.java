package school.dao.sessionfactory.implementation;

import java.util.Set;

import school.dao.CourseDao;
import school.model.Course;

public class CourseDaoImpl extends BaseDaoImpl<Course> implements CourseDao {

    public CourseDaoImpl() {
        super(Course.class);
    }

    public Set<Course> findAllAdditionCourses() {
        // TODO Auto-generated method stub
        return null;
    }

    public Set<Course> findAllByClassLevel(int level) {
        // TODO Auto-generated method stub
        return null;
    }

    public Set<Course> findAllByCoeficient(int coeficient) {
        // TODO Auto-generated method stub
        return null;
    }

    public Set<Course> findAllByName(String name) {
        // TODO Auto-generated method stub
        return null;
    }

    public Set<Course> findAllByNameAndClassLevel(String name, int level) {
        // TODO Auto-generated method stub
        return null;
    }

    public Set<Course> findAllByPrice(int price) {
        // TODO Auto-generated method stub
        return null;
    }

    public Set<Course> findAllMandatoryCourses() {
        // TODO Auto-generated method stub
        return null;
    }

}