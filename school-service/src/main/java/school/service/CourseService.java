package school.service;

import java.util.List;

import school.model.Course;

public interface CourseService {
    List<Course> getCourseByNumber(int id);
}
