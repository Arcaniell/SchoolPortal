package school.service.implementation;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import school.model.User;
import school.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService{

	private final static String serviceEmail = "schoolportalservice@gmail.com";
	private final static String servicePassword = "servicepassword";
	
	@Override
	public void sendRegistrationEmail(User user) {
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(serviceEmail, servicePassword);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(serviceEmail));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(user.getEmail()));
			message.setSubject("Confirmation of registration in School Portal");
			message.setText("Dear ," + user.getLastName() + " " + user.getFirstName()
				+ "\n\n Please confirm your registration in School Portal");
 
			Transport.send(message);
 
		} catch (MessagingException e) {
			System.out.println("faile");
		}
	}
		
}
