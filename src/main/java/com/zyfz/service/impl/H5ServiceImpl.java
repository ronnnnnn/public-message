package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.H5ManageMapper;
import com.zyfz.domain.H5Manage;
import com.zyfz.domain.H5ManageExample;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.H5Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 17-3-25.
 */
@Service
public class H5ServiceImpl implements H5Service {

    @Resource
    H5ManageMapper h5ManageMapper;

    @Override
    public Integer save(H5Manage h5Manage) {
        return h5ManageMapper.insertSelective(h5Manage);
    }

    @Override
    public Integer update(H5Manage h5Manage) {
        return h5ManageMapper.updateByPrimaryKeySelective(h5Manage);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<H5Manage> h5Manages = h5ManageMapper.selectAll();
        PageInfo pageInfo = new PageInfo(h5Manages);
        return new Datagrid(pageInfo.getTotal(),h5Manages);
    }

    @Override
    public H5Manage getOneById(H5Manage h5Manage) {
        return h5ManageMapper.selectByPrimaryKey(h5Manage.getId());
    }

    @Override
    public Integer deleteOneById(H5Manage h5Manage) {
        return h5ManageMapper.deleteByPrimaryKey(h5Manage.getId());
    }

    @Override
    public List<H5Manage> selectByExample(H5ManageExample h5ManageExample) {

        return h5ManageMapper.selectByExample(h5ManageExample);
    }
}
