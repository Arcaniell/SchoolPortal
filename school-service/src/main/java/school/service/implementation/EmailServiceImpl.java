package school.service.implementation;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.stereotype.Service;

import school.model.RegistrationData;
import school.model.RestorePassword;
import school.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService{

	private final static String serviceEmail = "schoolportalservice2@gmail.com";
	private final static String servicePassword = "servicepassword";
	
	@Override
	public boolean sendRegistrationEmail(RegistrationData registrationData, String url) {
		
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
				InternetAddress.parse(registrationData.getUser().getEmail()));
			message.setSubject("Confirmation of registration at School Portal");
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			String messageBody = "<h2>Dear, " + registrationData.getUser().getLastName() + 
					" " + registrationData.getUser().getFirstName() + "</h2>"
					+ "<h4> Please click the link below to confirm your registration at School Portal!</h4>"
					+ "<a href='http://localhost:10080/school-web/registration/?u="
					+ registrationData.getUser().getId()+"&c="+
					registrationData.getRegistrationCode()+"'>"
					+ "http://localhost:10080/school-web/registration/?u="
					+ registrationData.getUser().getId()+"&c="+
					+ registrationData.getRegistrationCode() + "</a>";
			
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
	public boolean sendNewPassword(RestorePassword restorePassword, String url) {
		/*Dear ,

		You have requested a change of your email address for your user account at
		SoftServe ITA LMS. Please open the following URL in your browser in order to
		confirm this change.*/
		
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
				InternetAddress.parse(restorePassword.getUser().getEmail()));
			message.setSubject("Restoring of password at School Portal");
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			String messageBody = "<h2>Dear, " + restorePassword.getUser().getLastName() + 
					" " + restorePassword.getUser().getFirstName() + "</h2>"
					+ "<h4>You have requested a change of your password for your user account at"
					+ "School Portal.</h4> <h4>Your new password is "+restorePassword.getNewPassword()
					+ "</h4><h4> Please open the following URL in your browser in order to"
					+ " confirm this change</h4>"
					+ "<a href='http://localhost:10080/school-web/forgotpassword/?u="
					+ restorePassword.getUser().getId()+"&c="+
					restorePassword.getRestoreCode()+"'>"
					+ "http://localhost:10080/school-web/forgotpassword/?u="
					+ restorePassword.getUser().getId()+"&c="+
					+ restorePassword.getRestoreCode() + "</a>";
					
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
