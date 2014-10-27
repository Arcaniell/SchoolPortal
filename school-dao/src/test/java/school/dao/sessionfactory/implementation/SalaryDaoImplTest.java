package school.dao.sessionfactory.implementation;

import static org.junit.Assert.*;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.dbunit.dataset.DataSetException;
import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.operation.DatabaseOperation;
import org.hibernate.Session;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import school.model.Salary;

public class SalaryDaoImplTest extends DBUnitConfig {

    private SalaryDaoImpl salaryDaoImpl;
    private Salary salary;
    private List<Salary> salaries;

    public SalaryDaoImplTest() {
        super("SalaryDaoImplTest");
        // TODO Auto-generated constructor stub
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
        salaryDaoImpl = new SalaryDaoImpl();
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getGroup());
        DatabaseOperation.INSERT.execute(this.getDatabaseTester()
                .getConnection(), getSalary());

    }

    private IDataSet getSalary() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/salary.xml"));
    }

    private IDataSet getGroup() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/group.xml"));
    }

    @After
    public void tearDown() throws Exception {
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getSalary());
        DatabaseOperation.DELETE_ALL.execute(this.getDatabaseTester()
                .getConnection(), getGroup());
        DatabaseOperation.CLEAN_INSERT.execute(this.getDatabaseTester()
                .getConnection(), getBlank());
    }

    private IDataSet getBlank() throws DataSetException, IOException {
        return new FlatXmlDataSet(this.getClass().getResourceAsStream(
                "/blank.xml"));
    }

    @Override
    @Deprecated
    protected IDataSet getDataSet() throws DataSetException,
            FileNotFoundException, IOException {
        return null;
    }

    @Test
    public void testFindByDate() throws ParseException {
        Date date = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
                .parse("2014-10-13 18:00:00");
        salaries = salaryDaoImpl.findByDate(date);
        Assert.assertTrue(salaries.size() == 1);
    }

    @Test
    public void testFindByPeriod() throws ParseException {
        Date dateFrom = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
                .parse("2014-10-10 18:00:00");
        Date dateUntil = new SimpleDateFormat("yyyy-M-dd HH:mm:ss")
                .parse("2014-12-10 18:00:00");
        salaries = salaryDaoImpl.findByPeriod(dateFrom, dateUntil);
        Assert.assertTrue(salaries.size() == 2);
    }

    @Test
    public void testFindByTeacherId() {
        salaries = salaryDaoImpl.findByTeacherId(1L);
        Assert.assertTrue(salaries.size() == 2);
    }

}
