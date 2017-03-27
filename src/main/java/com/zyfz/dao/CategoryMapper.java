package com.zyfz.dao;

import com.zyfz.domain.Category;

import java.util.List;

public interface CategoryMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    List<Category> selectAll();

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    Category selectByCategoryName(String categoryName);

    List<Category> selectByParentId(Integer parentId);
}