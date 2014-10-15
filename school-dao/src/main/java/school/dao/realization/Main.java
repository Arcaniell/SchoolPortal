package school.dao.realization;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import school.dao.DaoUser;
import school.model.CourseRequest;
import school.model.Group2;
import school.model.Journal;
import school.model.Lesson;
import school.model.Message;
import school.model.Parent;
import school.model.Role;
import school.model.RoleRequest;
import school.model.Room;
import school.model.Salary;
import school.model.Schedule;
import school.model.Student;
import school.model.Subject;
import school.model.Teacher;
import school.model.User;

public class Main {
	public static void main(String[] args) {
		
//		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
//		Session session = sessionFactory.openSession();
//		session.close();
		
		
		try{
			SessionFactory sessionFactory = new AnnotationConfiguration()
            .addPackage("school.model").addAnnotatedClass(User.class)
            .addAnnotatedClass(Role.class)
            .addAnnotatedClass(CourseRequest.class)
            .addAnnotatedClass(Group2.class)
            .addAnnotatedClass(Journal.class)
            .addAnnotatedClass(Lesson.class)
            .addAnnotatedClass(Message.class)
            .addAnnotatedClass(Parent.class)
            .addAnnotatedClass(RoleRequest.class)
            .addAnnotatedClass(Room.class)
            .addAnnotatedClass(Salary.class)
            .addAnnotatedClass(Schedule.class)
            .addAnnotatedClass(Student.class)
            .addAnnotatedClass(Teacher.class)
            .addAnnotatedClass(Subject.class).configure()
            .buildSessionFactory();
			Session session = sessionFactory.openSession();
			session.close();
	      }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
	}
}
