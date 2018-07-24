package com.split.first.controller;

import com.split.first.service.ListService;
import com.split.first.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private ListService listService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView Main() throws Exception {
        ModelAndView mv = new ModelAndView("main");
        mv.addObject("sales", listService.selectSale());
        //mv.addObject("trips", listService.selectTrip());
        mv.addObject("requests", listService.selectRequest());
        return mv;
    }

    @RequestMapping(value = "/setting", method = RequestMethod.GET)
    public String Setting(Model model) throws Exception {
        return "setting/setting";
    }

    @RequestMapping(value = "/googleMap", method = RequestMethod.GET)
    public String googleMap(Model model) throws Exception {
        return "googleMap";
    }

    @RequestMapping(value = "/googleMap2", method = RequestMethod.GET)
    public String googleMap2(Model model) throws Exception {
        return "googleMap2";
    }
}