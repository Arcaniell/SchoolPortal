package school.service.implementation;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.dao.GroupDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.GroupDTO;
import school.model.Group;
import school.model.Student;
import school.model.Teacher;
import school.service.GroupService;
import school.model.Course;

/**
 * @author Blowder
 */

@Service
public class GroupServiceImpl implements GroupService {
    final boolean ADDITIONAL_FLAG_TRUE = true;
    @Autowired
    StudentDao studentDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    GroupDao groupDao;

    public List<Group> getStudentGroupsByUserId(long id) {
        Student student = studentDao.findByUserId(id);
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
            studentDao.update(student);
        }
    }

    @Override
    public List<GroupDTO> getStudentGroups(Principal user) {
        long userId = Long.parseLong(user.getName());
        Student student = studentDao.findByUserId(userId);
        Group mainGroup = student.getGroup();
        List<Group> additionalGroups = student.getAdditionGroups();
        List<Group> allGroups = new ArrayList<Group>();
        allGroups.add(mainGroup);
        allGroups.addAll(additionalGroups);
        List<GroupDTO> jspGroupsDTO = fillDTOWithGroupList(allGroups);
        return jspGroupsDTO;
    }

    @Override
    public List<GroupDTO> getTeacherGroups(Principal user, Date from, Date till) {
        long userId = Long.parseLong(user.getName());
        Teacher teacher = teacherDao.findByUserId(userId);
        List<Group> allGroups = groupDao.findAllByTeacherIdDataRange(
                teacher.getId(), from, till);
        List<GroupDTO> jspGroupsDTO = fillDTOWithGroupList(allGroups);
        return jspGroupsDTO;
    }

    @Override
    public List<GroupDTO> getHeadTeacherGroups() {
        List<Group> allGroups = groupDao.findAll();
        List<GroupDTO> jspGroupsDTO = fillDTOWithGroupList(allGroups);
        return jspGroupsDTO;
    }

    List<GroupDTO> fillDTOWithGroupList(List<Group> groups) {
        List<GroupDTO> jspGroupsDTO = new ArrayList<GroupDTO>();
        for (Group group : groups) {
            GroupDTO currentGroupDTO = new GroupDTO();
            currentGroupDTO.setId(group.getId());

            if (group.isAdditional()) {
                if (group.getAdditionCourse() != null) {
                    currentGroupDTO.setName(group.getAdditionCourse()
                            .getCourseName());
                }
                currentGroupDTO.setAdditional("YES");
                if (group.getAddStudent() != null) {
                    currentGroupDTO.setMembers(group.getAddStudent().size());
                }
            } else {
                currentGroupDTO.setName(group.getNumber() + " - "
                        + group.getLetter());
                currentGroupDTO.setAdditional("NO");
                if (group.getStudent() != null) {
                    currentGroupDTO.setMembers(group.getStudent().size());
                }
            }
            currentGroupDTO.setYear(group.getNumber());
            if (group.getTeacher() != null) {
                currentGroupDTO.setTeacher(group.getTeacher().getUser()
                        .getFirstName()
                        + " " + group.getTeacher().getUser().getLastName());
            }
            jspGroupsDTO.add(currentGroupDTO);
        }
        return jspGroupsDTO;
    }
}
