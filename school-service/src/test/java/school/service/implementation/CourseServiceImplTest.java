package school.service.implementation;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;

import school.dto.CourseRequestTeacherDTO;
import school.service.CourseRequestService;
import school.service.CourseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/service-context.xml" })
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class })
public class CourseServiceImplTest {
    @Autowired
    CourseRequestService courseRequestService;

    @Test
    public void testCreateUser() {
        /*
         * Date from=new Date(0); from.setYear(114); from.setMonth(6);
         * from.setMonth(1); Date till=new Date(0); till.setYear(114);
         * till.setMonth(10); from.setMonth(1); List<Course>
         * couses=courseService.getCourseByUserIdAndDataRange(300, from, till);
         * for (Course course : couses) {
         * System.out.println(course.getCourseName()); }
         */

        /*
         * List<CourseRequestDto> list = courseRequestService
         * .findRequestsByUserId(155L); if (list != null) { for
         * (CourseRequestDto courseRequestDto : list) {
         * System.out.println(courseRequestDto.getCourseName()); } }
         */
        // courseRequestService.addCourseRequest(155L, 17L);
        // courseRequestService.removeRequest(90L);
        /*
         * List<CourseRequestTeacherDTO> requests = courseRequestService
         * .showAllRequests(); for (CourseRequestTeacherDTO
         * courseRequestTeacherDTO : requests) {
         * System.out.println(courseRequestTeacherDTO.getName());
         * System.out.println(courseRequestTeacherDTO.getSize());
         * System.out.println(courseRequestTeacherDTO.getId()); }
         */
        //courseRequestService.altDeleteAllRequestsWithCourseId(73L);
        //courseRequestService.formGroupAndCloseRequests(74L,new Date(),new Date());
        Assert.assertNotNull(44);

    }

}
