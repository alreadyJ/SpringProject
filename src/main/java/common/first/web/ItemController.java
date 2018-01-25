package common.first.web;

import common.first.service.ListService;
import common.first.service.UserService;
import common.pro.dao.RequestList;
import common.pro.dao.SaleList;
import common.pro.dao.TripList;
import common.pro.dao.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

    @Resource(name="UserService")
    private UserService userService;

    @RequestMapping(value = "/list/{type}", method = RequestMethod.GET)
    public ModelAndView List(Model model, HttpSession session,
                             Map<String,Object> commandMap,
                             @PathVariable String type) throws Exception {
        ModelAndView mv = new ModelAndView("list/list");
        List<Map<String,Object>> list;
        List<SaleList> sales = new LinkedList<>();
        List<TripList> trips = new LinkedList<>();
        List<RequestList> requests = new LinkedList<>();

        switch (type) {
            case "sale":
                logger.info("requesting: sale");
                list = listService.selectSale();
                for (int i = 0; i < list.size(); i++) {
                    SaleList sl = new SaleList();
                    sl.setSerial((int)list.get(i).get("serial"));
                    commandMap.put("serial", sl.getSerial());
                    List<Map<String,Object>> images = listService.selectSaleImage(commandMap);
                    sl.addImage(images.get(0).get("saleImg").toString());
                    sl.setUser((int)list.get(i).get("user"));
                    sl.setTitle(list.get(i).get("title").toString());
                    sl.setCategory(list.get(i).get("category").toString());
                    sl.setLocation(list.get(i).get("location").toString());
                    sl.setExpiration(list.get(i).get("expiration").toString());
                    sl.setPrice((int)list.get(i).get("price"));
                    sales.add(sl);
                }
                mv.addObject("sales", sales);
                break;
            case "trip":
                list = listService.selectTrip();
                for (int i = 0; i < list.size(); i++) {
                    TripList tl = new TripList();
                    tl.setSerial((int)list.get(i).get("serial"));
                    tl.setUser((int)list.get(i).get("user"));
                    User user = new User();
                    commandMap.put("serial", tl.getUser());
                    List<Map<String,Object>> userList = userService.selectUserWithSerial(commandMap);
                    user.setNickName(userList.get(0).get("nickName").toString());
                    user.setProfileImg(userList.get(0).get("profileImg").toString());
                    logger.info(user.getNickName() + " " + user.getProfileImg());
                    tl.setUserInfo(user);
                    tl.setSource(list.get(i).get("source").toString());
                    tl.setDestination(list.get(i).get("destination").toString());
                    tl.setIsRound((int)list.get(i).get("isRound"));
                    tl.setDepartureDate(list.get(i).get("departureDate").toString());
                    tl.setArrivalDate(list.get(i).get("arrivalDate").toString());
                    String url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=240&photoreference=" +
                            list.get(i).get("location").toString() + "&key=AIzaSyAz80kYOAljI22ua7Bjsxre3CCzTrsMxrg";
                    tl.setLocation(url);
                    tl.setStatus((int)list.get(i).get("status"));
                    trips.add(tl);
                }
                mv.addObject("trips", trips);
                break;
            case "request":
                list = listService.selectRequest();
                for (int i = 0; i < list.size(); i++) {
                    RequestList rl = new RequestList();
                    rl.setSerial((int)list.get(i).get("serial"));
                    commandMap.put("serial", rl.getSerial());
                    List<Map<String,Object>> images = listService.selectRequestImage(commandMap);
                    rl.addImage(images.get(0).get("requestImg").toString());
                    rl.setTitle(list.get(i).get("title").toString());
                    rl.setCategory(list.get(i).get("category").toString());
                    rl.setDetail(list.get(i).get("detail").toString());
                    rl.setLocation(list.get(i).get("location").toString());
                    rl.setExpiration(list.get(i).get("expiration").toString());
                    rl.setServiceFee((int)list.get(i).get("serviceFee"));
                    requests.add(rl);
                }
                mv.addObject("requests", requests);
                break;
            default:break;
        }
        mv.addObject("type", type);

        return mv;

    }

    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public String Item(Model model) throws Exception {
        logger.info("item");
        return "list/item";
    }

    @RequestMapping(value = "/post/{type}", method = RequestMethod.GET)
    public ModelAndView Post(Model model, @PathVariable String type) throws Exception {
        ModelAndView mv = new ModelAndView("post/post");
        mv.addObject("type", type);
        return mv;
    }
}
