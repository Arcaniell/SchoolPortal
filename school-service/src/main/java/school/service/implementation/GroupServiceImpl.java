package school.service.implementation;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.GroupDao;
import school.dao.StudentDao;
import school.model.Group;
import school.model.Student;
import school.service.GroupService;
import school.model.Course;

/**
 * @author Blowder
 */

@Service
public class GroupServiceImpl implements GroupService {
    final boolean ADDITIONAL_FLAG_TRUE = true;
    @Autowired
    StudentDao studentDaoImpl;
    @Autowired
    GroupDao groupDao;

    public List<Group> getStudentGoupsByUserId(long id) {
        Student student = studentDaoImpl.findByUserId(id);
        if (student == null) {
            return null;
        }
        List<Group> groups = new ArrayList<Group>();
        groups.add(student.getGroup());
        groups.addAll(student.getAdditionGroups());
        return groups;

    }

    @Override
    public void createAdditionGroup(List<Student> students, Course course,
            Date from, Date till) {
        Group group = new Group();
        group.setAdditional(ADDITIONAL_FLAG_TRUE);
        group.setAdditionCourse(course);
        group.setNumber((byte) course.getGroupNumber());
        group.setStartDate(from);
        group.setEndDate(till);
        groupDao.update(group);
        //
        group = groupDao.findByCourseId(course.getId());
        for (Student student : students) {
            List<Group> container = student.getAdditionGroups();
            container.add(group);
            student.setAdditionGroups(container);
            studentDaoImpl.update(student);
        }
    }
}
