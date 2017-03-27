package com.zyfz.service;

import com.zyfz.domain.User;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;

import java.util.Set;

/**
 * Created by ron on 16-10-15.
 */
public interface IUserservice extends IBaseService<User> {

    public void changeContribute(int userId, Double newContribute);//修改贡献值

    public void changeHoner(int userId, Double newHoner);//修改荣誉值

    public void changePassword(int userId, String newPassword); //修改密码

    public User findByUsername(String username); //根据用户名查找用户

    public User findByPhone(String phone); //根据手机号查找用户

    public User findByUsernameOrPhone(String userkey);

    public User findByCookie(String sessionId);

    public Set<String> findRoles(String username);// 根据用户名查找其角色

    public Set<String> findPermissions(String username);// 根据用户名查找其权限

    public Integer deleteByIds(String ids);  //批量删除用户

    public Datagrid getAllSuperUser(PageModel pageModel);

    public Datagrid getAllNormalUser(PageModel pageModel);

    public Datagrid getUserLike(PageModel model, String likeString, Boolean utype);

    public  Datagrid findHonerOrder(PageModel pageModel);
}

