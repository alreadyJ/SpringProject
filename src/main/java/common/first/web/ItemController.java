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

    @RequestMapping("/list")
    public ModelAndView List(Model model, HttpSession session,
                             Map<String,Object> commandMap) throws Exception {
        logger.info("list");
        ModelAndView mv = new ModelAndView("list/list");
        List<Map<String,Object>> list = listService.selectSale();
        List<SaleList> sales = new LinkedList<>();

        for (int i = 0; i < list.size(); i++) {
            SaleList sl = new SaleList();
            sl.setSerial((int)list.get(i).get("serial"));
            commandMap.put("serial", sl.getSerial());

            List<Map<String,Object>> images = listService.selectSaleImage(commandMap);
            for (int j = 0; j < images.size(); j++) {
                sl.addImage(images.get(j).get("saleImg").toString());
            }
            sl.setUser((int)list.get(i).get("user"));
            User user = new User();
            commandMap.put("serial", sl.getUser());
            List<Map<String,Object>> userList;

            userList = userService.selectUserWithSerial(commandMap);
            user.setEmail(userList.get(0).get("email").toString());
            user.setNickName(userList.get(0).get("nickName").toString());
            user.setProfileImg(userList.get(0).get("profileImg").toString());
            sl.setUserInfo(user);

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

        /*
        * End of saleList
        * */

        list = listService.selectTrip();
        List<TripList> trips = new LinkedList<>();

        for (int i = 0; i < list.size(); i++) {
            TripList tl = new TripList();
            tl.setSerial((int)list.get(i).get("serial"));
            tl.setUser((int)list.get(i).get("user"));
            User user = new User();
            commandMap.put("serial", tl.getUser());
            List<Map<String,Object>> userList = userService.selectUserWithSerial(commandMap);
            user.setEmail(userList.get(0).get("email").toString());
            user.setNickName(userList.get(0).get("nickName").toString());
            user.setProfileImg(userList.get(0).get("profileImg").toString());
            tl.setUserInfo(user);

            tl.setSource(list.get(i).get("source").toString());
            tl.setDestination(list.get(i).get("destination").toString());
            tl.setIsRound((int)list.get(i).get("isRound"));
            tl.setPurpose(list.get(i).get("purpose").toString());
            tl.setDepartureDate(list.get(i).get("departureDate").toString());
            tl.setArrivalDate(list.get(i).get("arrivalDate").toString());
            tl.setSchedule(list.get(i).get("schedule").toString());
            String url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=240&photoreference=" +
                    list.get(i).get("location").toString() + "&key=AIzaSyAz80kYOAljI22ua7Bjsxre3CCzTrsMxrg";
            tl.setLocation(url);
            tl.setStatus((int)list.get(i).get("status"));
            trips.add(tl);
        }
        mv.addObject("trips", trips);
        mv.addObject("key", "");
        /*
        * End of TripList
        * */


        List<RequestList> requests = new LinkedList<>();
        list = listService.selectRequest();

        for (int i = 0; i < list.size(); i++) {
            RequestList rl = new RequestList();
            rl.setSerial((int)list.get(i).get("serial"));
            commandMap.put("serial", rl.getSerial());

            List<Map<String,Object>> images = listService.selectRequestImage(commandMap);
            for (int j = 0; j < images.size(); j++) {
                rl.addImage(images.get(j).get("requestImg").toString());
                logger.info(images.get(j).get("requestImg").toString());
            }
            rl.setUser((int)list.get(i).get("user"));
            User user = new User();
            commandMap.put("serial", rl.getUser());
            List<Map<String,Object>> userList = userService.selectUserWithSerial(commandMap);
            user.setEmail(userList.get(0).get("email").toString());
            user.setNickName(userList.get(0).get("nickName").toString());
            user.setProfileImg(userList.get(0).get("profileImg").toString());
            rl.setUserInfo(user);

            rl.setTitle(list.get(i).get("title").toString());
            rl.setCategory(list.get(i).get("category").toString());
            rl.setDetail(list.get(i).get("detail").toString());
            rl.setLocation(list.get(i).get("location").toString());
            rl.setRegisterDate(list.get(i).get("registerDate").toString());
            rl.setExpiration(list.get(i).get("expiration").toString());
            rl.setQuantity((int)list.get(i).get("quantity"));
            rl.setPrice((int)list.get(i).get("price"));
            rl.setServiceFee((int)list.get(i).get("serviceFee"));
            rl.setStatus((int)list.get(i).get("status"));
            requests.add(rl);
        }
        mv.addObject("requests", requests);

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
