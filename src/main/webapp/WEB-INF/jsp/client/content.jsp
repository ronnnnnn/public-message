<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <meta name="renderer" content="webkit|ie-stand">
    <title>融汇盈</title>
    <!--  标题头像  -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/tel.png" />
    <meta name="keywords" content="融汇盈">
    <meta name="description" content="融汇盈">

    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/sprstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.js"></script>
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->

</head>

<body ng-app="app" ng-controller="index">
<!--头部-->
<header>
    <div class="header-top">
        <div class="container fz14"><span class="fl gray">您好！欢迎来到融汇盈！</span> <span class="fr login"><!--<a href="#">免费注册</a> | <a href="#">登录</a>--></span>
        </div>
    </div>
    <div class="head-cont">
        <div class="container">
            <div class="logo"><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/logo.png" alt="融汇盈"></a>
            </div>
            <div class="tell fr"><i class="cal">138-5008-5207</i></div>
        </div>
    </div>
</header>

<!--导航-->
<div class="top-nav">
    <div class="nav">
        <!--导航条-->
        <ul class="nav-main">
            <li><a href="/ps/">首页</a></li>
            <li id="li-{{menu.id}}" ng-repeat="menu in menulist" on-finish-render><a href="javascript:;">{{menu.name}}<span class="hover-down"></span></a></li>

        </ul>
        <!--隐藏盒子-->
        <div id="box-{{menu.id}}" class="hidden-box hidden-loc-{{menu.id}}" style="display: none;" ng-repeat="menu in menulist">
            <ul>
                <li ng-repeat="next in menu.nextlist"><a href="{{next.url}}">{{next.name}}</a></li>

            </ul>
        </div>
    </div>

</div>
<!--<section>
  <div class="aboutbanner"></div>
</section>-->

<section class="z-con">
    <article class="articles fl">
        <div class="dets">
            <h2 class="breadcrumb" ng-repeat="nav in leftNavMain" ng-if="nav.on">
                <p><em>您的位置:</em> <a href="/">首页</a> &gt; <a href="${parentCat.url}">${parentCat.categoryName}</a> &gt; <a href="${currentCat.url}">${currentCat.categoryName}</a> &gt;  正文</p>
            </h2>

            <div class="newdata">
                <div class="top">
                    <h1><c:if test="${!empty article.title}">${article.title}</c:if></h1>
                    <div class="tools">
                        <span>
                             <c:if test="${!empty article.createTime}">
                                 <%--${article.createTime}--%>
                                 <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                             </c:if>
                        </span>
                    </div>
                </div>
                <div class="main">
                    <%--<b style="font-family: 'Microsoft YaHei', sans-serif; font-size: 15px; letter-spacing: 1px; line-height: 26px; padding: 1px 10px; color: rgb(255, 255, 255); margin-right: 10px; background: rgb(201, 31, 5);">摘要：</b><span style="color: rgb(51, 51, 51); font-family: 'Microsoft YaHei', sans-serif; font-size: 15px; letter-spacing: 1px; line-height: 26px; background-color: rgb(246, 246, 246);">{{bodyPaper}}</span>--%>
                    <div class="news_inter_area" style="width: 685px; margin: 5px auto 0px; line-height: 32px; vertical-align: middle; color: rgb(14, 14, 14); overflow: hidden; font-size: 18px; font-family: 'Microsoft YaHei', sans-serif;">
                        <c:if test="${!empty article.content}">${article.content}</c:if>
                        <a id="video_54631" style="padding: 0px; margin: 0px; border-style: none none dotted; border-bottom-width: 1px; border-bottom-color: rgb(0, 0, 0); outline: none; color: rgb(0, 0, 0); display: inline;"></a></div>
                    <div class="foot">
                        <div class="fl"> <!--<a href="#"><span>【文章来源】</span></a> <a href="javascript:;"></a><span>关键词：</span><a href="#">国际原油</a>--></div>
                        <div class="fr">
                            <div class="bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1483774887453"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> </div>
                            <script>
                                window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
                            </script>
                        </div>
                    </div>
                </div>
            </div>
            <div class="news mt20">
            </div>
        </div></article>
    <aside class="aside zixu-rt fr">
        <div class="school">
            <div class="title">鑫融汇学院</div>
            <ul>
                <li> <a id="school1" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=64">
                        <p>开户指南</p>
                    </a> </li>
                <li> <a id="school2" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=61">
                        <p>签约流程</p>
                    </a> </li>
                <li> <a id="school3" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=63">
                        <p>开设实盘</p>
                    </a> </li>
                <li> <a id="school4" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=69">
                        <p>交易规则</p>
                    </a> </li>
                <li> <a id="school5" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=71">
                        <p>基础知识</p>
                    </a> </li>
                <li> <a id="school6" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=72">
                        <p>投资技巧</p>
                    </a> </li>
                <li> <a id="school7" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=73">
                        <p>投资攻略</p>
                    </a> </li>
                <li> <a id="school8" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=70">
                        <p>技术面分析</p>
                    </a> </li>
            </ul>
        </div>
        <div class="phone"> <span>24小时客服热线</span>
            <p>138-5008-5207</p>
        </div>
        <ul class="links">
            <li> <a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=63"> <img src="${pageContext.request.contextPath}/images/sc01.png">
                    <p>预约开户</p>
                </a> </li>
            <li> <a target="_blank" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=63"> <img src="${pageContext.request.contextPath}/images/sc02.png">
                    <p>在线实盘开户</p>
                </a> </li>
            <li> <a target="_blank" href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=63"> <img src="${pageContext.request.contextPath}/images/sc03.png">
                    <p>在线模拟开户</p>
                </a> </li>
            <li> <a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=54"> <img src="${pageContext.request.contextPath}/images/sc04.png">
                    <p>软件下载</p>
                </a> </li>
        </ul>
    </aside>
</section>

<script language="JavaScript" type="text/javascript">
    $('#hits').html('');

</script>
<footer class="footer">
    <div class="container ft">
        <div class="ft_left">
            <div class="f_cal mt50">
                <p class="fmy fz16">客服咨询热线<br>
                    <strong class="fz24">138-5008-5207</strong></p>
            </div>
        </div>
        <div class="ft_center">
            <p class="btnav mt20"><a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=2">关于我们</a> | <a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=44">企业文件</a> | <a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=45">合作伙伴</a> | <a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=46">企业架构</a> | <a href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=47">联系我们</a></p>
            <p class="ts fmy">本产品属于高风险、高收益投资品种；投资者应具有较高的风险识别能力、资金实力与风险承受能力。投资者应合理配置资产、不应用全部资金做投资，不应借钱来做投资。</p>
            <p class="mt20"><!--<img src="http://www.xrh66.com/statics/rs/images/360.png">--></p>
        </div>
        <div class="ft_right">
            <!--<p class="ewm"><img src="http://www.xrh66.com/statics/rs/images/qc.jpg" width="150" height="150"></p>
            <p class="wxh">扫一扫，关注鑫融汇微信</p>-->
        </div>
    </div>
    <div class="copy fmy">
        <p>Copyright © 2016 鑫融汇（厦门）网络科技有限公司 | 闽ICP备16035001号</p>
    </div>
</footer>

<div class="tbox"><a href="javascript:void(0)" id="gotop"></a></div></body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/banner.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</html>