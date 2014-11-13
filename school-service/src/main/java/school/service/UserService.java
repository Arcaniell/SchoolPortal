package school.service;

import school.model.User;

public interface UserService {
    User createUser(User user);

    /**
     * @param id
     *            id of our logged user
     * @return true if user is a head teacher
     * @author Blowder
     */
    boolean isUserHeadTeacher(long id);

    /**
     * @param id
     *            id of our logged user
     * @return true if user is a student
     * @author Blowder
     */
    boolean isUserStudent(long id);

}
