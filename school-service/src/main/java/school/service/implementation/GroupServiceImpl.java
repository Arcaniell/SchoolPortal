package school.service.implementation;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.dao.CourseDao;
import school.dao.GroupDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.GroupDTO;
import school.dto.GroupDataDTO;
import school.dto.GroupEditHeaderDTO;
import school.dto.GroupEditResponseDTO;
import school.dto.StudentDTO;
import school.dto.TeacherDTO;
import school.dto.journal.StudentMarksDTO;
import school.model.Group;
import school.model.Schedule;
import school.model.Student;
import school.model.Teacher;
import school.service.GroupService;
import school.service.utils.DateUtil;
import school.model.Course;

/**
 * @author Blowder
 */

@Service
public class GroupServiceImpl implements GroupService {
    Locale loc = null;
    public static final Integer[] YEARS_OF_STUDY = { 5, 6, 7, 8, 9, 10, 11 };
    private final SimpleDateFormat formatterDate = new SimpleDateFormat("MM/dd/yyyy");
    public static final String[] SYMBOLS_FOR_CLASS = { "A", "B", "C", "D", "E", "F", "G", "H", "I",
            "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
    private static final int FIRST_CLASS_YEARS = 6;
    final boolean ADDITIONAL_FLAG_TRUE = true;
    @Autowired
    StudentDao studentDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    GroupDao groupDao;
    @Autowired
    ScheduleDao scheduleDao;
    @Autowired
    CourseDao courseDao;

    @Override
    public void createAdditionGroup(List<Student> students, Course course, Date from, Date till) {
        Group group = new Group();
        group.setAdditional(ADDITIONAL_FLAG_TRUE);
        group.setAdditionCourse(course);
        group.setNumber((byte) course.getGroupNumber());
        group.setStartDate(from);
        group.setEndDate(till);
        group = groupDao.update(group);
        for (Student student : students) {
            List<Group> container = student.getAdditionGroups();
            container.add(group);
            student.setAdditionGroups(container);
            studentDao.update(student);
        }
    }

    @Override
    public List<GroupDTO> getStudentGroups(Principal principal) {
        long userId = Long.parseLong(principal.getName());
        Student student = studentDao.findByUserId(userId);
        Group mainGroup = student.getGroup();
        List<Group> additionalGroups = student.getAdditionGroups();
        List<Group> allGroups = new ArrayList<Group>();
        if (mainGroup != null) {
            allGroups.add(mainGroup);
        }
        if (additionalGroups != null) {
            allGroups.addAll(additionalGroups);
        }
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
            if (group == null) {
                continue;
            }
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
    public void createNewGroup(byte year, String symbol, Long teacherId, Long courseId,
            String branch) {
        Teacher teacher = teacherDao.findById(teacherId);
        Course course = courseDao.findById(courseId);

        Group group = new Group();
        group.setNumber(year);
        group.setTeacher(teacher);
        group.setStartDate(new Date());
        if (branch == null) {
            group.setLetter(symbol.charAt(0));
        } else {
            group.setAdditional(true);
            group.setAdditionCourse(course);
        }
        groupDao.save(group);
    }

    @Override
    public void removeGroup(long requestId) {
        Group group = groupDao.findById(requestId);
        freeMainGroupFromStudents(group);
        freeAdditionGroupFromStudents(group);
        List<Schedule> schedule = scheduleDao.findByGroup(group);
        for (Schedule oneLesson : schedule) {
            scheduleDao.remove(oneLesson);
        }
        if (group != null) {
            groupDao.remove(groupDao.findById(requestId));
        }
    }

    @Transactional
    @Override
    public GroupEditHeaderDTO getGroupEditHeaderInfo(long id, Locale loc) {
        this.loc = loc;
        Group group = groupDao.findById(id);
        if (group == null) {
            return null;
        }
        Calendar currentDate = Calendar.getInstance();
        int aproxYear = currentDate.get(Calendar.YEAR) - group.getNumber() - FIRST_CLASS_YEARS;
        List<TeacherDTO> teachers = new ArrayList<TeacherDTO>();
        List<Student> studentsOfGroup = new ArrayList<Student>();
        List<Student> studentWithoutGroup = new ArrayList<Student>();
        studentWithoutGroup = studentDao.findAll();
        Teacher teacherGroupTeacher = group.getTeacher();

        // if group have teacher add it to list
        if (teacherGroupTeacher != null) {
            TeacherDTO curentGroupTeacherDAO = new TeacherDTO();
            curentGroupTeacherDAO.setId(teacherGroupTeacher.getId());
            curentGroupTeacherDAO.setFullName(teacherGroupTeacher.getUser().getFirstName() + " "
                    + teacherGroupTeacher.getUser().getLastName());
            teachers.add(curentGroupTeacherDAO);
        }
        String groupName = "";
        if (group.isAdditional()) {
            Course course = group.getAdditionCourse();
            if (course != null) {
                groupName = course.getCourseName() + " " + course.getGroupNumber() + " year";
            }
            teachers.addAll(getAllTeachers());
            studentsOfGroup = group.getAddStudent();

        } else {
            groupName = group.getNumber() + " - " + group.getLetter();
            teachers.addAll(getNotCurators());
            studentsOfGroup = group.getStudent();
            Iterator<Student> studentIter = studentWithoutGroup.iterator();
            while (studentIter.hasNext()) {
                if (studentIter.next().getGroup() != null) {
                    studentIter.remove();
                }
            }
        }

        List<StudentDTO> studentWithoutGroupDTO = fillStudentDTO(studentWithoutGroup);

        Iterator<StudentDTO> studentIter = studentWithoutGroupDTO.iterator();
        while (studentIter.hasNext()) {
            StudentDTO student4Condition = studentIter.next();
            if ((student4Condition.getYear() < (aproxYear - 1))
                    || (student4Condition.getYear() > (aproxYear + 1))) {
                studentIter.remove();
            }
        }
        List<StudentDTO> studentsOfGroupDTO = fillStudentDTO(studentsOfGroup);
        studentWithoutGroupDTO.removeAll(studentsOfGroupDTO);
        GroupEditHeaderDTO container = new GroupEditHeaderDTO();
        container.setName(groupName);
        container.setDateFrom(date2String(group.getStartDate(), formatterDate));
        container.setDateTill(date2String(group.getEndDate(), formatterDate));
        container.setTeachers(teachers);
        container.setGroupStudents(studentsOfGroupDTO);
        container.setAllFreeStudents(studentWithoutGroupDTO);
        return container;
    }

    @Transactional
    @Override
    public void groupUpdate(GroupEditResponseDTO dataForUpdate) {
        Group group = groupDao.findById(dataForUpdate.getGroupId());
        // START to parse values
        Teacher teacher = teacherDao.findById(dataForUpdate.getTeacherId());
        Date startDate = new Date();
        Date endDate = null;
        try {
            startDate = formatterDate.parse(dataForUpdate.getDateFrom());
            endDate = formatterDate.parse(dataForUpdate.getDateTill());
        } catch (Exception e) {
            // not critical go further
        }
        List<Student> newStudents4Group = new ArrayList<Student>();
        for (StudentDTO studentDTO : dataForUpdate.getStudents()) {
            Student currentStudent = studentDao.findById(studentDTO.getId());
            newStudents4Group.add(currentStudent);
        }
        // FINISH to parse values
        // START compare data
        if (group.getTeacher() == teacher
                && group.getStartDate() == startDate
                && group.getEndDate() == endDate
                && ((group.getStudent() == newStudents4Group) || (group.getAddStudent() == newStudents4Group))) {
            return;
        }
        // FINISH compare data
        // START fill group
        group.setTeacher(teacher);
        group.setStartDate(startDate);
        group.setEndDate(endDate);
        if (group.isAdditional()) {
            freeAdditionGroupFromStudents(group);
            setAdditionGroup4Students(newStudents4Group, group);

        } else {
            freeMainGroupFromStudents(group);
            setMainGroup4Students(newStudents4Group, group);
        }
        groupDao.update(group);
    }

    private void freeMainGroupFromStudents(Group group) {
        List<Student> students = group.getStudent();
        for (Student student : students) {
            student.setGroup(null);
            studentDao.update(student);
        }
    }

    private void setMainGroup4Students(List<Student> students, Group group) {
        for (Student student : students) {
            student.setGroup(group);
            studentDao.update(student);
        }
    }

    private void freeAdditionGroupFromStudents(Group group) {
        List<Student> additionStudents = group.getAddStudent();
        if (additionStudents == null) {
            return;
        }
        Iterator<Student> studentsIter = additionStudents.iterator();
        while (studentsIter.hasNext()) {
            Student student = studentsIter.next();
            List<Group> additionGroups = student.getAdditionGroups();
            if (additionGroups != null) {
                student.getAdditionGroups().remove(group);
                studentDao.update(student);
            } else {
                continue;
            }
        }
    }

    private void setAdditionGroup4Students(List<Student> students, Group group) {
        for (Student student : students) {
            List<Group> groups = new ArrayList<Group>();
            if (student.getAdditionGroups() != null) {
                groups.addAll(student.getAdditionGroups());
                groups.add(group);
                student.setAdditionGroups(groups);
                studentDao.update(student);
            }

        }
    }

    private List<StudentDTO> fillStudentDTO(List<Student> students) {
        List<StudentDTO> containerOfStudentDTO = new ArrayList<StudentDTO>();
        for (Student student : students) {
            StudentDTO curentStudentDTO = new StudentDTO();
            curentStudentDTO.setId(student.getId());
            if (student.getUser() != null) {
                curentStudentDTO.setName(student.getUser().getFirstName() + " "
                        + student.getUser().getLastName());

                Calendar birthday = new GregorianCalendar();
                birthday.setTime(student.getUser().getBirthday());
                curentStudentDTO.setYear(birthday.get(Calendar.YEAR));
                curentStudentDTO.setYearStr(DateUtil.getFormattedDate(student.getUser()
                        .getBirthday(), DateUtil.MEDIUM, loc));

            }
            containerOfStudentDTO.add(curentStudentDTO);
        }
        return containerOfStudentDTO;
    }

    private String date2String(Date date, SimpleDateFormat formater) {
        String dateStr = "-/-/-";
        try {
            dateStr = formater.format(date);
        } catch (Exception e) {
            // nothing to do here
        }
        return dateStr;
    }

}
