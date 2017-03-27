package com.zyfz.service;

import com.zyfz.domain.Category;

import java.util.List;

/**
 * Created by ron on 16-10-25.
 */
public interface ICategoryService extends IBaseService<Category> {
    public List<Category> getAllWithList();

    public Category getByCategoryName(String categoryName);

    List<Category> selectByParentId(Integer parentId);
}
