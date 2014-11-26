package school.service.implementation;

import java.util.Properties;

import javax.mail.Message;
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

	private Properties emailPropoperties =  new Properties();


	@Override
	public boolean sendRegistrationEmail(RegistrationData registrationData, String url) {
		
		try {
			emailPropoperties.load(EmailServiceImpl.class.getClassLoader()
					.getResourceAsStream("email.properties"));
 
			Message message = new MimeMessage(Session.getInstance(emailPropoperties,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailPropoperties.getProperty("service.email"),
						emailPropoperties.getProperty("service.password"));
			}
		  }));
			message.setFrom(new InternetAddress(emailPropoperties.getProperty("service.email")));
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
			
			messageBodyPart.setText(messageBody,emailPropoperties.getProperty("service.utf"),
					emailPropoperties.getProperty("service.html"));

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);
 
			Transport.send(message);
			return true;
 
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean sendNewPassword(RestorePassword restorePassword, String url) {
		try {
			emailPropoperties.load(EmailServiceImpl.class.getClassLoader()
					.getResourceAsStream("email.properties"));
		Session session = Session.getInstance(emailPropoperties,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailPropoperties.getProperty("service.email"),
						emailPropoperties.getProperty("service.password"));
			}
		  });
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(emailPropoperties.getProperty("service.email")));
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
					
			messageBodyPart.setText(messageBody,emailPropoperties.getProperty("service.utf"),
					emailPropoperties.getProperty("service.html"));

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			message.setContent(multipart);
			Transport.send(message);
			return true;
 
		} catch (Exception e) {
			return false;
		}
	}
		
}
