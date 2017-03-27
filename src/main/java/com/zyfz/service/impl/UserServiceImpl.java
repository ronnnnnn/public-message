package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.RoleMapper;
import com.zyfz.dao.UserMapper;
import com.zyfz.domain.Role;
import com.zyfz.domain.User;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IRoleService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
@Service
public class UserServiceImpl implements IUserservice {

    @Resource
    UserMapper userMapper;

    @Resource
    RoleMapper roleMapper;

    @Resource
    IRoleService roleService;

    @Resource
    PasswordHelper passwordHelper;

    @Override
    public Integer save(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public Integer update(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void changeContribute(int userId, Double newContribute) {
        User user = userMapper.selectByPrimaryKey(userId);
        user.setContributeScore(newContribute);
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void changeHoner(int userId, Double newHoner) {
        User user = userMapper.selectByPrimaryKey(userId);
        user.setHonerScore(newHoner);
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void changePassword(int userId, String newPassword) {
         User user = userMapper.selectByPrimaryKey(userId);
         user.setPassword(newPassword);
         passwordHelper.encryptPassword(user);
         userMapper.updateByPrimaryKey(user);
    }

    @Override
    public Datagrid getAll(PageModel pageModel)
    {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<User> users = userMapper.selectAll();
        PageInfo pageInfo = new PageInfo(users);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(users);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }


    @Override
    public Datagrid getAllSuperUser(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<User> users = userMapper.selectAllSuperUser();
        PageInfo pageInfo = new PageInfo(users);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(users);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getAllNormalUser(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        if(pageModel.getOrder() != null){
            PageHelper.orderBy(pageModel.getOrder()+" "+pageModel.getSort());
        }
        List<User> users = userMapper.selectAllNormalUser();
        PageInfo pageInfo = new PageInfo(users);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(users);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public User getOneById(User user) {
        return userMapper.selectByPrimaryKey(user.getId());
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public User findByPhone(String phone) {
        return userMapper.selectByPhone(phone);
    }

    @Override
    public Integer deleteOneById(User user) {
        return userMapper.deleteByPrimaryKey(user.getId());
    }

    @Override
    public Set<String> findRoles(String username) {

        User user = findByUsername(username);
        if(user == null){
            return Collections.EMPTY_SET;
        }
        Set<String> roles = new HashSet<String>();
        String[] roleIds = user.getRoleIds().split(",");
        for (String roleId : roleIds){
            Role role = roleMapper.selectByPrimaryKey(Integer.valueOf(roleId));
            roles.add(role.getRole());
        }
        return roles;
    }

    @Override
    public Set<String> findPermissions(String username) {

        User user = findByUsername(username);
        String[] roleIds = user.getRoleIds().split(",");
        int mroleids[] = new int[roleIds.length];
        for (int i = 0; i < roleIds.length ; i++) {
            mroleids[i] = Integer.valueOf(roleIds[i]);
        }
        return roleService.findPermissions(mroleids);
    }

    @Override
    public Integer deleteByIds(String ids) {
        String mids[] = ids.split(",");
        int count = 0;
        for(String id : mids){
            int mid = Integer.valueOf(id);
            userMapper.deleteByPrimaryKey(mid);
            count++;
        }
        return count;
    }

    @Override
    public Datagrid getUserLike(PageModel model,String likeString,Boolean utype) {
        PageHelper.startPage(model.getPage(),model.getRows());
        String queryString = likeString + "%";
        List<User> users = userMapper.selectByPhoneLike(queryString,utype);
        if(users.size() == 0){
            users = userMapper.selectByUsernameLike(queryString,utype);
        }else if(users.size() == 0){
            return new Datagrid();
        }
        PageInfo pageInfo = new PageInfo(users);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(users);
        datagrid.setTotal(pageInfo.getTotal());
        return  datagrid;
    }

    @Override
    public User findByCookie(String sessionId) {
        return userMapper.selectByCookie(sessionId);
    }

    @Override
    public User findByUsernameOrPhone(String userkey) {
        User myUser = new User();
        myUser = this.findByUsername(userkey);
        if(myUser != null){
            return myUser;
        }else{
            return  this.findByPhone(userkey);
        }
    }

    @Override
    public Datagrid findHonerOrder(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<User> users = userMapper.selectHonerOrder();
        PageInfo pageInfo = new PageInfo(users);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(users);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }
}
