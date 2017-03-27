package com.zyfz.web.filter;


import com.zyfz.domain.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet Filter implementation class LoginFilter
 */
public class myClientFilter implements Filter {

    /**
     * Default constructor.
     */
    public myClientFilter() {
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String path = req.getServletPath();
        User user = (User) req.getAttribute("user");
        if (path.intern() == "/".intern() && user == null){
            request.getRequestDispatcher("/client/index").forward(request,response);
          //  request.getRequestDispatcher("/WEB-INF/client/index.jsp").forward(request,response);
        } else {
            chain.doFilter(request, response);
        }
//        chain.doFilter(request, response);
//        }
//        String path = req.getServletPath();
//        if (path.intern() == "/".intern()){
//            res.sendRedirect("/ps/index.jsp");
//        } else {
//            chain.doFilter(request, response);
//        }
//        Pattern compile = Pattern.compile(
//                "/(login|register|checkTel|checkusername|adminlogin|managerlogin\\.do)|adminlogin\\.html|agentlogin\\.html|userlogin\\.html|managerlogin\\.html|/build/.|/assets/.*+");
//        Matcher matcher = compile.matcher(req.getServletPath());
//        boolean isFilter = matcher.find();
//        if ("/userlogin.html".equals(req.getServletPath()) && req.getSession().getAttribute("userinfo") != null) { // 除去不需要过滤的静态资源或者已登录。。。
//            // 当用户已登录时，再进入登录界面会直接跳转
//            res.sendRedirect("index.jsp");
//        } else if ("/admin-login.htm".equals(req.getServletPath())
//                && req.getSession().getAttribute("userinfo") != null) {
//            res.sendRedirect("toAdminHome");
//        } else if ("/agentlogin.html".equals(req.getServletPath())
//                && req.getSession().getAttribute("userinfo") != null) {
//            res.sendRedirect("/agentlogin.html");
//        } else if ("/managerlogin.html".equals(req.getServletPath())
//                && req.getSession().getAttribute("userinfo") != null) {
//            res.sendRedirect("manager.html");
//        } else if (isFilter || req.getSession().getAttribute("userinfo") != null) {
//            chain.doFilter(request, response);
//        } else {
//            if ("/manager.html".equals(req.getServletPath())) {
//                res.sendRedirect("managerlogin.html");
//            } else if ("/toAdminHome".equals(req.getServletPath())) {
//                request.getRequestDispatcher("admin-login.htm").forward(request, response);
//            } else if ("/agentlogin.html".equals(req.getServletPath())) {
//                res.sendRedirect("/agentlogin.html");
//            } else {
//                res.sendRedirect("userlogin.html");
//            }
//        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
    }

}
