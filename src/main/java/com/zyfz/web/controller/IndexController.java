package com.zyfz.web.controller;

import com.zyfz.domain.Resources;
import com.zyfz.domain.User;
import com.zyfz.service.IResourceService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.*;

/**
 * Created by ron on 16-9-20.
 */
@Controller
public class IndexController {

    private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(IndexController.class);

    @Resource
    IUserservice userservice;
    @Resource
    IResourceService resourceService;

//    @RequestMapping("/")
//    public String index(HttpServletRequest request, Model model){
//        Set<String> perssions = userservice.findPermissions(((User)request.getAttribute("user")).getUsername());
//        List<Resources> menus = resourceService.findMenus(perssions);
//
//        model.addAttribute("menus",menus);
//        return "test";
//    }


    @RequestMapping("/")
    public String index(HttpServletRequest request, Model model){
        Serializable cookie = request.getSession().getId();
        User user = (User)request.getAttribute("user");
        user.setCookie(cookie + "");
        userservice.update(user); //登录成功后保存用户的sessionId

        Set<String> perssions = userservice.findPermissions(((User)request.getAttribute("user")).getUsername());
        List<Resources> menus = resourceService.findMenus(perssions);
        List<Resources> rootMenus = resourceService.finaRootMenu();
        Map<String,List<Resources>> menuMap = new LinkedHashMap<String,List<Resources>>();
        for (int i = 0; i < rootMenus.size(); i++) {
            Resources rootResource = rootMenus.get(i);
            List<Resources> childMenus = new ArrayList<Resources>();
            for (Resources childResource : menus){
                if(childResource.getParentId() == rootResource.getId().longValue()){
                    childMenus.add(childResource);
                }
            }
            if (childMenus.size() != 0){
                menuMap.put(rootResource.getMname(),childMenus);
            }
        }
        model.addAttribute("menus",menuMap);
        return "admin/index";
    }
}
