package school.dao.implementation;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import school.dao.CourseRequestDao;
import school.dao.StudentDao;
import school.model.CourseRequest;
import school.model.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })

public class CourseRequestImplTest extends DBUnitConfig {

    @Autowired
    StudentDao studentDaoImpl;
    @Autowired
    CourseRequestDao courseRequestDaoImpl;

    public CourseRequestImplTest() {
        super("CourseRequestImplTest");
    }

    @Override
    @Before
    public void setUp() throws Exception {

        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getGroup());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getCourse());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getStudent());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getCourseRequest());

    }

    @Override
    @After
    public void tearDown() throws Exception {
        /*
         * DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
         * .getConnection(), getCourseRequest());
         * DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
         * .getConnection(), getStudent());
         * DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
         * .getConnection(), getCourse());
         * DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
         * .getConnection(), getGroup());
         */
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    @Override
    protected IDataSet getDataSet() throws Exception {
        // not used, name not informative
        return null;
    }

    protected IDataSet getGroup() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/group.xml"));
    }

    protected IDataSet getStudent() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/student.xml"));
    }

    protected IDataSet getCourse() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/course.xml"));
    }

    private IDataSet getCourseRequest() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/courseRequest.xml"));
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/blank.xml"));
    }

    @Test
    public void testFindbyId() throws SQLException, Exception {
        // getting info from database
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        long studentId = (Long) actualTable.getValue(2, "studentId");
        long courseId = (Long) actualTable.getValue(2, "courseId");
        boolean isActive = (Boolean) actualTable.getValue(2, "isActive");
        // getting info with tested method
        CourseRequest courseRequest = courseRequestDaoImpl.findById(3L);
        Assert.assertEquals(studentId, courseRequest.getStudent().getId());
        Assert.assertEquals(courseId, courseRequest.getCourse().getId());
        Assert.assertEquals(courseRequest.isActive(), isActive);
    }

    @Test
    public void testRemove() throws SQLException, Exception {
        // looking for courseRequest and delete
        CourseRequest courseRequest = courseRequestDaoImpl.findById(1L);
        courseRequestDaoImpl.remove(courseRequest);
        // get courseRequest table and counting rows
        // must be 5-1=4
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        Assert.assertEquals(4, actualTable.getRowCount());
    }

    @Test
    public void testUpdate() throws SQLException, Exception {
        // setting up our courseRequest
        Student student = studentDaoImpl.findById(1L);
        CourseRequest courseRequest = courseRequestDaoImpl.findById(1L);
        courseRequest.setActive(true);
        courseRequest.setStudent(student);
        courseRequest.setDate(new Date());
        // updating courseRequest in DB
        courseRequestDaoImpl.update(courseRequest);
        // taking from DB COURSE_REQUEST table and check last row
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        long studentId = (Long) actualTable.getValue(0, "studentId");
        boolean isActive = (Boolean) actualTable.getValue(0, "isActive");
        Assert.assertEquals(courseRequest.getStudent().getId(), studentId);
        Assert.assertEquals(courseRequest.isActive(), isActive);
    }

    @Test
    public void testFindAll() throws SQLException, Exception {
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        List<CourseRequest> finded = courseRequestDaoImpl.findAll();
        Assert.assertEquals(actualTable.getRowCount(), finded.size());
    }

    @Test
    public void testFindAllByStatus() throws SQLException, Exception {
        Assert.assertEquals(courseRequestDaoImpl.findAllByStatus(true).size(),
                3);
        Assert.assertEquals(courseRequestDaoImpl.findAllByStatus(false).size(),
                2);
    }

    @Test
    public void testFindAllByInterval() throws SQLException, Exception {
        // setting from date
        SimpleDateFormat sdfFrom = new SimpleDateFormat("dd-M-yyyy");
        String dateInStringFrom = "31-08-2008";
        Date from = sdfFrom.parse(dateInStringFrom);
        // setting till date
        SimpleDateFormat sdfTill = new SimpleDateFormat("dd-M-yyyy");
        String dateInStringTill = "31-08-2012";
        Date till = sdfTill.parse(dateInStringTill);

        Assert.assertEquals(courseRequestDaoImpl.findAllByInterval(from, till)
                .size(), 2);
    }

    @Test
    public void testFindAllByStudentId() throws SQLException, Exception {
        Assert.assertEquals(courseRequestDaoImpl.findAllByStudentId(2).size(),
                2);
    }

    @Test
    public void testFindAllByGroupId() throws SQLException, Exception {
        Assert.assertEquals(courseRequestDaoImpl.findAllBySubjectId(1).size(),
                2);

    }

}