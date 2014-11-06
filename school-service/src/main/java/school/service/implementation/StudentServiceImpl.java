package school.service.implementation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.StudentDao;
import school.model.Group;
import school.model.Student;
import school.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDaoImpl;

    public List<Group> getStudentGoupsByUserId(long id) {
        Student student = studentDaoImpl.findByUserId(id);
        System.out.println("Student Dao Impl is "+studentDaoImpl);
        if (student == null) {
            return null;
        }
        List<Group> groups = new ArrayList<Group>();
        groups.add(student.getGroup());
        groups.addAll(student.getAdditionGroups());
        return groups;

    }

}
