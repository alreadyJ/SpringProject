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
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


@Controller
public class MainController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @Resource(name="UserService")
    private UserService userService;
    @Resource(name="ListService")
    private ListService listService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView Main(Model model, Map<String,Object> commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("main");
        List<Map<String,Object>> list;
        List<SaleList> sales = new LinkedList<>();
        List<TripList> trips = new LinkedList<>();
        List<RequestList> requests = new LinkedList<>();

        logger.info("requesting: sale");
        list = listService.selectSale();
        int limit = Math.min(list.size(), 4);
        for (int i = 0; i < limit; i++) {
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


        list = listService.selectTrip();
        limit = Math.min(list.size(), 4);
        for (int i = 0; i < limit; i++) {
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

        list = listService.selectRequest();
        limit = Math.min(list.size(), 4);
        for (int i = 0; i < limit; i++) {
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
        return mv;
    }

    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String Setting(Model model) throws Exception {
        logger.info("setting");
        return "setting/setting";
    }

    @RequestMapping(value = "/googleMap", method = RequestMethod.GET)
    public String googleMap(Model model) throws Exception {
        return "googleMap";
    }

}