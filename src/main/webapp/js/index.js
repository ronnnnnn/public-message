angular.module("app",[])
    .controller("index",function ($scope,$http) {
        //导航
            $http.get("/ps/api/v1/anon/category").success(function(data) {
                $scope.menulist = data;
                $scope.$on('ngRepeatFinished', function( ngRepeatFinishedEvent ) {
                    //导航
                    $(document).ready(function(){
//    nav-li hover e
                        var num;
                        $('.nav-main>li[id]').hover(function(){
                            /*图标向上旋转*/
                            $(this).find("span").removeClass().addClass('hover-up');
                            /*下拉框出现*/
                            var Obj = $(this).attr('id');
                            num = Obj.substring(3, Obj.length);
                            $('#box-'+num).slideDown(300);
                        },function(){
                            /*图标向下旋转*/
                            $(this).find("span").removeClass().addClass('hover-down');
                            /*下拉框消失*/
                            $('#box-'+num).hide();
                        });
//    hidden-box hover e
                        $('.hidden-box').hover(function(){
                            /*保持图标向上*/
                            $('#li-'+num).find("span").removeClass().addClass('hover-up');
                            $(this).show();
                        },function(){
                            $(this).slideUp(200);
                            $('#li-'+num).find("span").removeClass().addClass('hover-down');
                        });
                    });

//回到顶部
                    function tBox(){
                        //h = $(window).height();
                        t = $(document).scrollTop();
                        if(t > 150){
                            $(".tbox").fadeIn(300);
                        }else{
                            $(".tbox").fadeOut(300);
                        }
                    }

                    $(document).ready(function(e){
                        $("body").append('<div class="tbox"><a href="javascript:void(0)" id="gotop"></a></div>');

                        tBox();

                        $("#gotop").click(function(){
                            $(document).scrollTop(0);
                        })
                    });

                    $(window).scroll(function(e){
                        tBox();
                    })
                });
            });


        //轮播
        $scope.carouselList = [
            {
                url:'', //轮播链接到的正文URL
                imgurl:'http://www.xrh66.com/uploadfile/2016/0419/20160419042319331.jpg',   //轮播图片所在的地址
                alt:'文本1'   //轮播图片加载失败时，所显示的文本
            },

            {
                url:'',
                imgurl:'http://www.xrh66.com/uploadfile/2016/0419/20160419041512672.jpg',
                alt:'文本2'
            },
            {
                url:'',
                imgurl:'http://www.xrh66.com/uploadfile/2016/0419/20160419042225749.jpg',
                alt:'文本3'
            }

        ];

        //不需要看
        $scope.$on('ngRepeatFinished', function( ngRepeatFinishedEvent ) {
            var ie6 = !-[1,] && !window.XMLHttpRequest;
            var userAgent = navigator.userAgent.toLowerCase();
            var browser = {
                ie8: /msie 8/.test(userAgent),
                ie7: /msie 7/.test(userAgent)
            };

            $.fn.slide=function(){
                var defaults,opts,data_opts,$this,$b_,t,n=0,count,$nav,$p,$n,DelayObj,Delay=false;
                defaults={
                    fade:true,
                    auto:true,
                    time:4000,
                    action:'mouseover',
                    fn:null
                };
                $this=$(this);
                data_opts=$this.data('slide')||{};
                opts=$.extend({},defaults,data_opts);
                $b_=$this.children('.ban_c');
                count=$b_.length;
                if($this.find('.ban_nav').length){$nav=$this.find('.ban_nav')}else{
                    $nav=$('<div class="ban_nav"></div>');
                    for(i=0;i<count;i++){$nav.append('<a>'+(i+1)+'</a>')};
                    $this.append($nav)
                };
                $this.append('<a class="Left" onselectstart="return false;"></a><a class="Right" onselectstart="return false;"></a>');
                $nav.children('a').eq(0).addClass('on');
                $nav.children('a').eq(1).addClass('ban_next');
                $nav.children('a').eq(count-1).addClass('ban_prev');
                $b_.hide().eq(0).show();
                if(ie6){$b_.height($b_.attr('height') || $this.height())};
                $nav.children('a').each(function(index) {
                    $(this).on(opts.action,function(event) {
                        event.preventDefault();
                        event.stopPropagation();
                        if (index >= count){return false}else{
                            $nav.children('a').eq(index-1).addClass('ban_prev').siblings().removeClass('ban_prev');
                            $nav.children('a').eq(index==count-1 ? 0 : index+1).addClass('ban_next').siblings().removeClass('ban_next')
                        };
                        if(opts.fade){$b_.stop(1,1).fadeOut(200).eq(index).stop(1,1).fadeIn(500)}else{$b_.hide().eq(index).show()};
                        $(this).addClass('on').siblings().removeClass("on");
                        n=index
                    })
                });
                $p=$(this).find('.Left');
                $n=$(this).find('.Right');
                if(opts.auto){
                    t = setInterval(function(){showAuto()}, opts.time);
                    $this.mouseenter(function(){
                        clearInterval(t);
                    }).mouseleave(function(){
                        t=setInterval(function(){showAuto()},opts.time);
                    })
                };
                $p.click(function(){showPre()});
                $n.click(function(){showAuto()});
                function showAuto(){n=n>=(count - 1) ? 0 : ++n;$nav.find('a').eq(n).trigger(opts.action);};
                function showPre(){n=n<=0 ? (count - 1) : --n;$nav.find('a').eq(n).trigger(opts.action)};
                if(opts.fn){eval(opts.fn+"(opts,$b_,$nav)")}
            };
            $('.slide').each(function() {$(this).slide()});
        });


        //走进融汇盈
        $scope.aboutMoreUrl = '';    //更多连接
        $scope.aboutContent = '“鑫融汇”立志于打造成为卓越的金融投资集团。目前主业依托网络科技业务、互联网金融业务、各类投资产品经纪业务，以金融经纪业务为主导、微交易微盘互联网交易和网络科技，文化传媒为辅，立志于发展为经纪业务，自营业务，投资者素质教育培训，股权投资，产业并购和风投的多元化金融平台。公司专注于金融投资服务，隶属大连再生资源交易所597号综合会员单位，东北商品交易中心051号综合会员，打造金融投资服务卓越品牌，为中国投资者带来新兴的投资产品服务，公司始终致力于打造安全的交易平台，自由的买卖交易环境…';    //主体内容

        //财经资讯
        $scope.moneyInfoMoreUrl = '';   //财经资讯更多的链接
        //财经资讯最新一条新闻的
        $scope.lastNewsContentUrl = ''; //最新新闻的内容URL
        $scope.lastNewsTitle = '[中国股市]沪指放量开年两连涨，创下近一个月新高';  //最新新闻的标题
        $scope.lastNewsTime = '01-04 16:10';    //最新新闻的时间

        //财经资讯 新闻列表
        $scope.moneyInfoList = [
            {
                time:'01/04',   //时间
                contentUrl:'',  //内容链接到正文页
                title:'1月4日财经早餐:MI触近四年新高，通胀压力渐' //标题
            },
            {
                time:'01/04',
                contentUrl:'',
                title:'1月4日财经早餐:MI触近四年新高，通胀压力渐'
            },
            {
                time:'01/04',
                contentUrl:'',
                title:'1月4日财经早餐:MI触近四年新高，通胀压力渐'
            },
            {
                time:'01/04',
                contentUrl:'',
                title:'1月4日财经早餐:MI触近四年新高，通胀压力渐'
            },
            {
                time:'01/04',
                contentUrl:'',
                title:'1月4日财经早餐:MI触近四年新高，通胀压力渐'
            },
            {
                time:'01/04',
                contentUrl:'',
                title:'1月4日财经早餐:MI触近四年新高，通胀压力渐'
            },
        ];

        //交易所
        $scope.exchangeUrl = '';    //交易所动态更多链接
        $scope.videoUrl = '';
        //交易所动态新闻列表
        $scope.exchangeList = [
            {
                time:'10-11 08:22', //时间
                contentUrl:'',  //主题内容链接到正文页
                title:'关于华安日日鑫货币市场基金H类基金份额流动性服务商公告' //标题
            },
            {
                time:'10-11 08:22',
                contentUrl:'',
                title:'关于华安日日鑫货币市场基金H类基金份额流动性服务商公告'
            },
        ];


        //内参
        $scope.internalUrl = '';    //内参更多链接到list 页面
        $scope.internalList = [
            {
                time:'10-11',
                contentUrl:'',
                title:'【技术分享】趋势形态应用分析'
            },
            {
                time:'10-11',
                contentUrl:'',
                title:'【技术分享】趋势形态应用分析'
            },
            {
                time:'10-11',
                contentUrl:'',
                title:'【技术分享】趋势形态应用分析'
            },
            {
                time:'10-11',
                contentUrl:'',
                title:'【技术分享】趋势形态应用分析'
            },
            {
                time:'10-11',
                contentUrl:'',
                title:'【技术分享】趋势形态应用分析'
            },
        ];


        //战法
        $scope.methodUrl = '';  //战法更多链接到list 页面
        $scope.methodList = [
            {
                time:'01-04',
                contentUrl:'',
                title:'12.27日股市早评及分析'
            },
            {
                time:'01-04',
                contentUrl:'',
                title:'12.27日股市早评及分析'
            },
            {
                time:'01-04',
                contentUrl:'',
                title:'12.27日股市早评及分析'
            },
            {
                time:'01-04',
                contentUrl:'',
                title:'12.27日股市早评及分析'
            },
            {
                time:'01-04',
                contentUrl:'',
                title:'12.27日股市早评及分析'
            },
        ];

    //    公司新闻
        $scope.newsUrl = '';    //公司新闻链接到更多
        $scope.newsList = [
            {
                contentUrl:'',
                title:'中合圣达供应链服务有限公司在天津举行揭'
            },
            {
                contentUrl:'',
                title:'中合圣达供应链服务有限公司在天津举行揭'
            },
            {
                contentUrl:'',
                title:'中合圣达供应链服务有限公司在天津举行揭'
            },
            {
                contentUrl:'',
                title:'中合圣达供应链服务有限公司在天津举行揭'
            },
            {
                contentUrl:'',
                title:'中合圣达供应链服务有限公司在天津举行揭'
            },
        ];

        $scope.leftNavHeader = '公司动态';
        $scope.leftNavMain = [
            {
                name:'企业公告',
                on:false,
                url:''
            },
            {
                name:'公司新闻',
                on:true,
                url:''
            },
            {
                name:'企业公告',
                on:false,
                url:''
            },
            {
                name:'企业公告',
                on:false,
                url:''
            },
        ];
        $scope.lists = [
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
            {
                title:'中合圣达供应链服务有限公司在天津举行揭牌仪式',
                url:'',
                paper:'为提高服务质量，提升客户体验，交易所将对FLAT交易系统与建行通讯优化升级。为配合此次升级工作，现将相关注意事项公布',
                time:'2016-04-20 16:09'
            },
        ];
        $scope.mainTitle = '公司介绍';
        $scope.mainContent= '鑫融汇集团是一家拥有国家级金融平台资质的大型集团企业。以金融行业为主导、地产、投资、娱乐全方面发展的多元化布局的企业。鑫融汇集团在现货投资服务领域，在现货交易量、开户数、客户保证金排名均位于全国前列，是现货投资服务领导品牌之一.目前，集团旗下拥有多家现货投资公司，房地产公司，娱乐企业.业务范围遍及北京、上海、广州、厦门、等省市为业务发展核心，辐射全国市场。全国员工总数二千余人，集团以北上广长期以来，鑫融汇集团始终坚持“以服务创造回报”的企业理念和“合作共赢 共享未来”的经营理念，厚积薄发，不断进取，荣誉满载。持续深耕中国市场，现已发展成为专业、整合、多元的综合性现货投资服务集团。';

        $scope.bodyTitle = '【中国股市】沪指放量开年两连涨，创下近一个月新高';
        $scope.bodyTime = '2017-01-04 16:10:08';
        $scope.bodyPaper = '中国股市沪综指1月4日收市放量续涨，创下近一个月新高。分析师指出，今年伊始人民币汇率企稳，股市一大忧虑因素得到缓解，投资者风险偏好有所上升；继昨日一根中阳线，大盘在白酒和新能源股等题材股的拉动下，继续反弹之路，成交放大。';
        $scope.bodyContent = '中国股市沪综指周三(1月4日)收市放量续涨，创下近一个月新高。分析师指出，今年伊始人民币汇率企稳，股市一大忧虑因素得到缓解，投资者风险偏好有所上升；继昨日一根中阳线，大盘在白酒和新能源股等题材股的拉动下，继续反弹之路，成交放大。';

    }).directive('onFinishRender', function ($timeout) {
    return {
        restrict: 'A',
        link: function (scope, element, attr) {
            if (scope.$last === true) {
                $timeout(function () {
                    scope.$emit('ngRepeatFinished');
                });
            }
        }
    }
});

