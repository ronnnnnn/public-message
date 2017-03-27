package com.zyfz.service;

import com.zyfz.domain.Role;

import java.util.List;
import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
public interface IRoleService extends IBaseService<Role> {

    Set<String> findRoles(int... roleIds); //根据角色编号得到角色标识符列表

    Set<String> findPermissions(int[] roleIds); //根据角色编号得到权限字符串列表

    List<Role> getAllRoles();
}
