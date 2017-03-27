package com.zyfz.service;

import com.zyfz.domain.H5Manage;
import com.zyfz.domain.H5ManageExample;

import java.util.List;

/**
 * Created by ron on 17-3-25.
 */
public interface H5Service extends IBaseService<H5Manage> {

    public List<H5Manage> selectByExample(H5ManageExample h5ManageExample);
}
