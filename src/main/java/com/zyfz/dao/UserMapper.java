package com.zyfz.dao;

import com.zyfz.domain.User;

import java.util.List;

public interface UserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectByUsername(String username);

    User selectByPhone(String phone);

    User selectByCookie(String sessionId);

    List<User> selectByUsernameLike(String username, Boolean utype);

    List<User> selectByPhoneLike(String phone, Boolean utype);

    List<User> selectAll();

    List<User> selectAllSuperUser();

    List<User> selectAllNormalUser();

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectHonerOrder();
}