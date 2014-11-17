package school.service.implementation;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.InternetHeaders;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

import school.model.RegistrationCode;
import school.model.User;
import school.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService{

	private final static String serviceEmail = "schoolportalservice@gmail.com";
	private final static String servicePassword = "servicepassword";
	
	@Override
	public boolean sendRegistrationEmail(User user, RegistrationCode registrationCode, String url) {
		
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
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			String messageBody = "Dear ," + user.getLastName() + " " + user.getFirstName()
					+ "\n\n Please confirm your registration in School Portal!"
					+ "\n\n Enter this link: "
					+ "<a href='http://localhost:10080/school-web/registration/?u="
					+ user.getId()+"&c="+registrationCode.getRegistrationCode()+"'>school-web</a>";
			
			messageBodyPart.setText(messageBody,"UTF-8","html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);
 
			Transport.send(message);
			return true;
 
		} catch (MessagingException e) {
			return false;
		}
	}

	@Override
	public boolean sendNewPassword(User user,
			RegistrationCode registrationCode, String url) {
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
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			String messageBody = "Dear ," + user.getLastName() + " " + user.getFirstName()
					+ "\n\n Please confirm your registration in School Portal!"
					+ "\n\n Enter this link: "
					+ "<a href='http://localhost:10080/school-web/registration/?u="
					+ user.getId()+"&c="+registrationCode.getRegistrationCode()+"'>school-web</a>";
			
			messageBodyPart.setText(messageBody,"UTF-8","html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);
 
			Transport.send(message);
			return true;
 
		} catch (MessagingException e) {
			return false;
		}
	}
		
}
