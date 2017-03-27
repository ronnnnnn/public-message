package com.zyfz.service;

import com.zyfz.domain.Resources;

import java.util.List;
import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
public interface IResourceService extends IBaseService<Resources> {


    Set<String> findPermissions(Set<Integer> resourceIds); //得到资源对应的权限字符串

    List<Resources> findMenus(Set<String> permissions); //根据用户权限得到菜单

    List<Resources> finaRootMenu();

    List<Resources> findAll();

    List<Resources> findByParentId(Integer parentId);

}
