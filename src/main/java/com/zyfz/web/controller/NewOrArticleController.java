package com.zyfz.web.controller;

import com.zyfz.domain.NewArticle;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.INewArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 17-1-8.
 */
@RequestMapping("newArticle")
@Controller
public class NewOrArticleController extends BaseController {
    @Resource
    INewArticleService newArticleService;

    @Resource
    ICategoryService categoryService;

    @RequestMapping(value = "/content-panel")
    public String toList(Model model){
        model.addAttribute("vcategoryList",categoryService.getAllWithList());
        return "admin/article/list";
    }

    @RequestMapping(value = "/edit-panel")
    public String toEditPanel(Model model){
        model.addAttribute("vcategoryList",categoryService.getAllWithList());
        return "admin/article/edit";
    }

    @RequestMapping(value = "/list/{catId}",method = RequestMethod.POST)
    public void getDate(PageModel pageModel, @PathVariable Integer catId, HttpServletResponse response){
         super.writeJson(newArticleService.getByCatId(catId,pageModel),response);
    }

    @RequestMapping(value = "/{catId}",method = RequestMethod.POST)
    @ResponseBody
    public Object addArticle(NewArticle newArticle,@PathVariable Integer catId){
        newArticle.setHhCategoryId(catId);
        return newArticleService.save(newArticle);
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE )
    @ResponseBody
    public Object deleteArticle(@PathVariable String ids){
        Integer count = 0;
        String[] mIds = ids.split(",");
        for (String mid  : mIds){
            newArticleService.deleteOneById(new NewArticle(Integer.valueOf(mid)));
            count++;
        }
        return count;
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateArticle(NewArticle article){
        return newArticleService.update(article);
    }
}
