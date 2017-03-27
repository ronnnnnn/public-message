package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.NewArticleMapper;
import com.zyfz.domain.NewArticle;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.INewArticleService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 17-1-8.
 */
@Service
public class NewArticleServiceImlp implements INewArticleService {

    @Resource
    NewArticleMapper newArticleMapper;

    @Override
    public Integer save(NewArticle newArticle) {
        newArticle.setCreateTime(new Date());
        return newArticleMapper.insertSelective(newArticle);
    }

    @Override
    public Integer update(NewArticle newArticle) {
        return newArticleMapper.updateByPrimaryKeySelective(newArticle);
    }

    @Override
    public Datagrid getByCatId(Integer id,PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<NewArticle> newArticles = newArticleMapper.selectByCatId(id);
        PageInfo pageInfo = new PageInfo(newArticles);
        return new Datagrid(pageInfo.getTotal(),newArticles);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public NewArticle getOneById(NewArticle newArticle) {
        return newArticleMapper.selectByPrimaryKey(newArticle.getId());
    }

    @Override
    public Integer deleteOneById(NewArticle newArticle) {
        return newArticleMapper.deleteByPrimaryKey(newArticle.getId());
    }
}
