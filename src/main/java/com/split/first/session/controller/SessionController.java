package com.split.first.session.controller;

import com.split.first.Item.controller.UtilFile;
import com.split.first.session.dto.User;
import com.split.first.session.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;


@RestController
public class SessionController {
    protected Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/sign-up", method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_VALUE})
    public void  SignUp(User user) {
        userService.insertUser(user);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void  Login(User user, HttpSession session) {
        User signedInUser = userService.login(user);
        session.setAttribute("User", signedInUser);
    }

    @RequestMapping(value = "/check-duplicate", method = RequestMethod.POST)
    public boolean CheckDuplicatedEmail(String email)  {
        return userService.isDuplicatedEmail(email);
    }

    @RequestMapping(value = "/sign-out", method = RequestMethod.GET)
    public void signOut(HttpSession session) {
        session.removeAttribute("User");
        session.invalidate();
    }

    @RequestMapping(value = "/saveProfile", produces = "text/plain; charset=UTF-8",  method = RequestMethod.POST)
    public String postSale(@RequestParam("image-file") MultipartFile uploadFile1
            , MultipartHttpServletRequest req, HttpServletResponse res,
                           Map<String,Object> commandMap, HttpSession session) {
        UtilFile utilFile = new UtilFile();
        String uploadPath;
        uploadPath = null;
        if (req.getParameter("image-flag").equals("1")) uploadPath = utilFile.fileUpload(req, uploadFile1);

        commandMap.put("serial", req.getParameter("userSerial"));
        commandMap.put("country", req.getParameter("selected-location"));
        commandMap.put("address", req.getParameter("address"));
        commandMap.put("description", req.getParameter("description"));
        commandMap.put("profileImg", "");
        if (req.getParameter("image-flag").equals("1")) {
            String path = uploadPath.split("/resources/images/")[1];
            commandMap.put("profileImg", path);
        }

        int t = (int)userService.updateUser(commandMap);

        if (t == 1) {
            User user = (User)session.getAttribute("User");
            user.setCountry(commandMap.get("country").toString());
            user.setAddress(commandMap.get("address").toString());
            user.setDescription(commandMap.get("description").toString());
            user.setProfileImage(commandMap.get("profileImg").toString());
            session.removeAttribute("User");
            session.setAttribute("User", user);
        }
        return "redirect:setting";
    }

}
