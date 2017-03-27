package com.zyfz.service;

import com.zyfz.domain.Show;

import java.util.List;

/**
 * Created by ron on 16-10-22.
 */
public interface IShowService extends IBaseService<Show> {
    public List<Show> getPicByType(String mtype);
}
