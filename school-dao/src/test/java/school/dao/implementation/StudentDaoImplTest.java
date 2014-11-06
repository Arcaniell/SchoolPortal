package school.dao.implementation;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import school.dao.StudentDao;
import school.model.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class StudentDaoImplTest extends DBUnitConfig {
    Student student;
    @Autowired
    StudentDao studentDaoImpl;

    public StudentDaoImplTest() {
        super("StudentDaoImplTest");
    }

    @Before
    public void setUp() throws Exception {
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getStudent());

    }

    @After
    public void tearDown() throws Exception {
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getStudent());
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getDataSet());
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/blank.xml"));
    }

    @Override
    protected IDataSet getDataSet() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/group.xml"));
    }

    protected IDataSet getStudent() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/student.xml"));
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

        student = studentDaoImpl.findById(1L);
        // Checking
        Assert.assertEquals((long) userId, student.getUser().getId());
        Assert.assertEquals((long) groupId, student.getGroup().getId());
        Assert.assertEquals((boolean) active, student.isActive());
    }

    @Test
    public void testRemove() throws Exception {
        // looking for student and delete
        Student student = studentDaoImpl.findById(1L);
        studentDaoImpl.remove(student);
        // get students table and counting rows
        // must be 4-1=3
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        Assert.assertEquals(actualTable.getRowCount(), 3);
    }

    @Test
    public void testUpdate() throws Exception {
        Student student = studentDaoImpl.findById(2L);
        Boolean actual = !student.isActive();
        student.setActive(!student.isActive());
        // upload user to DB
        studentDaoImpl.update(student);
        // getting from DB
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("STUDENT");
        Boolean real = (Boolean) actualTable.getValue(1, "isActive");
        Assert.assertEquals(real, actual);
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
        Student student = studentDaoImpl.findByUserId(3);
        Assert.assertEquals(studentId, student.getId());
    }

    @Test
    public void testFindAllByStatus() {
        // tacking all active students, must be 1
        List<Student> activeStudents = (List<Student>) studentDaoImpl
                .findAllByStatus(true);
        Assert.assertEquals(activeStudents.size(), 1);
        // tacking all archive students, must be 3
        List<Student> archiveStudents = (List<Student>) studentDaoImpl
                .findAllByStatus(false);
        Assert.assertEquals(archiveStudents.size(), 3);
    }

}