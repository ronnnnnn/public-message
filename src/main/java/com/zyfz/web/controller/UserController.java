package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.model.Datagrid;
import com.zyfz.model.Json;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserservice;
import com.zyfz.service.impl.PasswordHelper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ron on 16-10-18.
 */
@RequestMapping("/user")
@Controller
public class UserController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    IUserservice userservice;

    @Resource
    PasswordHelper passwordHelper;

    /**super前缀的为管理员
     * 相关页面的跳转
     * @return
     */
    @RequiresPermissions("superuser:view")
    @RequestMapping(value = "/superuser/list")
    public String toSuperUserList(){
        return "admin/user/superUserList";
    }

    @RequiresPermissions("user:view")
    @RequestMapping(value = "/normaluser/list")
    public String toNormalUserList(){
        return "admin/user/normalUserList";
    }

    @RequiresPermissions("superuser:update")
    @RequestMapping(value = "/password/panel")
    public String toPasswordEditPanel(){
        return "admin/user/superUserPasswordEdit";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/normal/password/panel")
    public String toNormalPasswordEditPanel(){
        return "admin/user/normalUserPasswordEdit";
    }

    @RequiresPermissions("superuser:update")
    @RequestMapping(value = "/superuser/editpanel")
    public String toSuperUserEditPanel(){
        return "admin/user/superUserEditPanel";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/normaluser/editpanel")
    public String toNormalUserEditPanel(){
        return "admin/user/normalUserEditPanel";
    }

    @RequiresPermissions("honer:view")
    @RequestMapping(value = "/rank/honer")
    public String toHonerRank(){
        return "admin/user/rank/honerUserList";
    }

    @RequiresPermissions("honer:update")
    @RequestMapping(value = "/honer/panel")
    public String toHonerEditPanel(){
        return "admin/user/rank/superUserHonerEdit";
    }

    @RequiresPermissions("contribute:update")
    @RequestMapping(value = "/contribute/panel")
    public String toContributeEditPanel(){
        return "admin/user/rank/UserContributeEdit";
    }

    @RequiresPermissions("contribute:view")
    @RequestMapping(value = "/rank/contribute")
    public String toHonerContribute(){
        return "admin/user/rank/contributeUserList";
    }

    @RequiresPermissions("superuser:view")
    @RequestMapping(value = "/superuser/all")
    public void getAllSuperUser(PageModel pageModel, HttpServletResponse response){
        super.writeJson(userservice.getAllSuperUser(pageModel),response);
    }

    @RequiresPermissions("user:view")
    @RequestMapping(value = "/normaluser/all")
    public void getAllNormalUser(PageModel pageModel, HttpServletResponse response){
        super.writeJson(userservice.getAllNormalUser(pageModel),response);
    }

    /**
     * 更新用户信息
     * @param user
     * @return
     */

    @RequiresPermissions("user:update")
    @RequestMapping(method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUser(@RequestBody User user){
       return userservice.update(user);
    }

    /**
     * 新增用户，user里面的isAdmin标识是否管理员，默认否
     * @param user
     * @return
     */

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addUser(@RequestBody User user){
        User safeUsername = userservice.findByUsername(user.getUsername());
        User safePhone = userservice.findByPhone(user.getPhone());
        if(safePhone != null && safeUsername != null){
            return false;
        }else {
            passwordHelper.encryptPassword(user);
            Integer sava = userservice.save(user);
            return sava;
        }
    }

    /**
     * 改密码
     * @param user
     * @return
     */
    @RequestMapping(value = "/password",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUserPassword(@RequestBody User user){
        try{
            userservice.changePassword(user.getId(),user.getPassword());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 批量删除用户
     * @param ids
     * @return
     */
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object removeByUserIds(@PathVariable("ids") String ids){
        return userservice.deleteByIds(ids);
    }

    /**
     * key可以是用户名或是手机号，支持模糊查找
     * @param key
     * @param pageModel
     * @param response
     */
    @RequestMapping(value = "/key/{utype}")
    public void getUserByKey(@PathVariable Boolean utype, String key, PageModel pageModel, HttpServletResponse response){
        super.writeJson(userservice.getUserLike(pageModel,key,utype),response);
    }
    //修改荣誉值

    @RequestMapping(value="/honer",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUserHoner(@RequestBody User user){
        try{
            userservice.changeHoner(user.getId(),user.getHonerScore());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    //修改贡献值

    @RequestMapping(value="/contribute",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateUserContribute(@RequestBody User user){
        try{
            userservice.changeContribute(user.getId(),user.getContributeScore());
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }



    @RequestMapping(value = "/{phones}",method = RequestMethod.POST)
    public void getUsersByPhones(@PathVariable String phones,HttpServletResponse response){
        String mphones[] = phones.split(",");
        List<User> users = new ArrayList<User>();
        for(String mphone : mphones){
            User user = userservice.findByPhone(mphone);
            users.add(user);
        }
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(users);
        int sizes = users.size();
        datagrid.setTotal(new Long(sizes));
        super.writeJson(datagrid,response);
    }

    /**
     * 上传图片到服务器
     * @param file
     * @param response
     * @param request
     */
    @RequestMapping(value = "/image",method = RequestMethod.POST)
    public void importImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request){
        Json json = new Json();
        try {
            String imageName = super.saveUploadFile(request,file, "head", "jpg");
            logger.info(imageName);
            json.setObj(imageName);
            json.setSuccess(true);
            json.setMsg("导入成功！");
        } catch (Exception e) {
            json.setMsg(e.toString());
        }

        super.writeJson(json,response);
    }


}
