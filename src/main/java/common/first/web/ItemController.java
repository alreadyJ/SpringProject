package common.first.web;


import common.first.service.ListService;
import common.first.service.UserService;
import common.pro.dao.*;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;


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

    @RequestMapping(value = "/item/sale/{serial}", method = RequestMethod.GET)
    public ModelAndView ItemSale(Model model, HttpSession session,
                       Map<String,Object> commandMap,
                       @PathVariable String serial) throws Exception {
        ModelAndView mv = new ModelAndView("list/itemSale");
        Map<String,Object> list;

        commandMap.put("serial", serial);
        list = listService.selectOneSale(commandMap);
        SaleList sl = new SaleList();
        sl.setSerial((int)list.get("serial"));
        List<Map<String,Object>> images = listService.selectSaleImage(commandMap);
        for (int i = 0; i < images.size(); i++) {
            sl.addImage(images.get(i).get("saleImg").toString());
        }
        sl.setUser((int)list.get("user"));
        sl.setTitle(list.get("title").toString());
        sl.setCategory(list.get("category").toString());
        sl.setLocation(list.get("location").toString());
        sl.setDetail(list.get("detail").toString());
        sl.setExpiration(list.get("expiration").toString());
        sl.setQuantity((int)list.get("quantity"));
        sl.setRemainQuantity((int)list.get("remainQuantity"));
        sl.setMaxPurchase((int)list.get("maxPurchase"));
        sl.setPrice((int)list.get("price"));
        mv.addObject("sale", sl);
        commandMap.put("type", "0");
        commandMap.put("itemSerial", sl.getSerial());
        List<Map<String, Object>> cList = listService.selectComment(commandMap);
        List<Comment> commentList = new LinkedList<>();

        for (int i = 0; i < cList.size(); i++) {
            User user = new User();
            commandMap.put("serial", (int)cList.get(i).get("userSerial"));
            List<Map<String,Object>> userList = userService.selectUserWithSerial(commandMap);
            user.setSerial((int)cList.get(i).get("userSerial"));
            user.setNickName(userList.get(0).get("nickName").toString());
            user.setProfileImg(userList.get(0).get("profileImg").toString());
            Comment comment = new Comment((int)cList.get(i).get("serial"),
                    cList.get(i).get("text").toString(),
                    cList.get(i).get("registerDate").toString(), user);
            commentList.add(comment);
        }
        mv.addObject("comments", commentList);
        return mv;
    }

    @RequestMapping(value = "/item/trip/{serial}", method = RequestMethod.GET)
    public ModelAndView ItemTrip(Model model, HttpSession session,
                       Map<String,Object> commandMap,
                       @PathVariable String serial) throws Exception {

        ModelAndView mv = new ModelAndView("list/itemTrip");

        Map<String,Object> list;
        commandMap.put("serial", serial);
        list = listService.selectOneTrip(commandMap);
        TripList tl = new TripList();
        tl.setSerial((int)list.get("serial"));
        tl.setUser((int)list.get("user"));
        User user = new User();
        commandMap.put("serial", tl.getUser());
        List<Map<String,Object>> userList = userService.selectUserWithSerial(commandMap);
        user.setNickName(userList.get(0).get("nickName").toString());
        user.setProfileImg(userList.get(0).get("profileImg").toString());
        logger.info(user.getNickName() + " " + user.getProfileImg());
        tl.setUserInfo(user);
        tl.setSource(list.get("source").toString());
        tl.setDestination(list.get("destination").toString());
        tl.setIsRound((int)list.get("isRound"));
        tl.setPurpose(list.get("purpose").toString());
        tl.setDepartureDate(list.get("departureDate").toString());
        tl.setArrivalDate(list.get("arrivalDate").toString());
        tl.setSchedule(list.get("schedule").toString());
        tl.setLocation(list.get("location").toString());
        tl.setStatus((int)list.get("status"));
        mv.addObject("trip", tl);

        commandMap.put("type", "1");
        commandMap.put("itemSerial", tl.getSerial());
        List<Map<String, Object>> cList = listService.selectComment(commandMap);
        List<Comment> commentList = new LinkedList<>();

        for (int i = 0; i < cList.size(); i++) {
            user = new User();
            commandMap.put("serial", (int)cList.get(i).get("userSerial"));
            userList = userService.selectUserWithSerial(commandMap);
            user.setSerial((int)cList.get(i).get("userSerial"));
            user.setNickName(userList.get(0).get("nickName").toString());
            user.setProfileImg(userList.get(0).get("profileImg").toString());
            Comment comment = new Comment((int)cList.get(i).get("serial"),
                    cList.get(i).get("text").toString(),
                    cList.get(i).get("registerDate").toString(), user);
            commentList.add(comment);
        }
        mv.addObject("comments", commentList);

        return mv;
    }

    @RequestMapping(value = "/item/request/{serial}", method = RequestMethod.GET)
    public ModelAndView ItemRequest(Model model, HttpSession session,
                           Map<String,Object> commandMap,
                           @PathVariable String serial) throws Exception {
        ModelAndView mv = new ModelAndView("list/itemRequest");
        Map<String,Object> list;

        commandMap.put("serial", serial);
        list = listService.selectOneRequest(commandMap);
        RequestList rl = new RequestList();
        rl.setSerial((int)list.get("serial"));
        rl.setUser((int)list.get("user"));
        List<Map<String,Object>> images = listService.selectRequestImage(commandMap);
        for (int i = 0; i < images.size(); i++) {
            rl.addImage(images.get(i).get("requestImg").toString());
        }
        rl.setTitle(list.get("title").toString());
        rl.setCategory(list.get("category").toString());
        rl.setDetail(list.get("detail").toString());
        rl.setLocation(list.get("location").toString());
        rl.setRegisterDate(list.get("registerDate").toString());
        rl.setQuantity((int)list.get("quantity"));
        rl.setExpiration(list.get("expiration").toString());
        rl.setServiceFee((int)list.get("serviceFee"));
        rl.setPrice((int)list.get("price"));

        mv.addObject("request", rl);


        commandMap.put("type", "2");
        commandMap.put("itemSerial", rl.getSerial());
        List<Map<String, Object>> cList = listService.selectComment(commandMap);
        List<Comment> commentList = new LinkedList<>();

        for (int i = 0; i < cList.size(); i++) {
            User user = new User();
            commandMap.put("serial", (int)cList.get(i).get("userSerial"));
            List<Map<String, Object>> userList = userService.selectUserWithSerial(commandMap);
            user.setSerial((int)cList.get(i).get("userSerial"));
            user.setNickName(userList.get(0).get("nickName").toString());
            user.setProfileImg(userList.get(0).get("profileImg").toString());
            Comment comment = new Comment((int)cList.get(i).get("serial"),
                    cList.get(i).get("text").toString(),
                    cList.get(i).get("registerDate").toString(), user);
            commentList.add(comment);
        }
        mv.addObject("comments", commentList);
        return mv;
    }

    @RequestMapping(value = "/post/{type}", method = RequestMethod.GET)
    public ModelAndView Post(Model model, @PathVariable String type) throws Exception {
        ModelAndView mv = new ModelAndView("post/post");
        mv.addObject("type", type);
        return mv;
    }



    @RequestMapping(value = "/comment", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
    public void Comment(HttpServletRequest req, HttpServletResponse res,
                               Map<String,Object> commandMap, HttpSession session)  throws Exception {
        PrintWriter out = res.getWriter();
        req.setCharacterEncoding("utf-8");
        String userSerial = (req.getParameter("userSerial") == null) ? "" : String
                .valueOf(req.getParameter("userSerial"));
        String itemSerial = (req.getParameter("itemSerial") == null) ? "" : String
                .valueOf(req.getParameter("itemSerial"));
        String type = (req.getParameter("type") == null) ? "" : String
                .valueOf(req.getParameter("type"));
        String text = (req.getParameter("text") == null) ? "" : String
                .valueOf(req.getParameter("text"));

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        commandMap.put("userSerial", userSerial);
        commandMap.put("itemSerial", itemSerial);
        commandMap.put("type", type);
        commandMap.put("text", text);
        commandMap.put("registerDate", df.format(d));

        int t = (int)listService.insertComment(commandMap);
        int serial = (int)listService.selectComment(commandMap).get(0).get("serial");
        logger.info(t + "tttt");
        out.write(serial);out.flush();out.close();
    }

    @RequestMapping(value = "/deleteComment", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
    public void deleteComment(HttpServletRequest req, HttpServletResponse res,
                        Map<String,Object> commandMap, HttpSession session)  throws Exception {
        PrintWriter out = res.getWriter();
        req.setCharacterEncoding("utf-8");
        String userSerial = (req.getParameter("userSerial") == null) ? "" : String
                .valueOf(req.getParameter("userSerial"));
        String itemSerial = (req.getParameter("itemSerial") == null) ? "" : String
                .valueOf(req.getParameter("itemSerial"));
        String type = (req.getParameter("type") == null) ? "" : String
                .valueOf(req.getParameter("type"));
        String commentSerial = (req.getParameter("commentSerial") == null) ? "" : String
                .valueOf(req.getParameter("commentSerial"));

        Date d = new Date();
        commandMap.put("userSerial", userSerial);
        commandMap.put("itemSerial", itemSerial);
        commandMap.put("type", type);
        commandMap.put("serial", commentSerial);


        int t = (int)listService.deleteComment(commandMap);
        logger.info(t + "tttt");
        out.write(t);out.flush();out.close();
    }


    @RequestMapping(value = "/postSale", produces = "text/plain; charset=UTF-8",  method = RequestMethod.POST)
    public String postSale(@RequestParam("image-file1") MultipartFile uploadFile1,
                           @RequestParam("image-file2") MultipartFile uploadFile2,
                           @RequestParam("image-file3") MultipartFile uploadFile3
                         ,MultipartHttpServletRequest req, HttpServletResponse res,
                        Map<String,Object> commandMap, HttpSession session)  throws Exception {
        req.setCharacterEncoding("utf-8");
        UtilFile utilFile = new UtilFile();
        String uploadPath1, uploadPath2, uploadPath3;
        uploadPath1 = uploadPath2 = uploadPath3 = null;
        if (req.getParameter("image-flag1").equals("1"))uploadPath1 = utilFile.fileUpload(req, uploadFile1);
        if (req.getParameter("image-flag2").equals("1"))uploadPath2 = utilFile.fileUpload(req, uploadFile2);
        if (req.getParameter("image-flag3").equals("1"))uploadPath3 = utilFile.fileUpload(req, uploadFile3);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        commandMap.put("user", req.getParameter("userSerial"));
        commandMap.put("category", req.getParameter("selected-category"));
        commandMap.put("title", req.getParameter("title"));
        commandMap.put("detail", req.getParameter("sale-detail"));
        commandMap.put("location", req.getParameter("selected-location"));
        commandMap.put("registerDate", df.format(d).toString());
        commandMap.put("expiration", req.getParameter("selected-date"));
        commandMap.put("quantity", req.getParameter("quant[1]"));
        commandMap.put("remainQuantity", req.getParameter("quant[1]"));
        commandMap.put("maxPurchase", req.getParameter("quant[2]"));
        commandMap.put("price", req.getParameter("sale-price"));

        int t = (int)listService.insertSale(commandMap);

        commandMap.clear();
        commandMap.put("registerDate", df.format(d));
        commandMap.put("title", req.getParameter("title"));
        if (t == 1) {
            if (req.getParameter("image-flag1").equals("1")) {
                String path = uploadPath1.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file1 = (int)listService.insertSaleImage(commandMap);
            }
            if (req.getParameter("image-flag2").equals("1")) {
                String path = uploadPath2.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file2 = (int)listService.insertSaleImage(commandMap);
            }
            if (req.getParameter("image-flag3").equals("1")) {
                String path = uploadPath3.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file3 = (int)listService.insertSaleImage(commandMap);
            }
        }
        return "redirect:list/sale";
    }

    @RequestMapping(value = "/postRequest", produces = "text/plain; charset=UTF-8",  method = RequestMethod.POST)
    public String postRequest(@RequestParam("image-file1") MultipartFile uploadFile1,
                           @RequestParam("image-file2") MultipartFile uploadFile2,
                           @RequestParam("image-file3") MultipartFile uploadFile3
            ,MultipartHttpServletRequest req, HttpServletResponse res,
                           Map<String,Object> commandMap, HttpSession session)  throws Exception {
        req.setCharacterEncoding("utf-8");
        UtilFile utilFile = new UtilFile();
        String uploadPath1, uploadPath2, uploadPath3;
        uploadPath1 = uploadPath2 = uploadPath3 = null;
        if (req.getParameter("image-flag1").equals("1"))uploadPath1 = utilFile.fileUpload(req, uploadFile1);
        if (req.getParameter("image-flag2").equals("1"))uploadPath2 = utilFile.fileUpload(req, uploadFile2);
        if (req.getParameter("image-flag3").equals("1"))uploadPath3 = utilFile.fileUpload(req, uploadFile3);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        commandMap.put("user", req.getParameter("userSerial"));
        commandMap.put("category", req.getParameter("selected-category"));
        commandMap.put("title", req.getParameter("title"));
        commandMap.put("detail", req.getParameter("request-detail"));
        commandMap.put("location", req.getParameter("selected-location"));
        commandMap.put("registerDate", df.format(d).toString());
        commandMap.put("expiration", req.getParameter("selected-date"));
        commandMap.put("quantity", req.getParameter("quant[1]"));
        commandMap.put("serviceFee", req.getParameter("service-fee"));
        commandMap.put("price", req.getParameter("request-price"));

        int t = (int)listService.insertRequest(commandMap);

        commandMap.clear();
        commandMap.put("registerDate", df.format(d));
        commandMap.put("title", req.getParameter("title"));
        if (t == 1) {
            if (req.getParameter("image-flag1").equals("1")) {
                String path = uploadPath1.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file1 = (int)listService.insertRequestImage(commandMap);
            }
            if (req.getParameter("image-flag2").equals("1")) {
                String path = uploadPath2.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file2 = (int)listService.insertRequestImage(commandMap);
            }
            if (req.getParameter("image-flag3").equals("1")) {
                String path = uploadPath3.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file3 = (int)listService.insertRequestImage(commandMap);
            }
        }
        return "redirect:list/request";
    }

    @RequestMapping(value = "/postTrip", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
    public String PostTrip(HttpServletRequest req, HttpServletResponse res,
                        Map<String,Object> commandMap, HttpSession session)  throws Exception {
        req.setCharacterEncoding("utf-8");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d = new Date();
        commandMap.put("user", req.getParameter("userSerial"));
        commandMap.put("source", req.getParameter("selected-location"));
        commandMap.put("destination", req.getParameter("selected-location2"));
        commandMap.put("isRound", req.getParameter("round"));
        commandMap.put("purpose", req.getParameter("purpose"));
        commandMap.put("departureDate", req.getParameter("departureDate"));
        commandMap.put("arrivalDate", req.getParameter("arrivalDate"));
        commandMap.put("registerDate", df.format(d));
        String pur = "";
        if (req.getParameter("round2").toString().equals("0")) pur = "여행";
        else if (req.getParameter("round2").toString().equals("1")) pur = "출장";
        else pur = "기타";
        commandMap.put("purpose", pur);
        commandMap.put("schedule", req.getParameter("trip-detail"));
        commandMap.put("location", req.getParameter("arrivalImage"));
        int t = (int)listService.insertTrip(commandMap);
        return "redirect:list/trip";
    }

}

