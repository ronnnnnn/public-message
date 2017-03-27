package com.zyfz.web.controller;

import com.zyfz.domain.Resources;
import com.zyfz.domain.Role;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResourceModel;
import com.zyfz.service.IResourceService;
import com.zyfz.service.IRoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ron on 16-10-18.
 */
@RequestMapping("/role")
@Controller
public class RoleController extends BaseController {
    @Resource
    IRoleService roleService;

    @Resource
    IResourceService resourceService;

    /**
     * 页面跳转
     * @return 页面
     */
    @RequiresPermissions("role:view")
    @RequestMapping(method = RequestMethod.GET)
    public String getRolePanel(){
        return "admin/role/list";
    }

    @RequiresPermissions("role:update")
    @RequestMapping(value = "/baseedit",method = RequestMethod.GET)
    public String getBaseeditPanel(){
        return "admin/role/baseedit";
    }

    /**
     * 资源管理跳转
     * @return
     */
    @RequiresPermissions("role:update")
    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public String getRoleEditPanel(@PathVariable Integer id, Model model){
        List<ResourceModel> resourceList = new ArrayList<ResourceModel>();
        List<Resources> resources = resourceService.findAll();
        Role role = new Role();
        role.setId(id);
        String checkResourceIds[] = new String[]{};
        if(roleService.getOneById(role).getResourceIds() != null){
             checkResourceIds = roleService.getOneById(role).getResourceIds().split(",");
        }else {
            String temp = "99999999,11111111";
            checkResourceIds = temp.split(",");
        }

        for (Resources myresource : resources){
            ResourceModel resourceModel = new ResourceModel();
            resourceModel.setId(myresource.getId());
            resourceModel.setName(myresource.getMname());
            resourceModel.setParentId(myresource.getParentId());
            resourceModel.setCheck(false);
            for (String cid : checkResourceIds){
               if (cid.intern() == String.valueOf(myresource.getId()).intern()){
                   resourceModel.setCheck(true);
               }

//               if(Integer.valueOf(cid) == myresource.getId()){
//                   resourceModel.setCheck(true);
//               }

            }
            resourceList.add(resourceModel);
        }
        model.addAttribute("resourceList",resourceList);
        return "admin/role/edit";
    }
    /**
     * 添加角色
     * @param role
     * @return true 或 错误信息
     */
    @RequiresPermissions("role:create")
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addRole(@RequestBody Role role){
        try{
            roleService.save(role);
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }
        return true;
    }

    /**
     * 用于将角色的资源id集合转化为资源名字集合，显示超级管理员角色时调用
     * @param value 角色对应下的资源id
     * @param response  资源集合
     */
    @RequestMapping(value = "/{value}",method = RequestMethod.GET)
    public void getRoleByIds(@PathVariable String value, HttpServletResponse response){
        String[] ids = value.split(",");
        List<Role> roles = new ArrayList<Role>();
        for(String id : ids){
            int mid = Integer.valueOf(id);
            Role mRole = new Role();
            mRole.setId(mid);
            Role sysRole = roleService.getOneById(mRole);
            if(sysRole != null){
               roles.add(sysRole);
            }
        }
        super.writeJson(roles,response);
    }

    /**
     * 批量删除角色
     * @param ids id集合
     */
    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIds(@PathVariable String ids){
        String mids[] = ids.split(",");
        for (String id : mids){
            Role role = new Role();
            role.setId(Integer.valueOf(id));
            roleService.deleteOneById(role);
        }
        return mids.length;
    }

    /**
     * 获得所有角色不分页,为超级管理员添加角色权限时调用
     * @param response
     */

    @RequestMapping(value = "/all/list",method = RequestMethod.GET)
    public void getAllRoles(HttpServletResponse response){
       super.writeJson(roleService.getAllRoles(),response);
    }

    /**
     * 获得所有角色分页
     * @param pageModel
     * @param response
     */
    @RequiresPermissions("role:view")
    @RequestMapping(value = "/list")
    public void getRoleList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(roleService.getAll(pageModel),response);
    }

    /**
     * 修改角色
     * @param role
     * @return
     */
    @RequiresPermissions("role:update")
    @RequestMapping(method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateRoleResource(@RequestBody Role role){
        try {
            roleService.update(role);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
