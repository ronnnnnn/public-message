package com.zyfz.web.controller;

import com.zyfz.domain.Show;
import com.zyfz.model.Json;
import com.zyfz.model.PageModel;
import com.zyfz.service.IShowService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * Created by ron on 16-10-22.
 */
@RequestMapping("/show")
@Controller
public class ShowController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ShowController.class);

    @Resource
    IShowService showService;

    /**
     * 跳转到视图
     * @return
     */
    @RequiresPermissions("show:view")
    @RequestMapping(value = "/list/panel",method = RequestMethod.GET)
    public String toShowListPanel(){
        return "/admin/show/list";
    }

    @RequiresPermissions("show:create")
    @RequestMapping(value = "/add-panel",method = RequestMethod.GET)
    public String toAddPanel(){
        return "/admin/show/add";
    }

    @RequiresPermissions("show:update")
    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(){
        return "/admin/show/edit";
    }

    /**
     * 查
     * @param pageModel
     * @param response
     */
    @RequiresPermissions("show:view")
    @RequestMapping(value = "/list")
    public void getShowDateList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(showService.getAll(pageModel),response);
    }

    /**
     * 增
     * @param show
     * @return
     */
    @RequiresPermissions("show:create")
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object savaShow(Show show){
        try {

            show.setCreateTime(new Date());
            showService.save(show);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 改
     * @param show
     * @return
     */
    @RequiresPermissions("show:update")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateShow(Show show){
        try {
            showService.update(show);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 删
     * @param ids
     * @return
     */
    @RequiresPermissions("show:delete")
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object updateShow(@PathVariable String ids){
        try {
            String mids[] = ids.split(",");
            for (String mid : mids){
                Show show = new Show();
                show.setId(Integer.valueOf(mid));
                showService.deleteOneById(show);
            }
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 上传图片到服务器
     * @param file
     * @param response
     * @param request
     */
    @RequestMapping(value = "/image",method = RequestMethod.POST)
    @ResponseBody
    public Object importImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request){
        Json json = new Json();
        String imageName = null;
        try {
            imageName = super.saveUploadFile(request,file, "show", "jpg");
            logger.info(imageName);
            json.setObj(imageName);
            json.setSuccess(true);
            json.setMsg("导入成功！");
        } catch (Exception e) {
            json.setMsg(e.toString());
        }

        //super.writeJson(json,response);
        return imageName;
    }
}
