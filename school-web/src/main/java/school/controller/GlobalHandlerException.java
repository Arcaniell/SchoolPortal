package school.controller;

import java.net.ConnectException;
import java.sql.SQLException;

import javax.persistence.PersistenceException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.NestedServletException;

import com.mysql.jdbc.exceptions.MySQLNonTransientConnectionException;

@ControllerAdvice
public class GlobalHandlerException {

    private static final Logger logger = LoggerFactory.getLogger(GlobalHandlerException.class);

    @ExceptionHandler(NullPointerException.class)
    public ModelAndView handleNullPointerException(HttpServletRequest request, Exception exception) {
        logger.info("NullPointerException:: URL=" + request.getRequestURL());
        ModelAndView model = new ModelAndView("errorPage");
        model.addObject("message", "Sorry, there is no data available for your request");
        model.addObject("exc", exception.toString());

        return model;
    }

    @ExceptionHandler(SQLException.class)
    public ModelAndView handleSQLException(HttpServletRequest request, Exception exception) {
        ModelAndView model = new ModelAndView(request.getRequestURI());
        model.addObject("message", "exception");
        return model;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleSQLException2(HttpServletRequest request, Exception exception) {
        ModelAndView model = new ModelAndView("errorPage");
        model.addObject("message", "Sorry, there is no data available for your request");
        model.addObject("exc", exception.toString());
        return model;
    }
}
