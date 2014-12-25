package school.controller;

import java.net.SocketException;
import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.TransactionException;
import org.hibernate.exception.JDBCConnectionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.TransactionSystemException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import com.mysql.jdbc.CommunicationsException;
import com.mysql.jdbc.exceptions.jdbc4.MySQLNonTransientConnectionException;

@ControllerAdvice
public class GlobalHandlerException {

	private static final Logger logger = LoggerFactory
			.getLogger(GlobalHandlerException.class);

	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handleNullPointerException(HttpServletRequest request,
			Exception exception) {
		logger.info("NullPointerException:: URL=" + request.getRequestURL());
		ModelAndView model = new ModelAndView("errorPage");
		model.addObject("message",
				"Sorry, there is no data available for your request");
		model.addObject("exc", exception.toString());

		return model;
	}

	@ExceptionHandler({ PersistenceException.class,
			JDBCConnectionException.class, CommunicationsException.class,
			SocketException.class, TransactionSystemException.class,
			TransactionException.class,
			MySQLNonTransientConnectionException.class, })
	public ModelAndView handlePersistenceException(HttpServletRequest request,
			Exception exception) {
		logger.info("PersistenceException:: URL=" + request.getRequestURL());
		ModelAndView model = new ModelAndView("errorPage");
		model.addObject("message",
				"Sorry, server is not available at this time");
		model.addObject("exc", exception.toString());

		return model;
	}

}
