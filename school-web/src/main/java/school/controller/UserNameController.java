package school.controller;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import school.service.UserService;

@Controller
public class UserNameController {
    @Autowired
    UserService userSrv;

    private class UserName {
        String name;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

    @RequestMapping(value = "/getUserNameController")
    public @ResponseBody UserName getNameById(Principal principal) {
        if (principal != null) {
            long id = Long.parseLong(principal.getName());
            String fullName = userSrv.getUserNameById(id);
            UserName formName = new UserName();
            formName.setName(fullName);
            return formName;
        }
        return new UserName();

    }
}
