package com.zyfz.web.controller;

import com.zyfz.service.IShowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 17-1-11.
 */
@Controller
public class ClientShowController extends BaseController{

    @Resource
    IShowService showService;

    @RequestMapping(value = "/api/v1/anon/show",method = RequestMethod.GET)
    public void getPic(HttpServletResponse response){
        super.writeJson(showService.getPicByType("轮播图"),response);
    }
}
