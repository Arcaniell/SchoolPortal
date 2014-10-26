package school.dao.sessionfactory.implementation;

import java.io.IOException;
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

import school.model.Teacher;

public class TeacherDaoImplTest extends DBUnitConfig {

    public TeacherDaoImplTest() {
        super("TeacherDaoImplTest");
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
                .getConnection(), getTeacher());

    }

    @After
    public void tearDown() throws Exception {
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/blank.xml"));
    }

    private IDataSet getTeacher() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/group.xml"));
    }

    @Override
    protected IDataSet getDataSet() throws Exception {
        return null;
    }

    public void testByUserId() throws Exception {
        // get students table
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("TEACHER");
        // tacking teacher with user id = 3
        long userId = (Long) actualTable.getValue(2, "userId");
        int rate = (Integer) actualTable.getValue(2, "rate");
        boolean isActive = (Boolean) actualTable.getValue(2, "isActive");
        // get teacher by tested method and check result
        Teacher teacher = new TeacherDaoImpl().findByUserId(3);
        Assert.assertEquals(teacher.getUser().getId(), userId);
        Assert.assertEquals(teacher.getRate(), rate);
        Assert.assertEquals(teacher.isActive(), isActive);
    }

    public void testFindAllByStatus() throws Exception {
        // tacking all active teachers, must be 1
        List<Teacher> activeTeacher = (List<Teacher>) new TeacherDaoImpl()
                .findAllByStatus(true);
        Assert.assertEquals(activeTeacher.size(), 1);
        // tacking all archive teacher, must be 3
        List<Teacher> archiveTeacher = (List<Teacher>) new TeacherDaoImpl()
                .findAllByStatus(false);
        Assert.assertEquals(archiveTeacher.size(), 3);
    }

    public void testFindAllInRateRange() {
        List<Teacher> rangeTeacher = (List<Teacher>) new TeacherDaoImpl()
                .findAllInRateRange(2, 5);
        Assert.assertEquals(rangeTeacher.size(), 2);
    }

}
