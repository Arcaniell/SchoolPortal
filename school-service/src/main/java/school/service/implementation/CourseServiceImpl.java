package school.service.implementation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.CourseDao;
import school.model.Course;
import school.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    CourseDao courseDao;

    @Override
    public List<Course> getCourseByNumber(int id) {
        if (courseDao == null) {
            return null;
        }
        return courseDao.findByGroupNumber(id);
    }

}
