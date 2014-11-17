package school.service;

import school.model.User;

public interface UserService {
    User createUser(User user);

    /**
     * @param id
     *            id of our logged user
     * @return true if user is a student
     * @author Blowder
     */
    String getUserNameById(long id);

}
