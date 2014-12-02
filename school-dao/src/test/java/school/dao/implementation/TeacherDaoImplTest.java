package school.dao.implementation;

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

import school.dao.TeacherDao;
import school.model.Teacher;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class TeacherDaoImplTest extends DBUnitConfig {

    @Autowired
    TeacherDao teacherDaoImpl;

    public TeacherDaoImplTest() {
        super("TeacherDaoImplTest");
    }

    @Before
    public void setUp() throws Exception {
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getTeacher());

    }

    @After
    public void tearDown() throws Exception {
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getTeacher());
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/blank.xml"));
    }

    private IDataSet getTeacher() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/group.xml"));
    }

    @Override
    protected IDataSet getDataSet() throws Exception {
        return null;
    }

   @Test
    public void testByUserId() throws Exception {
        // get students table
        IDataSet databaseDataSet = getConnection().createDataSet();
        ITable actualTable = databaseDataSet.getTable("TEACHER");
        // tacking teacher with user id = 3
        long userId = (Long) actualTable.getValue(2, "userId");
        int rate = (Integer) actualTable.getValue(2, "rate");
        boolean isActive = (Boolean) actualTable.getValue(2, "isActive");
        // get teacher by tested method and check result
        while(teacherDaoImpl.findByUserId(3)==null){}
        Teacher teacher = teacherDaoImpl.findByUserId(3);
        Assert.assertEquals(teacher.getUser().getId(), userId);
        Assert.assertEquals(teacher.getRate(), rate);
        Assert.assertEquals(teacher.isActive(), isActive);
       /* Assert.assertEquals(true, true);*/
    }

   @Test
    public void testFindAllByStatus() throws Exception {
        // tacking all active teachers, must be 1
        List<Teacher> activeTeacher = (List<Teacher>) teacherDaoImpl
                .findAllByStatus(true);
        Assert.assertEquals(activeTeacher.size(), 1);
        // tacking all archive teacher, must be 3
        List<Teacher> archiveTeacher = (List<Teacher>) teacherDaoImpl
                .findAllByStatus(false);
        Assert.assertEquals(archiveTeacher.size(), 3);
    }
    @Test
    public void testFindAllInRateRange() {
        List<Teacher> rangeTeacher = (List<Teacher>) teacherDaoImpl
                .findAllInRateRange(2, 5);
        Assert.assertEquals(rangeTeacher.size(), 2);

    }/* */

}
