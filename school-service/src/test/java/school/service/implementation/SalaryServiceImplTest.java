package school.service.implementation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
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

import school.dao.SalaryDao;
import school.dao.TeacherDao;
import school.dao.UserDao;
import school.model.Teacher;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

public class SalaryServiceImplTest {
	@InjectMocks
	SalaryServiceImpl salaryService = new SalaryServiceImpl();
	@Mock
    SalaryDao salaryDaoStub;
	
	@Mock
    TeacherDao teacherDaoStub;
	@Mock
    UserDao userDaoStub;
    @Mock
    Principal mockedPrincipal;
    
    @Before
    public void initMocks() {
        MockitoAnnotations.initMocks(this);
    }
    
    @Test
	public void testGetHours() throws Exception {
    	 when(mockedPrincipal.getName()).thenReturn("1");
         Teacher teacher = new Teacher();
         teacher.setId(1);
         String str1 = "11/10/2014";
         Date from = new SimpleDateFormat("MM/dd/yyyy").parse(str1);
         String str2 = "12/10/2014";
         Date until = new SimpleDateFormat("MM/dd/yyyy").parse(str2);
         when(salaryDaoStub.findHoursByPeriod(1, from, until)).thenReturn(null);
         Assert.assertEquals(0, salaryService.getHours(from, teacher));
	}
    
    
}
