package school.dao.implementation;

import java.io.IOException;
import java.util.List;

import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
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

import school.dao.CourseDao;
import school.model.Course;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/dao-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class CourseDaoImplTest extends DBUnitConfig {
    
    private List<Course> courses;
    @Autowired
    private CourseDao courseDaoImpl;
    

    public CourseDaoImplTest() {
        super("CourseDaoImplTest");
    }


    @Before
    public void setUp() throws Exception {
        super.setUp();
        IDataSet messageDataSet = getDataSet();
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), messageDataSet);
    }

    @After
    public void tearDown() throws Exception {
        IDataSet messageDataSet = getDataSet();
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), messageDataSet);
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/blank.xml"));
    }

    @Override
    protected IDataSet getDataSet() throws Exception {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/xml-data-sets/course.xml"));
    }

    @Test
    public void testFindByGroupNumber() {
        courses = courseDaoImpl.findByGroupNumber(5);
        Assert.assertTrue(courses.size() == 3);
    }

    @Test
    public void testFindByCoefficient() {
        courses = courseDaoImpl.findByCoefficient(1);
        Assert.assertTrue(courses.size() == 3);
    }

    @Test
    public void testFindCourseName() {
        courses = courseDaoImpl.findByCourseName("Math");
        Assert.assertTrue(courses.size() == 2);
    }

    @Test
    public void testFindByCourseNameAndGroupNumber() {
        courses = courseDaoImpl.findByCourseNameAndGroupNumber("Math", 5);
        Assert.assertTrue(courses.size() == 1);
    }

    

    @Test
    public void testFindAllAddition() {
        courses = courseDaoImpl.findAllByStatus(true);
        Assert.assertTrue(courses.size() == 3);
        courses = courseDaoImpl.findAllByStatus(false);
        Assert.assertTrue(courses.size() == 2);
    }

    @Test
    public void testFindByPriceRange() {
        courses = courseDaoImpl.findByPriceRange(1000, 1500);
        Assert.assertTrue(courses.size() == 2);
    }
}
