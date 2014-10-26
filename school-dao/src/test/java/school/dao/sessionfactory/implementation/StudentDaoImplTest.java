package school.dao.sessionfactory.implementation;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.hibernate.Session;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import school.model.Student;
import school.model.User;

public class StudentDaoImplTest extends DBUnitConfig {
    public StudentDaoImplTest() {
        super("StudentDaoImplTest");
    }

    @BeforeClass
    protected void setUpBeforeClass() throws Exception {
    }

    @AfterClass
    protected void tearDownAfterClass() throws Exception {
        HibernateSessionFactory.shutdown();
    }

    @Before
    public void setUp() throws Exception {
        Session session = HibernateSessionFactory.getSessionFactory()
                .openSession();
        session.close();
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getStudent());

    }

    @After
    public void tearDown() throws Exception {
        /*DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getStudent());
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());*/
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/blank.xml"));
    }

    @Override
    protected IDataSet getDataSet() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/group.xml"));
    }

    protected IDataSet getStudent() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/student.xml"));
    }

    @Test
    public void testFindbyId() throws Exception {
        // taking student from DB and taking parameters
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        Long userId = (Long) actualTable.getValue(0, "userId");
        Long groupId = (Long) actualTable.getValue(0, "groupId");
        Boolean active = (Boolean) actualTable.getValue(0, "isActive");
        // taking student from DB with out tested method
        StudentDaoImpl studentDaoImpl = new StudentDaoImpl();
        Student student = studentDaoImpl.findById(1);
        // Checking
        Assert.assertEquals((long) userId, student.getUser().getId());
        Assert.assertEquals((long) groupId, student.getGroup().getId());
        //Assert.assertEquals((boolean) active, student.isActive());
    }

    @Test
    public void testRemove() throws Exception {
        // looking for student and delete
        Student student = new StudentDaoImpl().findById(1);
        new StudentDaoImpl().remove(student);
        // get students table and counting rows
        // must be 4-1=3
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        Assert.assertEquals(actualTable.getRowCount(), 3);
    }

    @Test
    public void testUpdate() throws Exception {
        // setting up our user
        User user = new User();
        user.setId(6L);
        user.setEmail("blowder@mail.ru");
        user.setFirstName("Viktor");
        user.setLastName("Fedinchuk");
        user.setPassword("SwordFish");
        user.setRegistration(new Date());
        user.setSex(User.SexType.MALE.getSex());
        // setting up our student
        Student student = new Student();
        student.setUser(user);
        student.setActive(false);
        // upload user to DB
        new StudentDaoImpl().update(student);
        // getting from DB
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        ITable userTable = databaseDataSet.getTable("USER");
        Long realUserId=(Long)userTable.getValue(4, "id");
        Long userId = (Long) actualTable.getValue(4, "userId");
        Boolean active = (Boolean) actualTable.getValue(4, "isActive");
        Assert.assertEquals((long) userId, (long)realUserId);
        Assert.assertEquals((boolean) active, false);
    }

    @Test
    public void testFindAll() throws Exception {
        // get students table and counting rows
        // must be 4
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        Assert.assertEquals(actualTable.getRowCount(), 4);
    }

    @Test
    public void testByUserId() throws Exception {
        // get students table
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        // tacking student id with user id = 3
        long studentId = (Long) actualTable.getValue(2, "id");
        // get student by tested method and check result
        Student student = new StudentDaoImpl().findByUserId(3);
        Assert.assertEquals(studentId, student.getId());
    }

    @Test
    public void testFindAllByStatus() {
        // tacking all active students, must be 1
        List<Student> activeStudents = (List<Student>) new StudentDaoImpl()
                .findAllByStatus(true);
        Assert.assertEquals(activeStudents.size(), 1);
        // tacking all archive students, must be 3
        List<Student> archiveStudents = (List<Student>) new StudentDaoImpl()
                .findAllByStatus(false);
        Assert.assertEquals(archiveStudents.size(), 3);
    }
}
