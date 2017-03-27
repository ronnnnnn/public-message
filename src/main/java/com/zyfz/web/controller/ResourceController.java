package com.zyfz.web.controller;

import com.zyfz.domain.Resources;
import com.zyfz.model.PageModel;
import com.zyfz.service.IResourceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ron on 16-10-20.
 */
@RequestMapping("/resources")
@Controller
public class ResourceController extends BaseController{
    @Resource
    IResourceService resourceService;


    @ModelAttribute("types")
    public Resources.ResourceType[] resourceTypes(){
        return Resources.ResourceType.values();
    }

    /**
     * 页面跳转
     * @param model
     * @return  资源列表
     */
    @RequiresPermissions("resource:view")
    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model){
        model.addAttribute("resourceList",resourceService.findAll());
        return  "admin/resources/list";
    }

    /**
     * 获取资源数据
     * @param pageModel
     * @param response
     */
    @RequiresPermissions("resource:view")
    @RequestMapping(value = "/datagrid",method = RequestMethod.GET)
    public void getResourcesDatagrid(PageModel pageModel, HttpServletResponse response){
        super.writeJson(resourceService.getAll(pageModel),response);
    }

    /**
     * 子节点添加页面
     * @param parentId
     * @param model
     * @return
     */
    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.GET)
    public String showAppendChildForm(@PathVariable("parentId") Integer parentId, Model model) {
        Resources mr = new Resources();
        mr.setId(parentId);
        Resources parent = resourceService.getOneById(mr);
        model.addAttribute("parent", parent);
        Resources child = new Resources();
        child.setParentId(parentId.longValue());
        child.setParentIds(parent.makeSelfAsParentIds());
        model.addAttribute("resource", child);
        model.addAttribute("op", "新增子节点");
        return "admin/resources/add";
    }

    /**
     * 保存子节点
     * @param resources
     * @return
     */
    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.POST)
    @ResponseBody
    public Object create(@RequestBody Resources resources) {
        resourceService.save(resources);
        return true;
    }

    /**
     * 更新子节点页面
     * @param id
     * @param model
     * @return
     */
    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        Resources resources = new Resources();
        resources.setId(id);
        Resources child =  resourceService.getOneById(resources);
        model.addAttribute("resource",child);
        Resources resources1 = new Resources();
        resources1.setId(child.getParentId().intValue());
        model.addAttribute("parent",resourceService.getOneById(resources1));
        return "admin/resources/edit";
    }

    /**
     * 更新子节点
     * @param resource
     * @return
     */
    @RequiresPermissions("resource:update")
    @ResponseBody
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public Object update(@RequestBody Resources resource) {
        resourceService.update(resource);
        return true;
    }

    /**
     * 删除资源
     * @param id
     * @return
     */
    @RequiresPermissions("resource:delete")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object delete(@PathVariable("id") Integer id) {
        Resources resources = new Resources();
        resources.setId(id);
        if (resourceService.findByParentId(id).size() == 0){
            resourceService.deleteOneById(resources);
            return true;
        }else {
            return false;
        }
    }

    /**
     * 根据id字符串集合获得资源,显示角色拥有的资源调用
     * @param value
     * @param response
     */
    @RequestMapping(value = "/{value}", method = RequestMethod.GET)
    public void getResoucesNameByValue(@PathVariable String value, HttpServletResponse response){
        String ids[] = value.split(",");
        List<Resources> resourcesList = new ArrayList<Resources>();
        for (String id : ids){
            Resources resources = new Resources();
            resources.setId(Integer.valueOf(id));
            Resources myresources = resourceService.getOneById(resources);
            if(myresources != null){
                resourcesList.add(myresources);
            }
        }
        super.writeJson(resourcesList,response);
    }

    /**
     * 获取所有资源，组织资源树
     * @param response
     */
    @RequiresPermissions("resource:view")
    @RequestMapping(value = "/all/list",method = RequestMethod.GET)
    public void getAllResources(HttpServletResponse response){
        super.writeJson(resourceService.findAll(),response);
    }


    @RequestMapping(value = "/isRoot/{parentId}",method = RequestMethod.GET)
    @ResponseBody
    public Object getResourceByParentId(@PathVariable Integer parentId){
        if(resourceService.findByParentId(parentId).size() != 0){
            return true;
        }else {
            return false;
        }
    }
}
