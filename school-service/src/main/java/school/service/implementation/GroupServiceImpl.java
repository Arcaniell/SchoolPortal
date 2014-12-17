package school.service.implementation;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

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
import school.dto.UserDTO;
import school.dto.TeacherDTO;
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
    public static final int SELECTOR_FLAG_ALL_TEACHERS = 0;
    public static final int SELECTOR_FLAG_CURATORS = 1;
    public static final int SELECTOR_FLAG_NOT_CURATORS = 2;

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

    // STUDENT CONTROLLER CALL
    // get student groups
    @Override
    public List<GroupDTO> getStudentGroups(Principal principal) {
        try {
            Long.parseLong(principal.getName());
        } catch (Exception e) {
            return null;
        }
        Student student = studentDao.findByUserId(Long.parseLong(principal.getName()));
        if (student == null) {
            return null;
        }
        Group mainGroup = student.getGroup();
        List<Group> additionalGroups = student.getAdditionGroups();
        List<Group> allGroups = new ArrayList<Group>();
        if (mainGroup != null) {
            allGroups.add(mainGroup);
        }
        if (additionalGroups != null) {
            allGroups.addAll(additionalGroups);
        }
        List<GroupDTO> result = fillGroupDTOList(allGroups);
        return result;
    }

    // TEACHER CONTROLLER CALL
    // get teacher groups
    @Override
    public List<GroupDTO> getTeacherGroups(Principal principal, Date from, Date till) {
        try {
            Long.parseLong(principal.getName());
        } catch (Exception e) {
            return null;
        }
        Teacher teacher = teacherDao.findByUserId(Long.parseLong(principal.getName()));
        if (teacher == null || from == null || till == null) {
            return null;
        }
        if (from.after(till)) {
            Date swap = from;
            from = till;
            till = swap;
        }
        List<Group> allGroups = groupDao.findAllByTeacherIdDataRange(teacher.getId(), from, till);
        if (allGroups == null) {
            allGroups = new ArrayList<Group>();
        }
        List<GroupDTO> result = fillGroupDTOList(allGroups);
        return result;
    }

    // HEAD TEACHER CONTROLLER CALL
    // get all groups
    @Override
    public List<GroupDTO> getHeadTeacherGroups() {
        List<Group> allGroups = groupDao.findAll();
        if (allGroups == null) {
            allGroups = new ArrayList<Group>();
        }
        List<GroupDTO> result = fillGroupDTOList(allGroups);
        return result;
    }

    // HELP METHOD FOR STUDENT, TEACHER AND HEADTEACHER SERVICE
    // Setting DTO with groups
    public List<GroupDTO> fillGroupDTOList(List<Group> groups) {
        List<GroupDTO> result = new ArrayList<GroupDTO>();
        if (groups == null) {
            return result;
        }
        for (Group group : groups) {
            if (group == null) {
                continue;
            }
            GroupDTO currentGroupDTO = new GroupDTO();
            currentGroupDTO.setId(group.getId());

            if (group.isAdditional()) {
                currentGroupDTO.setAdditional("YES");
                if (group.getAdditionCourse() != null) {
                    currentGroupDTO.setName(group.getAdditionCourse().getCourseName());
                }
                if (group.getAddStudent() != null) {
                    currentGroupDTO.setMembers(group.getAddStudent().size());
                }
            } else {
                currentGroupDTO.setAdditional("NO");
                currentGroupDTO.setName(group.getNumber() + " - " + group.getLetter());
                if (group.getStudent() != null) {
                    currentGroupDTO.setMembers(group.getStudent().size());
                }
            }
            currentGroupDTO.setYear(group.getNumber());
            if (group.getTeacher() != null) {
                currentGroupDTO.setTeacherUserId(group.getTeacher().getUser().getId());
                currentGroupDTO.setTeacher(group.getTeacher().getUser().getFirstName() + " "
                        + group.getTeacher().getUser().getLastName());
            }
            result.add(currentGroupDTO);
        }
        return result;
    }

    // HEAD TEACHER CONTROLLER CALL
    // get info about symbols of class for modal fill
    @Override
    public List<GroupDataDTO> getSymbols() {
        List<GroupDataDTO> result = new ArrayList<GroupDataDTO>();
        for (String symbol : SYMBOLS_FOR_CLASS) {
            GroupDataDTO oneOfTheYear = new GroupDataDTO();
            oneOfTheYear.setSymbol(symbol);
            result.add(oneOfTheYear);
        }
        return result;
    }

    // HEAD TEACHER CONTROLLER CALL
    // get info about years of class for modal fill
    @Override
    public List<GroupDataDTO> getYears() {
        List<GroupDataDTO> result = new ArrayList<GroupDataDTO>();
        for (Integer year : YEARS_OF_STUDY) {
            GroupDataDTO oneOfTheYear = new GroupDataDTO();
            oneOfTheYear.setId(year);
            result.add(oneOfTheYear);
        }
        return result;
    }

    // HEAD TEACHER CONTROLLER CALL AND AJAX CALL
    // get info about teachers
    @Transactional
    @Override
    public List<TeacherDTO> getTeachers(int selector) {
        List<Teacher> curators = new ArrayList<Teacher>();
        List<Teacher> allTeachers = teacherDao.findAll();
        List<Group> allGroups = groupDao.findAll();
        if (allGroups != null) {
            for (Group group : allGroups) {
                if (group.getTeacher() != null) {
                    curators.add(group.getTeacher());
                }
            }
        }
        if (selector == SELECTOR_FLAG_ALL_TEACHERS && allTeachers != null) {
            return fillTeacherDTOList(allTeachers);
        } else if (selector == SELECTOR_FLAG_CURATORS && allTeachers != null && allGroups != null) {
            return fillTeacherDTOList(curators);
        } else if (selector == SELECTOR_FLAG_NOT_CURATORS && allTeachers != null) {
            allTeachers.removeAll(curators);
            return fillTeacherDTOList(allTeachers);
        }
        return fillTeacherDTOList(new ArrayList<Teacher>());
    }

    // HELP METHOD FOR STUDENT, TEACHER AND HEADTEACHER SERVICE
    // Setting DTO with groups
    public List<TeacherDTO> fillTeacherDTOList(List<Teacher> teachers) {
        if (teachers != null) {
            List<TeacherDTO> result = new ArrayList<TeacherDTO>();
            for (Teacher teacher : teachers) {
                if (teacher != null) {
                    TeacherDTO teacherDTO = new TeacherDTO();
                    teacherDTO.setId(teacher.getId());
                    if (teacher.getUser() != null) {
                        teacherDTO.setFullName(teacher.getUser().getFirstName() + " "
                                + teacher.getUser().getLastName());
                    }
                    result.add(teacherDTO);
                }
            }
            return result;
        } else {
            return new ArrayList<TeacherDTO>();
        }
    }

    // HEAD TEACHER AJAX CALL
    // get info all available letters(similar classes not allowed )
    @Override
    public List<String> getAvailableSymbols(byte year) {
        String[] allSymbols = GroupServiceImpl.SYMBOLS_FOR_CLASS;
        List<String> result = new ArrayList<String>();
        if (allSymbols != null) {
            for (String symbol : allSymbols) {
                Group group = groupDao.findByNumberAndLetter(year,
                        symbol.charAt(symbol.length() - 1));
                if (group == null) {
                    result.add(symbol);
                }
            }
        }
        return result;
    }

    // HEAD TEACHER CONTROLLER CALL
    // create new group with parameters
    @Override
    public void createNewGroup(byte year, String symbol, Long teacherId, Long courseId,
            String branch) {
        Teacher teacher = teacherDao.findById(teacherId);
        Course course = courseDao.findById(courseId);
        List<Group> existingGroups = groupDao.findByCourseId(courseId);
        Group group = new Group();
        group.setNumber(year);
        group.setTeacher(teacher);
        group.setStartDate(new Date());
        if (branch == null) {
            group.setLetter(symbol.charAt(0));
        } else {
            group.setAdditional(true);
            group.setAdditionCourse(course);
            if (existingGroups != null) {
                group.setAdditionalIndex(existingGroups.size() + 1);
            } else {
                group.setAdditionalIndex(1);
            }
        }
        groupDao.save(group);
    }

    // HEAD TEACHER CONTROLLER CALL
    // remove group with id
    @Override
    public void removeGroup(long requestId) {
        Group group = groupDao.findById(requestId);
        if (group != null) {
            freeMainGroupFromStudents(group);
            freeAdditionGroupFromStudents(group);
            List<Schedule> schedule = scheduleDao.findByGroup(group);
            if (schedule != null) {
                for (Schedule oneLesson : schedule) {
                    scheduleDao.remove(oneLesson);
                }
            }
            groupDao.remove(groupDao.findById(requestId));
        }
    }

    // HEAD TEACHER AJAX CALL
    // get all info for current group
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
        if (groupTeacherDaoFill(group) != null) {
            teachers.add(groupTeacherDaoFill(group));
        }
        String groupName = "";
        if (group.isAdditional()) {
            Course course = group.getAdditionCourse();
            if (course != null) {
                groupName = course.getCourseName() + " " + course.getGroupNumber() + " year";
            }
            teachers.addAll(getTeachers(SELECTOR_FLAG_ALL_TEACHERS));
            studentsOfGroup = group.getAddStudent();
        } else {
            groupName = group.getNumber() + " - " + group.getLetter();
            teachers.addAll(getTeachers(SELECTOR_FLAG_NOT_CURATORS));
            studentsOfGroup = group.getStudent();
            Iterator<Student> studentIter = studentWithoutGroup.iterator();
            while (studentIter.hasNext()) {
                if (studentIter.next().getGroup() != null) {
                    studentIter.remove();
                }
            }
        }
        List<Student> filteredStudents = filterStudentsByYear(studentWithoutGroup, aproxYear - 1,
                aproxYear + 1);
        List<UserDTO> studentWithoutGroupDTO = fillUserDTO(filteredStudents);
        // List<UserDTO> studentWithoutGroupDTO =
        // fillUserDTO(studentWithoutGroup);
        /*
         * Iterator<UserDTO> studentIter = studentWithoutGroupDTO.iterator();
         * while (studentIter.hasNext()) { UserDTO student4Condition =
         * studentIter.next(); if ((student4Condition.getYear() < (aproxYear -
         * 1)) || (student4Condition.getYear() > (aproxYear + 1))) {
         * studentIter.remove(); } }
         */
        List<UserDTO> studentsOfGroupDTO = fillUserDTO(studentsOfGroup);
        studentWithoutGroupDTO.removeAll(studentsOfGroupDTO);

        GroupEditHeaderDTO result = new GroupEditHeaderDTO();
        result.setName(groupName);
        result.setDateFrom(date2String(group.getStartDate(), formatterDate));
        result.setDateTill(date2String(group.getEndDate(), formatterDate));
        result.setTeachers(teachers);
        result.setGroupStudents(studentsOfGroupDTO);
        result.setAllFreeStudents(studentWithoutGroupDTO);
        return result;
    }

    @Transactional
    private List<Student> filterStudentsByYear(List<Student> students, int lowerBound,
            int upperBound) {
        List<Student> result = new ArrayList<Student>();
        if (students != null) {
            for (Student student : students) {
                Calendar birthday = new GregorianCalendar();
                birthday.setTime(student.getUser().getBirthday());
                if ((birthday.get(Calendar.YEAR) >= lowerBound)
                        && (birthday.get(Calendar.YEAR) <= upperBound)) {
                    result.add(student);
                }
            }
        }
        return result;
    }

    @Transactional
    private TeacherDTO groupTeacherDaoFill(Group group) {
        Teacher groupTeacher = group.getTeacher();
        if (groupTeacher != null) {
            TeacherDTO result = new TeacherDTO();
            result.setId(groupTeacher.getId());
            result.setFullName(groupTeacher.getUser().getFirstName() + " "
                    + groupTeacher.getUser().getLastName());
            return result;
        }
        return null;
    }

    // HEAD TEACHER AJAX CALL
    // update group by parameters
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
        for (UserDTO studentDTO : dataForUpdate.getStudents()) {
            Student currentStudent = studentDao.findById(studentDTO.getForeignId());
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

    // HELP METHOD HEADTEACHER GROUP EDIT SERVICE
    // free group from students
    private void freeMainGroupFromStudents(Group group) {
        if (group != null) {
            List<Student> students = group.getStudent();
            if (students != null) {
                for (Student student : students) {
                    if (student != null) {
                        student.setGroup(null);
                        studentDao.update(student);
                    }
                }
            }
        }
    }

    // HELP METHOD HEADTEACHER GROUP EDIT SERVICE
    // free group from students
    @Transactional
    private void freeAdditionGroupFromStudents(Group group) {
        if (group != null) {
            List<Student> additionStudents = group.getAddStudent();
            if (additionStudents != null) {
                Iterator<Student> studentsIter = additionStudents.iterator();
                while (studentsIter.hasNext()) {
                    Student student = studentsIter.next();
                    if (student != null) {
                        List<Group> additionGroups = student.getAdditionGroups();
                        if (additionGroups != null) {
                            student.getAdditionGroups().remove(group);
                            studentDao.update(student);
                        } else {
                            continue;
                        }
                    }
                }
            }
        }
    }

    // HELP METHOD HEADTEACHER GROUP EDIT SERVICE
    // add to group students
    private void setMainGroup4Students(List<Student> students, Group group) {
        if (students != null) {
            for (Student student : students) {
                if (student != null) {
                    student.setGroup(group);
                    studentDao.update(student);
                }
            }
        }
    }

    // HELP METHOD HEADTEACHER GROUP EDIT SERVICE
    // add to group students
    private void setAdditionGroup4Students(List<Student> students, Group group) {
        if (students != null) {
            for (Student student : students) {
                List<Group> groups = new ArrayList<Group>();
                if (student != null) {
                    if (student.getAdditionGroups() != null) {
                        groups.addAll(student.getAdditionGroups());
                        groups.add(group);
                        student.setAdditionGroups(groups);
                        studentDao.update(student);
                    }
                }

            }
        }
    }

    // HELP METHOD GROUP SERVICE
    // fill DTO with info
    public List<UserDTO> fillUserDTO(List<Student> students) {
        List<UserDTO> result = new ArrayList<UserDTO>();
        if (students != null) {
            for (Student student : students) {
                UserDTO curentStudentDTO = new UserDTO();
                curentStudentDTO.setForeignId(student.getId());
                if (student.getUser() != null) {
                    curentStudentDTO.setId(student.getUser().getId());
                    curentStudentDTO.setName(student.getUser().getFirstName() + " "
                            + student.getUser().getLastName());

                    Calendar birthday = new GregorianCalendar();
                    birthday.setTime(student.getUser().getBirthday());
                    curentStudentDTO.setYear(birthday.get(Calendar.YEAR));
                    curentStudentDTO.setYearStr(DateUtil.getFormattedDate(student.getUser()
                            .getBirthday(), DateUtil.MEDIUM, loc));

                }
                result.add(curentStudentDTO);
            }
        }
        return result;
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
