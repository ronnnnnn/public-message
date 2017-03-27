package com.zyfz.dao;

import com.zyfz.domain.H5Manage;
import com.zyfz.domain.H5ManageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface H5ManageMapper {
    int countByExample(H5ManageExample example);

    int deleteByExample(H5ManageExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(H5Manage record);

    int insertSelective(H5Manage record);

    List<H5Manage> selectByExample(H5ManageExample example);

    H5Manage selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") H5Manage record, @Param("example") H5ManageExample example);

    int updateByExample(@Param("record") H5Manage record, @Param("example") H5ManageExample example);

    int updateByPrimaryKeySelective(H5Manage record);

    int updateByPrimaryKey(H5Manage record);

    List<H5Manage> selectAll();
}