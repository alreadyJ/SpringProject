package common.first.web;

import common.first.service.ListService;
import common.pro.dao.SalesList;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class ItemController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @Resource(name="ListService")
    private ListService listService;

    @RequestMapping("/list")
    public ModelAndView List(Model model, HttpSession session,
                             Map<String,Object> commandMap) throws Exception {
        logger.info("list");
        ModelAndView mv = new ModelAndView("list/list");
        List<Map<String,Object>> list = listService.selectSales();
        List<SalesList> sales = new LinkedList<>();

        for (int i = 0; i < list.size(); i++) {
            SalesList sl = new SalesList();
            sl.setSerial((int)list.get(i).get("serial"));
            commandMap.put("serial", sl.getUser());
            List<Map<String,Object>> images = listService.selectSalesImages(commandMap);
            for (int j = 0; j < images.size(); j++) {
                sl.addImage(images.get(i).get("salesImg").toString());
            }
            sl.setUser((int)list.get(i).get("user"));
            sl.setTitle(list.get(i).get("title").toString());
            sl.setCategory(list.get(i).get("category").toString());
            sl.setDetail(list.get(i).get("detail").toString());
            sl.setLocation(list.get(i).get("location").toString());
            sl.setRegisterDate(list.get(i).get("registerDate").toString());
            sl.setExpiration(list.get(i).get("expiration").toString());
            sl.setQuantity((int)list.get(i).get("quantity"));
            sl.setRemainQuantity((int)list.get(i).get("remainQuantity"));
            sl.setPrice((int)list.get(i).get("price"));
            sl.setStatus((int)list.get(i).get("status"));
            sales.add(sl);
        }
        mv.addObject("sales", sales);
        return mv;
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
