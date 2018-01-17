package common.first.web;

import common.first.service.SqlService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


@Controller
public class MainController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @Resource(name="SqlService")
    private SqlService sqlService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Main(Model model) throws Exception {
        logger.info("index.....");
        return "main";
    }
    @RequestMapping("/list")
    public String List(Model model) throws Exception {
        logger.info("list");
        return "list";
    }
    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public String Item(Model model) throws Exception {
        logger.info("item");
        return "item";
    }
    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String Setting(Model model) throws Exception {
        logger.info("setting");
        return "setting/setting";
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public ModelAndView SignUp(Map<String,Object> commandMap,
                               @RequestParam(value = "m_email") String email,
                               @RequestParam(value = "m_pass") String password,
                               @RequestParam(value = "m_name") String nickName,
                               HttpSession session) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ModelAndView mv = new ModelAndView("main");
        Date d = new Date();
        df.format(d);
        commandMap.put("email", email);
        commandMap.put("password", password);
        commandMap.put("nickName", nickName);
        System.out.println(commandMap.get("email") + " " + commandMap.get("password") + " " + commandMap.get("nickName"));

        int t = -100;
        try{
            t = (int)sqlService.insertUser(commandMap);
        }catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(t);
        return mv;
    }

}