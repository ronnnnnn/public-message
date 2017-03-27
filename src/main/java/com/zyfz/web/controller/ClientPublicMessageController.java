package com.zyfz.web.controller;

import com.zyfz.domain.PublicMessage;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IPublishMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by ron on 17-3-19.
 */
@RequestMapping("/api/v1/anon")
@Controller
public class ClientPublicMessageController extends BaseController {

    @Resource
    IPublishMessageService publishMessageService;

    @RequestMapping(value = "/message/{size}",method = RequestMethod.GET)
    public void getMessage(@PathVariable Integer size, HttpServletResponse response){
        try {
            super.writeJson(new ResponseMessage<List<PublicMessage>>(200,"success",publishMessageService.selectByLimit(size)),response);
        }catch (Exception e){
            if (size <= 0){
                super.writeJson(new ResponseMessage<String>(400,"fail","请求参数错误，参数不能小于等于0"),response);
            }else {
                super.writeJson(new ResponseMessage<String>(500,"fail","服务器内部错误"),response);
            }
        }

    }

}
