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


<div class="slide banner" data-slide="{&quot;action&quot;:&quot;click&quot;,&quot;fn&quot;:&quot;banner_ext&quot;,&quot;time&quot;:&quot;5000&quot;}" >
    <c:forEach items="${picList}" var="pic">
         <div class="ban_c album">
            <a href="${pic.relateUrl}">
                <img src="${pic.imageUrl}" alt="${pic.mname}">
            </a>
         </div>
    </c:forEach>
    <div class="ban_nav">
        <a class="ban_prev">1</a><a class="on">2</a><a class="ban_next">3</a>
    </div>
    <a class="Left" onselectstart="return false;"></a><a class="Right" onselectstart="return false;"></a>
</div>

<section class="connent-bg">
    <div class="container">
        <div class="w-main">
            <dl class="i_about">
                <dt><img src="${pageContext.request.contextPath}/images/about.png" alt=""></dt>
                <dd>
                    <div class="i_title"><span class="fmy">走进融汇盈</span> <a
                            href="{{aboutMoreUrl}}"
                            class="more">更多&gt;&gt;</a></div>
                    <div class="ctn">
                        <p ng-bind="aboutContent"></p>
                    </div>
                </dd>
            </dl>
            <div class="i_box">
                <div class="box_l">
                    <div class="news mt20">
                        <div class="box_h"><span><strong>财经资讯</strong></span><a
                                href="{{moneyInfoMoreUrl}}">更多&gt;&gt;</a>
                        </div>
                        <div class="list">
                            <div class="first">
                                <div class="pic fl mr15">
                                    <a href="{{lastNewsContentUrl}}">
                                        <img src="${pageContext.request.contextPath}/images/new.jpg">
                                    </a>
                                </div>
                                <div>
                                    <a href="{{lastNewsContentUrl}}">
                                        <h1>{{lastNewsTitle}}</h1>
                                    </a>
                                    <p></p>
                                    <div class="tools"><span>{{lastNewsTime}}</span>
                                        <a href="{{lastNewsContentUrl}}">【全文】</a>
                                    </div>
                                </div>
                            </div>
                            <ul>
                                <li ng-repeat="info in moneyInfoList">
                                    <span>{{info.time}}</span>
                                    <a href="{{info.contentUrl}}">
                                        <i>&gt;</i> {{info.title}}
                                    </a>
                                </li>


                            </ul>
                        </div>
                    </div>
                    <div class="news mt20">
                        <div class="box_h"><span><strong>交易所动态</strong></span><a
                                href="{{exchangeUrl}}">更多&gt;&gt;</a>
                        </div>
                        <div class="list" ng-repeat="exchange in exchangeList">
                            <div class="first mb20">
                                <div>
                                    <a href="{{exchange.contentUrl}}">
                                        <h1>{{exchange.title}}</h1>
                                    </a>
                                    <p></p>
                                    <div class="tools"><span>{{exchange.time}}</span>
                                        <a href="{{exchange.contentUrl}}">【全文】</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="i_news mt20">
                        <div class="box">
                            <div class="box_h"><span class="fmy">融汇盈内参</span> <a
                                    href="{{internalUrl}}">更多&gt;&gt;</a>
                            </div>
                            <ul class="box_m">
                                <li ng-repeat="internal in internalList">
                                    <p>
                                        <a href="{{internal.contentUrl}}">{{internal.title}}</a>
                                    </p>
                                    <span>{{internal.time}}</span>
                                </li>

                            </ul>
                        </div>
                        <div class="box" style="margin-right:0px;">
                            <div class="box_h"><span class="fmy">融汇盈战法</span> <a
                                    href="{{methodlUrl}}">更多&gt;&gt;</a>
                            </div>
                            <ul class="box_m">
                                <li ng-repeat="method in methodList">
                                    <p>
                                        <a href="{{method.contentUrl}}">{{method.title}}</a>
                                    </p>
                                    <span>{{method.time}}</span>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="box_r aside">
                    <%--<div class="video mt30">--%>
                        <%--<div class="title">交易所介绍</div>--%>
                        <%--<div class="video_con">--%>
