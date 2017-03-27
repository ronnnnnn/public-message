package com.zyfz.service;

import com.zyfz.domain.PublicMessage;

import java.util.List;

/**
 * Created by ron on 17-3-19.
 */
public interface IPublishMessageService extends IBaseService<PublicMessage> {

    List<PublicMessage> selectByLimit(Integer size);

}
