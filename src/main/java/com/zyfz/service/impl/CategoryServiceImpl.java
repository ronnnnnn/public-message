package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.CategoryMapper;
import com.zyfz.domain.Category;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-10-25.
 */
@Service
public class CategoryServiceImpl implements ICategoryService {

    @Resource
    CategoryMapper categoryMapper;

    @Override
    public Integer save(Category category) {
        return categoryMapper.insertSelective(category);
    }

    @Override
    public Integer update(Category category) {
        return categoryMapper.updateByPrimaryKeySelective(category);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Category> categories = getAllWithList();
        PageInfo pageInfo = new PageInfo(categories);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(categories);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public List<Category> getAllWithList() {
        return categoryMapper.selectAll();
    }

    @Override
    public Category getOneById(Category category) {
        return categoryMapper.selectByPrimaryKey(category.getId());
    }

    @Override
    public Integer deleteOneById(Category category) {
        return categoryMapper.deleteByPrimaryKey(category.getId());
    }

    @Override
    public Category getByCategoryName(String categoryName) {
        return categoryMapper.selectByCategoryName(categoryName);
    }

    @Override
    public List<Category> selectByParentId(Integer parentId) {
        return categoryMapper.selectByParentId(parentId);
    }
}
