package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by ron on 16-10-16.
 */
@Controller
public class TestCOontroller {
    @Resource
    IUserservice userservice;

    @RequestMapping("/test")
    public String test(Model model){
        User user = new User();
        user.setId(1);
        model.addAttribute("user",userservice.getOneById(user));
        return "test";
    }
}
