package com.zyfz.dao;

import com.zyfz.domain.Show;

import java.util.List;

public interface ShowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Show record);

    int insertSelective(Show record);

    Show selectByPrimaryKey(Integer id);

    List<Show> selectAll();

    List<Show> selectByPicType(String mtype);

    int updateByPrimaryKeySelective(Show record);

    int updateByPrimaryKey(Show record);
}