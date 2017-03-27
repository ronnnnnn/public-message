package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.PublicMessageMapper;
import com.zyfz.domain.PublicMessage;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPublishMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 17-3-19.
 */
@Service
public class PublicMessageServiceImpl implements IPublishMessageService{

    @Resource
    private PublicMessageMapper publicMessageMapper;

    @Override
    public Integer save(PublicMessage publicMessage) {
        return publicMessageMapper.insertSelective(publicMessage);
    }

    @Override
    public Integer update(PublicMessage publicMessage) {
        return publicMessageMapper.updateByPrimaryKeySelective(publicMessage);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(), pageModel.getRows());
        List<PublicMessage> publicMessages = publicMessageMapper.selectAll();
        PageInfo pageInfo = new PageInfo(publicMessages);
        return new Datagrid(pageInfo.getTotal(),publicMessages);
    }


    @Override
    public PublicMessage getOneById(PublicMessage publicMessage) {
        return publicMessageMapper.selectByPrimaryKey(publicMessage.getId());
    }

    @Override
    public Integer deleteOneById(PublicMessage publicMessage) {
        return publicMessageMapper.deleteByPrimaryKey(publicMessage.getId());
    }

    @Override
    public List<PublicMessage> selectByLimit(Integer size) {
        return publicMessageMapper.selectByLimit(size);
    }
}
