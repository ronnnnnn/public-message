package com.zyfz.web.controller;

import com.zyfz.domain.Category;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.INewArticleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ron on 16-10-25.
 */
@Controller
public class CategoryController extends BaseController{
    @Resource
    ICategoryService categoryService;

    @Resource
    INewArticleService newArticleService;


    @RequiresPermissions("category:view")
    @RequestMapping(value = "/category/list-panel",method = RequestMethod.GET)
    public String list(Model model){
        model.addAttribute("categoryList",categoryService.getAllWithList());
        return "admin/category/list";
    }

    @RequiresPermissions("category:create")
    @RequestMapping(value = "/category/{parentId}/appendChild", method = RequestMethod.GET)
    public String showAppendChildForm(@PathVariable("parentId") Integer parentId, Model model) {
        Category mcategory = new Category();
        mcategory.setId(parentId);
        Category parent = categoryService.getOneById(mcategory);
        model.addAttribute("parent", parent);
        Category child = new Category();
        child.setParentId(parentId);
        child.setParentIds(parent.makeSelfAsParentIds());
        model.addAttribute("category", child);
        model.addAttribute("op", "新增子节点");
        return "admin/category/edit";
    }


    @RequiresPermissions("category:create")
    @RequestMapping(value = "/category/{parentId}/appendChild", method = RequestMethod.POST)
    @ResponseBody
    public Object create(@RequestBody Category category) {
        categoryService.save(category);
        return true;
    }


    @RequiresPermissions("category:update")
    @RequestMapping(value = "/category/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        Category category = new Category();
        category.setId(id);
        Category child = categoryService.getOneById(category);
        model.addAttribute("category",child );
        model.addAttribute("op", "修改");
        Category category1 = new Category();
        category1.setId(child.getParentId());
        Category parent = categoryService.getOneById(category1);
        model.addAttribute("parent",parent);
        return "admin/category/edit";
    }


    @RequiresPermissions("category:update")
    @RequestMapping(value = "/category/{id}/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestBody Category category) {
        categoryService.update(category);
        return true;
    }


    @RequiresPermissions("category:delete")
    @RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object delete(@PathVariable("id") Integer id) {
        Category category = new Category();
        category.setId(id);
        Datagrid articles = newArticleService.getByCatId(id,new PageModel(1,5));
        if ( articles.getTotal() == 0){
            categoryService.deleteOneById(category);
        }

        return true;
    }

    //获取目录key 根目录,value 子目录集合
    @RequestMapping(value = "/api/v1/anon/category",method = RequestMethod.GET)
    public void getCategory(HttpServletResponse response){

        List<Map<String,Object>> categoryList = new ArrayList<>();
        List<Category> rootCategories = categoryService.selectByParentId(1);
        List<Category> childMenu = null;
        int i = 0;
        for (Category  category : rootCategories ){
            Map<String,Object>  menuMap = new LinkedHashMap<String,Object>();
            menuMap.put("name",category.getCategoryName());
            menuMap.put("id",++i);
            childMenu = categoryService.selectByParentId(category.getId());
            List<Map<String,Object>> childCategoryList = new ArrayList<>();
            for(Category child : childMenu){
                Map<String,Object>  childMenuMap = new LinkedHashMap<String,Object>();
                childMenuMap.put("name",child.getCategoryName());
                childMenuMap.put("url",child.getUrl());
                childCategoryList.add(childMenuMap);
            }
            menuMap.put("nextlist",childCategoryList);
            categoryList.add(menuMap);
            //menuMap.put(category.getCategoryName(),categoryService.selectByParentId(category.getId()));
        }
        super.writeJson(categoryList,response);
    }

}
