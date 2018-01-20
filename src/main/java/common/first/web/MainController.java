package common.first.web;

import common.first.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;


@Controller
public class MainController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @Resource(name="UserService")
    private UserService userService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Main(Model model) throws Exception {
        return "main";
    }

    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String Setting(Model model) throws Exception {
        logger.info("setting");
        return "setting/setting";
    }
}