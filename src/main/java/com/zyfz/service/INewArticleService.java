package com.zyfz.service;

import com.zyfz.domain.NewArticle;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 17-1-8.
 */
public interface INewArticleService extends IBaseService<NewArticle> {
    public Datagrid getByCatId(Integer id, PageModel pageModel);
}
