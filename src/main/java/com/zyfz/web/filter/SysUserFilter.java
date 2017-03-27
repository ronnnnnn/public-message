package com.zyfz.web.filter;

import com.zyfz.service.IUserservice;
import com.zyfz.web.Constants;
import org.apache.shiro.web.filter.PathMatchingFilter;

import javax.annotation.Resource;
import org.apache.shiro.SecurityUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * ron
 */
public class SysUserFilter extends PathMatchingFilter {

    @Resource
    private IUserservice userService;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        request.setAttribute(Constants.CURRENT_USER, userService.findByUsername(username));
        return true;
    }
}
