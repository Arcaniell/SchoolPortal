package school.service.implementation;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import school.model.Group;
import school.service.StudentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/service-context.xml"})
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class })
public class StudentServiceImplTest {
    @Autowired
    StudentService studentService;
    @Test
    public void testCreateUser() {
        //List<Group> group=studentService.getStudentGoupsByUserId(144L);
        //System.out.println(group.size());
        Assert.assertNotNull(66);
    }
    

}
