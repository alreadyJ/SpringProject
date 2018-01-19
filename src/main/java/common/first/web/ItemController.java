package common.first.web;

import common.first.service.SqlService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Controller
public class ItemController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @Resource(name="SqlService")
    private SqlService sqlService;

    @RequestMapping("/list")
    public String List(Model model) throws Exception {
        logger.info("list");
        return "list/list";
    }

    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public String Item(Model model) throws Exception {
        logger.info("item");
        return "list/item";
    }

    @RequestMapping("/post")
    public String Post(Model model) throws Exception {

        return "post/post";
    }
}