<%--<!--                            http://player.youku.com/player.php/sid/XODkxMTIzNzYw/v.swf-->--%>
                            <%--<embed src="{{videoUrl}}"--%>
                                   <%--allowfullscreen="true" quality="high" width="300" height="300" align="middle"--%>
                                   <%--allowscriptaccess="always" type="application/x-shockwave-flash">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="school">
                        <div class="title">融汇盈学院</div>
                        <ul>
                            <li><a id="school1"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=64">
                                    <p>开户指南</p>
                                </a></li>
                            <li><a id="school2"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=61">
                                    <p>签约流程</p>
                                </a></li>
                            <li><a id="school3"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=63">
                                    <p>开设实盘</p>
                                </a></li>
                            <li><a id="school4"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=69">
                                    <p>交易规则</p>
                                </a></li>
                            <li><a id="school5"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=71">
                                    <p>基础知识</p>
                                </a></li>
                            <li><a id="school6"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=72">
                                    <p>投资技巧</p>
                                </a></li>
                            <li><a id="school7"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=73">
                                    <p>投资攻略</p>
                                </a></li>
                            <li><a id="school8"
                                   href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=70">
                                    <p>技术面分析</p>
                                </a></li>
                        </ul>
                    </div>
                    <div class="notice">
                        <div class="title">公司新闻
                            <a class="more" href="{{newsUrl}}">更多&gt;&gt;</a>
                        </div>
                        <div class="list">
                            <ul>
                                <li ng-repeat="news in newsList">
                                    <a href="{{news.contentUrl}}">{{news.title}}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="content pt30 ">
    <div class="container">
        <div class="client">
            <div class="title">
                <h1 class="fmy">合作伙伴</h1>
            </div>
            <div class="client_list">
                <ul>
                    <li>
                        <a href="#" title="浦发银行" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419050602672.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="供销集团" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419050901315.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="再生资源" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051027281.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="畜产品流通协会" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051122228.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="中国银行" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051145925.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="再生资源回收" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051220320.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="再生资源信息网" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051306231.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="中国农业银行" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051338206.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="工商银行" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051406229.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="建设银行" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051433806.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="平安银行" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051516888.png" width="122"
                                 height="48">
                        </a>
                    </li>
                    <li>
                        <a href="#" title="再生资源国际交易" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/bank/20160419051543614.png" width="122"
                                 height="48">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>


<script type="text/javascript">
    var flag = 1;
    $('#rightArrow').click(function () {
        if (flag == 1) {
            $("#floatDivBoxs").animate({right: '-175px'}, 300);
            $(this).animate({right: '-5px'}, 300);
            $(this).css('background-position', '-50px 0');
            flag = 0;
        } else {
            $("#floatDivBoxs").animate({right: '0'}, 300);
            $(this).animate({right: '170px'}, 300);
            $(this).css('background-position', '0px 0');
            flag = 1;
        }
    });
    //$('#rightArrow').trigger('click');
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
            <p class="btnav mt20"><a
                    href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=2">关于我们</a> | <a
                    href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=44">企业文件</a> | <a
                    href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=45">合作伙伴</a> | <a
                    href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=46">企业架构</a> | <a
                    href="http://www.xrh66.com/index.php?m=content&amp;c=index&amp;a=lists&amp;catid=47">联系我们</a></p>
            <p class="ts fmy">本产品属于高风险、高收益投资品种；投资者应具有较高的风险识别能力、资金实力与风险承受能力。投资者应合理配置资产、不应用全部资金做投资，不应借钱来做投资。</p>
            <p class="mt20"><!--<img src="http://www.xrh66.com/statics/rs/images/360.png">--></p>
        </div>
        <div class="ft_right">
            <!--<p class="ewm"><img src="http://www.xrh66.com/statics/rs/images/qc.jpg" width="150" height="150"></p>
            <p class="wxh">扫一扫，关注融汇盈微信</p>-->
        </div>
    </div>
    <div class="copy fmy">
        <p>Copyright © 2016 融汇盈（厦门）网络科技有限公司 | 闽ICP备16035001号</p>
    </div>
</footer>

<div class="tbox"><a href="javascript:void(0)" id="gotop"></a></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/banner.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>

</html>