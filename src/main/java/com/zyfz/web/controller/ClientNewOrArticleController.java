package com.zyfz.web.controller;

import com.zyfz.domain.Category;
import com.zyfz.domain.NewArticle;
import com.zyfz.domain.Show;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.INewArticleService;
import com.zyfz.service.IShowService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by ron on 17-1-10.
 */
@RequestMapping("client")
@Controller
public class ClientNewOrArticleController extends BaseController{

    @Resource
    INewArticleService newArticleService;

    @Resource
    ICategoryService categoryService;

    @Resource
    IShowService showService;

    @RequestMapping(value = "/index")
    public String toClientIndex(Model model){
        List<Show> shows = showService.getPicByType("轮播图");
        model.addAttribute("picList",shows);
        return "client/index";
    }

    @RequestMapping(value = "/api/v1/anon/article/{catId}",method = RequestMethod.GET)
    public String getByCatId(Model model, HttpServletResponse response, @PathVariable Integer catId, @RequestParam(value = "pn",required = false)Integer pn, @RequestParam(value = "size",required = false)Integer size){
        Category seCategory = new Category();
        seCategory.setId(catId);
        Category category = categoryService.getOneById(seCategory);
        if (pn == null || pn == 0){
            pn = 1;
        }
        if (size == null || size == 0){
            size = 10;
        }
        Datagrid datagrid = newArticleService.getByCatId(catId,new PageModel(pn,size));
        NewArticle simNewArticle = null;
        List<NewArticle> newArticles = datagrid.getRows();
        if (category.getTopic().intern() == "1".intern()){
            //构建左侧菜单,导航
            lefeMenuBuild(model,category);
            if (newArticles.size() == 0){
                //super.writeJson(null,response);
                model.addAttribute("article",null);
                return "/client/listcontent";
            }
            simNewArticle = newArticles.get(0);
            model.addAttribute("article",simNewArticle);
           // super.writeJson(simNewArticle,response);
            return "/client/listcontent";
        } else if (category.getTopic().intern() == "2".intern()){
           // super.writeJson(newArticles,response);
            lefeMenuBuild(model,category);
            //处理列表数据
            model.addAttribute("artList",newArticles);
            return "/client/list";
        } else {
            return "/client/content";
        }
    }

    @RequestMapping(value = "/api/v1/anon/art/detail/{id}",method = RequestMethod.GET)
    public String getArtDetail(@PathVariable Integer id,Model model){
        NewArticle newArticle = newArticleService.getOneById(new NewArticle(id));
        Category curCat = categoryService.getOneById(new Category(newArticle.getHhCategoryId()));
        Category parCat = categoryService.getOneById(new Category(curCat.getParentId()));
        model.addAttribute("currentCat",curCat);
        model.addAttribute("parentCat",parCat);
        model.addAttribute("article",newArticle);
        return "/client/content";
    }

    public void lefeMenuBuild(Model model,Category category){
        //解析所属层级内容
        Integer parentCatId = category.getParentId();
        List<Category> broCats = categoryService.selectByParentId(parentCatId);
        Category parentCat = categoryService.getOneById(new Category(parentCatId));

        List<Map<String,String>> childCats = new ArrayList<>();
        for (Category broCat : broCats){
            Map<String,String> childCat = new HashMap<String,String>();
            childCat.put("name",broCat.getCategoryName());
            childCat.put("url",broCat.getUrl());
            if (broCat.getId() == category.getId()){
                childCat.put("on","true");
            }
            childCats.add(childCat);
        }

        model.addAttribute("parentName",parentCat.getCategoryName());
        model.addAttribute("list",childCats);
        model.addAttribute("currentPosition",category.getCategoryName());
    }
}
