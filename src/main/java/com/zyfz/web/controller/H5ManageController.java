package com.zyfz.web.controller;

import com.zyfz.domain.H5Manage;
import com.zyfz.model.PageModel;
import com.zyfz.service.H5Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Created by ron on 17-3-25.
 */
@RequestMapping("/h5")
@Controller
public class H5ManageController extends BaseController {

    @Resource
    H5Service h5Service;

    @RequestMapping("/list-panel")
    public String getViewPage(){
        return "/admin/h5/list";
    }

    @RequestMapping("/add-panel")
    public String getAddPanel(){
        return "/admin/h5/add";
    }

    @RequestMapping("/edit-panel")
    public String getEditPanel(){
        return "/admin/h5/edit";
    }


    @RequestMapping("/date")
    public void getList(PageModel pageModel , HttpServletResponse response){
        super.writeJson(h5Service.getAll(pageModel),response);
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    @ResponseBody
    public Object addH5(H5Manage h5Manage){
        h5Manage.setCreateTime(new Date());
        return h5Service.save(h5Manage);
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE )
    @ResponseBody
    public Object deleteH5(@PathVariable String ids){
        Integer count = 0;
        String[] mIds = ids.split(",");
        for (String mid  : mIds){
            h5Service.deleteOneById(new H5Manage(Integer.valueOf(mid)));
            count++;
        }
        return count;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateH5(H5Manage h5Manage){
        return h5Service.update(h5Manage);
    }

}
