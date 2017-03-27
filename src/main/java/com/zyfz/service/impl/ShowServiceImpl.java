package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.ShowMapper;
import com.zyfz.domain.Show;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IShowService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-10-22.
 */
@Service
public class ShowServiceImpl implements IShowService {

    @Resource
    ShowMapper showMapper;

    @Override
    public Integer save(Show show) {
        return showMapper.insertSelective(show);
    }

    @Override
    public Integer update(Show show) {
        return showMapper.updateByPrimaryKeySelective(show);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Show> shows = showMapper.selectAll();
        PageInfo pageInfo = new PageInfo(shows);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(shows);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Show getOneById(Show show) {
        return showMapper.selectByPrimaryKey(show.getId());
    }

    @Override
    public Integer deleteOneById(Show show) {
        return showMapper.deleteByPrimaryKey(show.getId());
    }

    @Override
    public List<Show> getPicByType(String mtype) {
        return showMapper.selectByPicType(mtype);
    }
}
