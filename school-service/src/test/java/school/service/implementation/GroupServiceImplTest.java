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

import school.dao.GroupDao;
import school.dao.StudentDao;
import school.dao.TeacherDao;
import school.dto.GroupDTO;
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
}
