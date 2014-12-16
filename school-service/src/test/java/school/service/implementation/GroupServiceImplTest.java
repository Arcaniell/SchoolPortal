package school.service.implementation;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import school.dao.CourseDao;
import school.dao.GroupDao;
import school.dao.ScheduleDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.GroupDTO;
import school.dto.TeacherDTO;
import school.model.Course;
import school.model.Group;
import school.model.Student;
import school.model.Teacher;
import school.model.User;
import static org.mockito.Mockito.*;

public class GroupServiceImplTest {
    @InjectMocks
    GroupServiceImpl groupService = new GroupServiceImpl();
    @Mock
    StudentDao studentDaoStub;
    @Mock
    TeacherDao teacherDaoStub;
    @Mock
    GroupDao groupDaoStub;
    @Mock
    CourseDao courseDaoStub;
    @Mock
    ScheduleDao scheduleDaoStub;
    @Mock
    Principal mockedPrincipal;

    @Before
    public void initMocks() {
        MockitoAnnotations.initMocks(this);
    }

    // Student without groups
    @Test
    public void testGetStudentGroups1() {
        when(mockedPrincipal.getName()).thenReturn("1");
        when(studentDaoStub.findByUserId(1)).thenReturn(new Student());
        Assert.assertEquals(0, groupService.getStudentGroups(mockedPrincipal).size());
    }

    // Student with primary group
    @Test
    public void testGetStudentGroups2() {
        when(mockedPrincipal.getName()).thenReturn("1");
        Student student = new Student();
        student.setGroup(new Group());
        when(studentDaoStub.findByUserId(1)).thenReturn(student);
        Assert.assertEquals(1, groupService.getStudentGroups(mockedPrincipal).size());
    }

    // Student with addition groups
    @Test
    public void testGetStudentGroups3() {
        when(mockedPrincipal.getName()).thenReturn("1");
        Student student = new Student();
        List<Group> groups = new ArrayList<Group>();
        groups.add(new Group());
        groups.add(new Group());
        groups.add(new Group());
        student.setAdditionGroups(groups);
        when(studentDaoStub.findByUserId(1)).thenReturn(student);
        Assert.assertEquals(3, groupService.getStudentGroups(mockedPrincipal).size());
    }

    // Principal no such student id
    @Test
    public void testGetStudentGroups4() {
        when(mockedPrincipal.getName()).thenReturn("1");
        when(studentDaoStub.findByUserId(1)).thenReturn(null);
        Assert.assertNull(groupService.getStudentGroups(mockedPrincipal));
    }

    // Principal unreal id for student
    @Test
    public void testGetStudentGroups5() {
        when(mockedPrincipal.getName()).thenReturn("0");
        when(studentDaoStub.findByUserId(0)).thenReturn(null);
        Assert.assertNull(groupService.getStudentGroups(mockedPrincipal));
    }

    // Principal unreal id for student
    @Test
    public void testGetStudentGroups6() {
        when(mockedPrincipal.getName()).thenReturn("-1");
        when(studentDaoStub.findByUserId(-1)).thenReturn(null);
        Assert.assertNull(groupService.getStudentGroups(mockedPrincipal));
    }

    // Principal unreal id for student
    @Test
    public void testGetStudentGroups7() {
        when(mockedPrincipal.getName()).thenReturn("qwerty");
        Assert.assertNull(groupService.getStudentGroups(mockedPrincipal));
    }

    // ---------------------------------------------------------------------------//
    // Principal no such teacher id
    @Test
    public void testGetTeacherGroups1() {
        when(mockedPrincipal.getName()).thenReturn("1");
        when(teacherDaoStub.findByUserId(1)).thenReturn(null);
        Assert.assertNull(groupService.getTeacherGroups(mockedPrincipal, new Date(), new Date()));
    }

    // Principal unreal id for teacher
    @Test
    public void testGetTeacherGroups2() {
        when(mockedPrincipal.getName()).thenReturn("0");
        when(teacherDaoStub.findByUserId(0)).thenReturn(null);
        Assert.assertNull(groupService.getTeacherGroups(mockedPrincipal, new Date(), new Date()));
    }

    // Principal unreal id for teacher
    @Test
    public void testGetTeacherGroups3() {
        when(mockedPrincipal.getName()).thenReturn("-1");
        when(teacherDaoStub.findByUserId(-1)).thenReturn(null);
        Assert.assertNull(groupService.getTeacherGroups(mockedPrincipal, new Date(), new Date()));
    }

    // Principal unreal id for teacher
    @Test
    public void testGetTeacherGroups4() {
        when(mockedPrincipal.getName()).thenReturn("qwerty");
        Assert.assertNull(groupService.getTeacherGroups(mockedPrincipal, new Date(), new Date()));
    }

