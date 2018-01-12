package common.first.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Index(Model model) throws Exception {
        logger.info("index.....");
        return "main";
    }
    @RequestMapping("/main.jsp")
    public String Main(Model model) throws Exception {
        logger.info("main.....");
        return "home";
    }
}