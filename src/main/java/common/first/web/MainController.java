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
}