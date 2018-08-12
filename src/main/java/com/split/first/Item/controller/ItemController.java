package com.split.first.Item.controller;


import com.split.first.Item.dto.Request;
import com.split.first.Item.dto.Sale;
import com.split.first.Item.dto.Trip;
import com.split.first.Item.service.ItemService;
import com.split.first.session.service.UserService;
import com.sun.jdi.InvalidTypeException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


@RestController("item")
public class ItemController {

    protected Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    private ItemService itemService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/item/{type}", method = RequestMethod.GET)
    public Object getListByType(@PathVariable String type) {
        switch (type) {
            case "sale" : return itemService.selectSale();
            case "trip" : return itemService.selectSale();
            case "request" : return itemService.selectSale();
            default: throw new RuntimeException();
        }
    }

    @RequestMapping(value = "/item/{type}/{serial}", method = RequestMethod.GET)
    public Object ItemSale(@PathVariable String type,
                           @PathVariable Integer serial) {
        switch (type) {
            case "sale" : return itemService.selectOneSale(serial);
            case "trip" : return itemService.selectOneTrip(serial);
            case "request" : return itemService.selectOneRequest(serial);
            default: throw new RuntimeException();
        }
    }
    /* ui
    @RequestMapping(value = "/post/{type}", method = RequestMethod.GET)
    public ModelAndView Post(Model model, @PathVariable String type) {
        ModelAndView mv = new ModelAndView("post/post");
        mv.addObject("type", type);
        return mv;
    }
    */
    @RequestMapping(value = "/comment", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
    public void comment(HttpServletRequest req, HttpServletResponse res,
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

        int t = (int)itemService.insertComment(commandMap);
        int serial = (int)itemService.selectComment(commandMap).get(0).get("serial");
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


        int t = (int)itemService.deleteComment(commandMap);
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

        int t = (int)itemService.insertSale(commandMap);

        commandMap.clear();
        commandMap.put("registerDate", df.format(d));
        commandMap.put("title", req.getParameter("title"));
        if (t == 1) {
            if (req.getParameter("image-flag1").equals("1")) {
                String path = uploadPath1.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file1 = (int)itemService.insertSaleImage(commandMap);
            }
            if (req.getParameter("image-flag2").equals("1")) {
                String path = uploadPath2.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file2 = (int)itemService.insertSaleImage(commandMap);
            }
            if (req.getParameter("image-flag3").equals("1")) {
                String path = uploadPath3.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file3 = (int)itemService.insertSaleImage(commandMap);
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

        int t = (int)itemService.insertRequest(commandMap);

        commandMap.clear();
        commandMap.put("registerDate", df.format(d));
        commandMap.put("title", req.getParameter("title"));
        if (t == 1) {
            if (req.getParameter("image-flag1").equals("1")) {
                String path = uploadPath1.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file1 = (int)itemService.insertRequestImage(commandMap);
            }
            if (req.getParameter("image-flag2").equals("1")) {
                String path = uploadPath2.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file2 = (int)itemService.insertRequestImage(commandMap);
            }
            if (req.getParameter("image-flag3").equals("1")) {
                String path = uploadPath3.split("/resources/images/")[1];
                commandMap.put("imagePath", path);
                int file3 = (int)itemService.insertRequestImage(commandMap);
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
        int t = (int)itemService.insertTrip(commandMap);
        return "redirect:list/trip";
    }

}