    // Teacher without groups
    @Test
    public void testGetTeacherGroups5() throws ParseException {
        when(mockedPrincipal.getName()).thenReturn("1");
        Teacher teacher = new Teacher();
        teacher.setId(1);
        when(teacherDaoStub.findByUserId(1)).thenReturn(teacher);
        String str1 = "2014-10-23 08:08:10.0";
        Date from = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str1);
        String str2 = "2014-10-25 08:08:10.0";
        Date till = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str2);
        when(groupDaoStub.findAllByTeacherIdDataRange(1, from, till)).thenReturn(null);
        Assert.assertEquals(0, groupService.getTeacherGroups(mockedPrincipal, from, till).size());
    }

    // Teacher with few groups
    @Test
    public void testGetTeacherGroups6() throws ParseException {
        when(mockedPrincipal.getName()).thenReturn("1");
        Teacher teacher = new Teacher();
        teacher.setId(1);
        when(teacherDaoStub.findByUserId(1)).thenReturn(teacher);
        String str1 = "2014-10-23 08:08:10.0";
        Date from = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str1);
        String str2 = "2014-10-25 08:08:10.0";
        Date till = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(str2);
        List<Group> groups = new ArrayList<Group>();
        groups.add(new Group());
        groups.add(new Group());
        groups.add(new Group());
        groups.add(new Group());
        when(groupDaoStub.findAllByTeacherIdDataRange(1, from, till)).thenReturn(groups);
        Assert.assertEquals(4, groupService.getTeacherGroups(mockedPrincipal, from, till).size());
    }

    // Teacher with wrong date{
    @Test
    public void testGetTeacherGroups7() throws ParseException {
        when(mockedPrincipal.getName()).thenReturn("1");
        Teacher teacher = new Teacher();
        teacher.setId(1);
        when(teacherDaoStub.findByUserId(1)).thenReturn(teacher);
        Assert.assertNull(groupService.getTeacherGroups(mockedPrincipal, null, new Date()));
    }

    // Teacher with wrong date{
    @Test
    public void testGetTeacherGroups8() throws ParseException {
        when(mockedPrincipal.getName()).thenReturn("1");
        Teacher teacher = new Teacher();
        teacher.setId(1);
        when(teacherDaoStub.findByUserId(1)).thenReturn(teacher);
        Assert.assertNull(groupService.getTeacherGroups(mockedPrincipal, new Date(), null));
    }

    // ---------------------------------------------------------------------------//
    // headteacher empty group
    @Test
    public void testGetHeadTeacherGroups1() {
        when(groupDaoStub.findAll()).thenReturn(null);
        Assert.assertEquals(0, groupService.getHeadTeacherGroups().size());
    }

    // headteacher have groups
    @Test
    public void testGetHeadTeacherGroups2() {
        List<Group> groups = new ArrayList<Group>();
        groups.add(new Group());
        groups.add(new Group());
        groups.add(new Group());
        when(groupDaoStub.findAll()).thenReturn(groups);
        Assert.assertEquals(3, groupService.getHeadTeacherGroups().size());
    }

    // ---------------------------------------------------------------------------//
    // null group list
    @Test
    public void fillGroupDTOList1() {
        List<Group> groups = null;
        Assert.assertEquals(0, groupService.fillGroupDTOList(groups).size());
    }

    // group list with few elements
    @Test
    public void fillGroupDTOList2() {
        List<Group> groups = new ArrayList<Group>();
        groups.add(new Group());
        groups.add(new Group());
        groups.add(new Group());
        Assert.assertEquals(3, groupService.fillGroupDTOList(groups).size());
    }

    // group list with few elements and few null elements
    @Test
    public void fillGroupDTOList3() {
        List<Group> groups = new ArrayList<Group>();
        groups.add(new Group());
        groups.add(null);
        groups.add(new Group());
        groups.add(null);
        groups.add(new Group());
        groups.add(null);
        Assert.assertEquals(3, groupService.fillGroupDTOList(groups).size());
    }

    // group fill test
    @Test
    public void fillGroupDTOList4() {
        List<Group> groups = new ArrayList<Group>();
        Course course = new Course();
        course.setCourseName("CourseName");
        User user = new User();
        user.setId(5);
        user.setFirstName("FirstName");
        user.setLastName("LastName");
        Teacher teacher = new Teacher();
        teacher.setUser(user);
        Group group = new Group();
        group.setAdditional(true);
        group.setAdditionCourse(course);
        List<Student> students = new ArrayList<Student>();
        students.add(new Student());
        students.add(new Student());
        students.add(new Student());
        group.setAddStudent(students);
        group.setStudent(students);
        group.setLetter('A');
        group.setNumber((byte) 6);
        group.setId(14);
        group.setTeacher(teacher);
        groups.add(group);
        List<GroupDTO> groupDto = groupService.fillGroupDTOList(groups);
        Assert.assertEquals(14, groupDto.get(0).getId());
        Assert.assertEquals(5, groupDto.get(0).getTeacherUserId());
        Assert.assertEquals(3, groupDto.get(0).getMembers());
        Assert.assertEquals(6, groupDto.get(0).getYear());
        Assert.assertEquals("YES", groupDto.get(0).getAdditional());
        Assert.assertEquals("CourseName", groupDto.get(0).getName());
        Assert.assertEquals("FirstName LastName", groupDto.get(0).getTeacher());
        groups.get(0).setAdditional(false);
        groupDto = groupService.fillGroupDTOList(groups);
        Assert.assertEquals("NO", groupDto.get(0).getAdditional());
    }

    // ---------------------------------------------------------------------------//
    // get symbols test
    @Test
    public void testGetSymbols() {
        Assert.assertEquals(26, groupService.getSymbols().size());
    }

    // ---------------------------------------------------------------------------//
    // get numbers test
    @Test
    public void testGetYears() {
        Assert.assertEquals(7, groupService.getYears().size());
    }

    // ---------------------------------------------------------------------------//
    // null array input
    @Test
    public void fillTeacherDTOList1() {
        Assert.assertEquals(0, groupService.fillTeacherDTOList(null).size());
    }

    // zero sized array input
    @Test
    public void fillTeacherDTOList2() {
        Assert.assertEquals(0, groupService.fillTeacherDTOList(new ArrayList<Teacher>()).size());
    }

    // array with data input
    @Test
    public void fillTeacherDTOList3() {
        List<Teacher> teachers = new ArrayList<Teacher>();
        teachers.add(new Teacher());
        teachers.add(new Teacher());
        teachers.add(new Teacher());
        Assert.assertEquals(3, groupService.fillTeacherDTOList(teachers).size());
    }

    // array with data with null elements input
    @Test
    public void fillTeacherDTOList4() {
        List<Teacher> teachers = new ArrayList<Teacher>();
        teachers.add(new Teacher());
        teachers.add(null);
        teachers.add(new Teacher());
        teachers.add(null);
        teachers.add(new Teacher());
        teachers.add(null);
        Assert.assertEquals(3, groupService.fillTeacherDTOList(teachers).size());
    }

    @Test
    public void fillTeacherDTOList5() {
        List<Teacher> teachers = new ArrayList<Teacher>();
        Teacher teacher = new Teacher();
        User user = new User();
        user.setFirstName("First");
        user.setLastName("Last");
        teacher.setId(1);
        teacher.setUser(user);
        teachers.add(teacher);
        List<TeacherDTO> teachersDTO = groupService.fillTeacherDTOList(teachers);
        Assert.assertEquals(1, teachersDTO.get(0).getId());
        Assert.assertEquals("First Last", teachersDTO.get(0).getFullName());
    }

    @Test
    public void getTeachers1() {
        when(teacherDaoStub.findAll()).thenReturn(null);
        when(groupDaoStub.findAll()).thenReturn(null);
        Assert.assertEquals(0, groupService
                .getTeachers(GroupServiceImpl.SELECTOR_FLAG_NOT_CURATORS).size());
        Assert.assertEquals(0, groupService.getTeachers(GroupServiceImpl.SELECTOR_FLAG_CURATORS)
                .size());
        Assert.assertEquals(0, groupService
                .getTeachers(GroupServiceImpl.SELECTOR_FLAG_ALL_TEACHERS).size());
    }

    @Test
    public void getTeachers2() {
        List<Teacher> allTeachers = new ArrayList<Teacher>();
        Teacher teacher1 = new Teacher();
        teacher1.setId(1);
        Teacher teacher2 = new Teacher();
        teacher2.setId(2);
        Teacher teacher3 = new Teacher();
        teacher3.setId(3);
        allTeachers.add(teacher1);
        allTeachers.add(teacher2);
        allTeachers.add(teacher3);
        List<Group> allGroups = new ArrayList<Group>();
        Group group = new Group();
        group.setTeacher(teacher1);
        allGroups.add(group);
        when(teacherDaoStub.findAll()).thenReturn(allTeachers);
        when(groupDaoStub.findAll()).thenReturn(allGroups);
        Assert.assertEquals(3, groupService
                .getTeachers(GroupServiceImpl.SELECTOR_FLAG_ALL_TEACHERS).size());
        Assert.assertEquals(1, groupService.getTeachers(GroupServiceImpl.SELECTOR_FLAG_CURATORS)
                .size());
        Assert.assertEquals(2, groupService
                .getTeachers(GroupServiceImpl.SELECTOR_FLAG_NOT_CURATORS).size());
    }

    @Test
    public void getAvailableSymbols1() {
        when(groupDaoStub.findByNumberAndLetter((byte) 0, 'A')).thenReturn(new Group());
        Assert.assertEquals(25, groupService.getAvailableSymbols((byte) 0).size());
        when(groupDaoStub.findByNumberAndLetter((byte) 0, 'B')).thenReturn(new Group());
        Assert.assertEquals(24, groupService.getAvailableSymbols((byte) 0).size());
    }

    @Test
    public void removeGroup1() {
        when(groupDaoStub.findById(1L)).thenReturn(null);
        when(scheduleDaoStub.findByGroup(null)).thenReturn(null);
        groupService.removeGroup(1);

    }

    @Test
    public void removeGroup2() {
        when(groupDaoStub.findById(1L)).thenReturn(new Group());
        when(scheduleDaoStub.findByGroup(null)).thenReturn(null);
        groupService.removeGroup(1);

    }

}
