package com.zyfz.web.controller;

import com.zyfz.domain.H5ManageExample;
import com.zyfz.service.H5Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 17-3-25.
 */
@RequestMapping("/api/v1/anon/h5")
@Controller
public class ClientH5Controller extends BaseController{

    @Resource
    H5Service h5Service;

    @RequestMapping("/{name}")
    public void getH5ByName(@PathVariable String name, HttpServletResponse response){
        H5ManageExample h5ManageExample = new H5ManageExample();
        h5ManageExample.or().andH5NameEqualTo(name);
        super.writeJson(h5Service.selectByExample(h5ManageExample),response);
    }
}
