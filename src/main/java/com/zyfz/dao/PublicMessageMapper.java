package com.zyfz.dao;

import com.zyfz.domain.PublicMessage;

import java.util.List;

public interface PublicMessageMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(PublicMessage record);

    int insertSelective(PublicMessage record);

    PublicMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PublicMessage record);

    int updateByPrimaryKey(PublicMessage record);

    List<PublicMessage> selectAll();

    List<PublicMessage> selectByLimit(Integer size);
}