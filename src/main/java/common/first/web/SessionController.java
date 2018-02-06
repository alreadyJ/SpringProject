package common.first.web;

import common.first.service.UserService;
import common.pro.dao.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;



@Controller
public class SessionController {
    protected Logger logger = Logger.getLogger(this.getClass());
    @Resource(name="UserService")
    private UserService userService;


    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public void  SignUp(HttpServletRequest req, HttpServletResponse res,
                        Map<String,Object> commandMap, HttpSession session)  throws Exception {
        PrintWriter out = res.getWriter();
        String email = (req.getParameter("m_email") == null) ? "" : String.valueOf(req.getParameter("m_email"));
        String password = (req.getParameter("m_pass") == null) ? "" : String.valueOf(req.getParameter("m_pass"));
        String nickName = (req.getParameter("m_name") == null) ? "" : String.valueOf(req.getParameter("m_name"));

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date d = new Date();
        System.out.println("testing222222");
        commandMap.put("email", email);
        commandMap.put("password", password);
        commandMap.put("nickName", nickName);
        commandMap.put("signUpDate", df.format(d));

        int t = (int)userService.insertUser(commandMap);
        out.print(t);out.flush();out.close();
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void  Login(HttpServletRequest req, HttpServletResponse res,
                       Map<String,Object> commandMap, HttpSession session)  throws Exception {
        PrintWriter out = res.getWriter();
        String email = (req.getParameter("email") == null) ? "" : String.valueOf(req.getParameter("email"));
        String password = (req.getParameter("pass") == null) ? "" : String.valueOf(req.getParameter("pass"));

        commandMap.put("email", email);
        commandMap.put("password", password);
        logger.info("sss");
        List<Map<String,Object>> list = null;
        try {
             list = userService.selectLogin(commandMap);
        }catch (Exception e) {
            logger.info(e);
        }

        logger.info(list.get(0).get("nickName") + " sssss");

        User user = new User();
        if (list.get(0).get("cnt").toString().equals("1")) {
            user.setSerial((int)list.get(0).get("serial"));
            user.setEmail(list.get(0).get("email").toString());
            user.setNickName(list.get(0).get("nickName").toString());
            user.setProfileImg(list.get(0).get("profileImg").toString());
            user.setSignUpDate(list.get(0).get("signUpDate").toString());
            session.setAttribute("User", user);
        }

        logger.info(list.get(0).get("nickName") + " tttt");

        out.print(list.get(0).get("cnt").toString().equals("1") ? 1 : 0);
        out.flush();out.close();
    }

    @RequestMapping(value = "/checkDuplicate", method = RequestMethod.POST)
    public void CheckDuplicate(HttpServletRequest req, HttpServletResponse res,
                               Map<String,Object> commandMap, HttpSession session)  throws Exception {
        PrintWriter out = res.getWriter();
        String email = (req.getParameter("email") == null) ? "" : String
                .valueOf(req.getParameter("email"));
        commandMap.put("email", email);
        List<Map<String,Object>> list = userService.selectUserExist(commandMap);
        System.out.println((list.get(0).get("cnt").toString().equals("1")));
        out.print((list.get(0).get("cnt").toString().equals("1")) ? 1 : 0);
        out.flush();out.close();
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public void LogOut(HttpServletRequest req, HttpServletResponse res,
                               Map<String,Object> commandMap, HttpSession session)  throws Exception {
        PrintWriter out = res.getWriter();
        session.removeAttribute("User");
        session.invalidate();
        out.print(1);
        out.flush();out.close();
    }

}
