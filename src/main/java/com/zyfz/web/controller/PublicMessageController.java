package com.zyfz.web.controller;

import com.zyfz.domain.PublicMessage;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPublishMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Created by ron on 17-3-19.
 */
@RequestMapping("/public-message")
@Controller
public class PublicMessageController  extends BaseController{

    @Resource
    IPublishMessageService publishMessageService;

    @RequestMapping("/list-panel")
    public String getViewPage(){
        return "/admin/public-content/list";
    }

    @RequestMapping("/add-panel")
    public String getAddPanel(){
        return "/admin/public-content/add";
    }

    @RequestMapping("/edit-panel")
    public String getEditPanel(){
        return "/admin/public-content/edit";
    }


    @RequestMapping("/date")
    public void getList(PageModel pageModel , HttpServletResponse response){
        super.writeJson(publishMessageService.getAll(pageModel),response);
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    @ResponseBody
    public Object addPublicMessage(PublicMessage publicMessage){
        publicMessage.setPmCreateTime(new Date());
        return publishMessageService.save(publicMessage);
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE )
    @ResponseBody
    public Object deletePublicMessage(@PathVariable String ids){
        Integer count = 0;
        String[] mIds = ids.split(",");
        for (String mid  : mIds){
            publishMessageService.deleteOneById(new PublicMessage(Integer.valueOf(mid)));
            count++;
        }
        return count;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updatePublicMessage(PublicMessage publicMessage){
        return publishMessageService.update(publicMessage);
    }

}
