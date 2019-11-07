package com.app.mvc.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

    @RequestMapping(value = "/serviceDegarding.do", method = RequestMethod.GET)
    public ModelAndView serviceDagardingPage() {
        return new ModelAndView("serviceDegarding");
    }
}