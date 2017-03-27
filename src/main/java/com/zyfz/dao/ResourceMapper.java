package com.zyfz.dao;

import com.zyfz.domain.Resources;

import java.util.List;

public interface ResourceMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Resources record);

    int insertSelective(Resources record);

    Resources selectByPrimaryKey(Integer id);

    List<Resources> selectAll();

    List<Resources> selectRootMenu();

    List<Resources> selectByParentId(Integer parentId);

    int updateByPrimaryKeySelective(Resources record);

    int updateByPrimaryKey(Resources record);
}