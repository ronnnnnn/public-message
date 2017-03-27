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