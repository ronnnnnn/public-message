package com.zyfz.dao;

import com.zyfz.domain.NewArticle;
import java.util.List;

public interface NewArticleMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(NewArticle record);

    int insertSelective(NewArticle record);

    NewArticle selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NewArticle record);

    int updateByPrimaryKey(NewArticle record);

    List<NewArticle> selectByCatId(Integer id);

}