package com.split.first.main.controller;

import com.split.first.Item.service.ItemService;
import com.split.first.main.dto.Main;
import com.split.first.session.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Main getMainData() {
        return new Main(itemService.selectSale(),
                        itemService.selectTrip(),
                        itemService.selectRequest());
    }

//    @RequestMapping(value = "/setting", method = RequestMethod.GET)
//    public String Setting(Model model) throws Exception {
//        return "setting/setting";
//    }
//
//    @RequestMapping(value = "/googleMap", method = RequestMethod.GET)
//    public String googleMap(Model model) throws Exception {
//        return "googleMap";
//    }
//
//    @RequestMapping(value = "/googleMap2", method = RequestMethod.GET)
//    public String googleMap2(Model model) throws Exception {
//        return "googleMap2";
//    }
}