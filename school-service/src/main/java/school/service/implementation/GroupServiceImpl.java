package school.service.implementation;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.GroupDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.GroupDTO;
import school.dto.GroupDataDTO;
import school.dto.TeacherDTO;
import school.model.Group;
import school.model.Schedule;
import school.model.Student;
import school.model.Teacher;
import school.service.GroupService;
import school.model.Course;

/**
 * @author Blowder
 */

@Service
public class GroupServiceImpl implements GroupService {
    public static final Integer[] YEARS_OF_STUDY = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };

    public static final String[] SYMBOLS_FOR_CLASS = { "A", "B", "C", "D", "E", "F", "G", "H", "I",
            "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
    final boolean ADDITIONAL_FLAG_TRUE = true;
    @Autowired
    StudentDao studentDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    GroupDao groupDao;
    @Autowired
    ScheduleDao scheduleDao;

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
    public void createAdditionGroup(List<Student> students, Course course, Date from, Date till) {
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
        List<Group> allGroups = groupDao.findAllByTeacherIdDataRange(teacher.getId(), from, till);
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
                    currentGroupDTO.setName(group.getAdditionCourse().getCourseName());
                }
                currentGroupDTO.setAdditional("YES");
                if (group.getAddStudent() != null) {
                    currentGroupDTO.setMembers(group.getAddStudent().size());
                }
            } else {
                currentGroupDTO.setName(group.getNumber() + " - " + group.getLetter());
                currentGroupDTO.setAdditional("NO");
                if (group.getStudent() != null) {
                    currentGroupDTO.setMembers(group.getStudent().size());
                }
            }
            currentGroupDTO.setYear(group.getNumber());
            if (group.getTeacher() != null) {
                currentGroupDTO.setTeacher(group.getTeacher().getUser().getFirstName() + " "
                        + group.getTeacher().getUser().getLastName());
            }
            jspGroupsDTO.add(currentGroupDTO);
        }
        return jspGroupsDTO;
    }

    @Override
    public List<GroupDataDTO> getYears() {
        List<GroupDataDTO> container = new ArrayList<GroupDataDTO>();
        for (Integer year : YEARS_OF_STUDY) {
            GroupDataDTO oneOfTheYear = new GroupDataDTO();
            oneOfTheYear.setId(year);
            container.add(oneOfTheYear);
        }
        return container;
    }

    @Override
    public List<GroupDataDTO> getSymbols() {
        List<GroupDataDTO> container = new ArrayList<GroupDataDTO>();
        for (String symbol : SYMBOLS_FOR_CLASS) {
            GroupDataDTO oneOfTheYear = new GroupDataDTO();
            oneOfTheYear.setSymbol(symbol);
            container.add(oneOfTheYear);
        }
        return container;
    }

    @Transactional
    @Override
    public List<TeacherDTO> getNotCurators() {
        List<Teacher> allTeachers = teacherDao.findAll();
        List<Group> allGroups = groupDao.findAll();
        if (allGroups == null || allTeachers == null) {
            return new ArrayList<TeacherDTO>();
        }
        List<Teacher> curators = new ArrayList<Teacher>();
        for (Group group : allGroups) {
            Teacher groupTeacher = group.getTeacher();
            if (groupTeacher != null) {
                curators.add(groupTeacher);
            }
        }
        allTeachers.removeAll(curators);
        List<TeacherDTO> notCuratorsList = new ArrayList<TeacherDTO>();
        for (Teacher notCurator : allTeachers) {
            TeacherDTO teacherView = new TeacherDTO();
            teacherView.setId(notCurator.getId());
            if (notCurator.getUser() != null) {
                teacherView.setFullName(notCurator.getUser().getFirstName() + " "
                        + notCurator.getUser().getLastName());
            }
            notCuratorsList.add(teacherView);
        }
        return notCuratorsList;
    }

    @Transactional
    @Override
    public List<TeacherDTO> getAllTeachers() {
        List<Teacher> allTeachers = teacherDao.findAll();
        if (allTeachers == null) {
            return new ArrayList<TeacherDTO>();
        }
        List<TeacherDTO> allTeachersList = new ArrayList<TeacherDTO>();
        for (Teacher teacher : allTeachers) {
            TeacherDTO teacherView = new TeacherDTO();
            teacherView.setId(teacher.getId());
            if (teacher.getUser() != null) {
                teacherView.setFullName(teacher.getUser().getFirstName() + " "
                        + teacher.getUser().getLastName());
            }
            allTeachersList.add(teacherView);
        }
        return allTeachersList;
    }

    @Override
    public void createNewGroup(byte year, String symbol, long teacherId, String additionalName,
            String branch) {
        Group group = new Group();
        group.setNumber(year);
        Teacher teacher = teacherDao.findById(teacherId);
        group.setTeacher(teacher);
        group.setStartDate(new Date());
        if (branch == null) {
            group.setLetter(symbol.charAt(0));
        } else {
            group.setAdditional(true);
        }
        groupDao.save(group);
    }

    @Override
    public void removeGroup(long requestId) {
        Group group = groupDao.findById(requestId);
        List<Student> students = group.getStudent();
        for (Student student : students) {
            student.setGroup(null);
            studentDao.update(student);
        }
        // group.setStudent(new ArrayList<Student>());
        // groupDao.update(group);
        List<Student> additionStudents = group.getAddStudent();
        for (Student student : additionStudents) {
            student.getAdditionGroups().remove(group);
            studentDao.update(student);
        }
        List<Schedule> schedule = scheduleDao.findByGroup(group);
        for (Schedule oneLesson : schedule) {
            scheduleDao.remove(oneLesson);
        }
        if (group != null) {
            groupDao.remove(groupDao.findById(requestId));
        }
    }
}
