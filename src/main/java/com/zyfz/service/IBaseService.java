package com.zyfz.service;

import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

/**
 * Created by ron on 16-10-13.
 */
public interface IBaseService<T> {

    public Integer save(T t);

    public Integer update(T t);

    public Datagrid getAll(PageModel pageModel);

    public T getOneById(T t);

    public Integer deleteOneById(T t);
    

}
