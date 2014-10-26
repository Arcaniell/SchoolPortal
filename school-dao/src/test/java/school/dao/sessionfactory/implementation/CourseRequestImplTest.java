package school.dao.sessionfactory.implementation;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.ITable;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.hibernate.Session;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import school.model.Course;
import school.model.CourseRequest;
import school.model.Student;

public class CourseRequestImplTest extends DBUnitConfig {

    public CourseRequestImplTest() {
        super("CourseRequestImplTest");
    }

    @Before
    public void setUp() throws Exception {
        Session session = HibernateSessionFactory.getSessionFactory()
                .openSession();
        session.close();
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getGroup());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getCourse());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getStudent());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getCourseRequest());

    }

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
    @Deprecated
    protected IDataSet getDataSet() throws Exception {
        // not used, name not informative
        return null;
    }

    protected IDataSet getGroup() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/group.xml"));
    }

    protected IDataSet getStudent() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/student.xml"));
    }

    protected IDataSet getCourse() throws DataSetException,
            FileNotFoundException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/course.xml"));
    }

    private IDataSet getCourseRequest() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/courseRequest.xml"));
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/blank.xml"));
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
        CourseRequestDaoImpl courseImpl = new CourseRequestDaoImpl();
        CourseRequest courseRequest = courseImpl.findById(3);
        Assert.assertEquals(studentId, courseRequest.getStudent().getId());
        Assert.assertEquals(courseId, courseRequest.getCourse().getId());
        Assert.assertEquals(courseRequest.isActive(), isActive);
    }

    @Test
    public void testRemove() throws SQLException, Exception {
        // looking for courseRequest and delete
        CourseRequest courseRequest = new CourseRequestDaoImpl().findById(1);
        new CourseRequestDaoImpl().remove(courseRequest);
        // get courseRequest table and counting rows
        // must be 5-1=4
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        Assert.assertEquals(4, actualTable.getRowCount());
    }

    @Test
    public void testUpdate() throws SQLException, Exception {
        // setting up our courseRequest
        Student student = new StudentDaoImpl().findById(1);
        Course course = new CourseDaoImpl().findById(1);
        CourseRequest courseRequest = new CourseRequest();
        courseRequest.setActive(true);
        courseRequest.setCourse(course);
        courseRequest.setStudent(student);
        courseRequest.setDate(new Date());
        // updating courseRequest in DB
        new CourseRequestDaoImpl().update(courseRequest);
        // taking from DB COURSE_REQUEST table and check last row
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        long studentId = (Long) actualTable.getValue(5, "studentId");
        long courseId = (Long) actualTable.getValue(5, "courseId");
        boolean isActive = (Boolean) actualTable.getValue(5, "isActive");
        Assert.assertEquals(courseRequest.getStudent().getId(), studentId);
        Assert.assertEquals(courseRequest.getCourse().getId(), courseId);
        Assert.assertEquals(courseRequest.isActive(), isActive);
    }

    @Test
    public void testFindAll() throws SQLException, Exception {
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("COURSE_REQUEST");
        Assert.assertEquals(actualTable.getRowCount(), 5);
    }

    @Test
    public void testFindAllByStatus() throws SQLException, Exception {
        Assert.assertEquals(new CourseRequestDaoImpl().findAllByStatus(true)
                .size(), 3);
        Assert.assertEquals(new CourseRequestDaoImpl().findAllByStatus(false)
                .size(), 2);
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

        Assert.assertEquals(
                new CourseRequestDaoImpl().findAllByInterval(from, till).size(),
                2);
    }

    @Test
    public void testFindAllByStudentId() throws SQLException, Exception {
        Assert.assertEquals(new CourseRequestDaoImpl().findAllByStudentId(2).size(), 2);
    }

    @Test
    public void testFindAllByGroupId() throws SQLException, Exception {
        Assert.assertEquals(new CourseRequestDaoImpl().findAllBySubjectId(1).size(), 2);

    }

}
