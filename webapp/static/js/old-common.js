//刷新图片验证码
function changeImg(){
    document.getElementById("captcha").src="/user/vaildatecode?ctoken="+$('#ctoken').val()+"&random="+Math.random();
}
/**
* 新版模态对话框by杨祖健20161016
* alertBoxNew({
*     alertWidth:"360px", //选填 对话框宽度，默认 360px
*     alertTitle:'标题', //选填 默认"提示 Note"
*     alertContent:'内容', //必填 内容样式需未作统一规范可自己调整: #alertWrap .alert-text .***{***}
*     alertType:"none/warning/success", //选填 默认none, warning(红色圆圈内红色 ！) success(绿色背景圆圈内白色对号)
*     btnType:'none/sure/cancel/all', //默认all, none(没有按钮，右上角有关闭X) sure(只有确定按钮) cancel(只有取消按钮) all(确定取消按钮都有)
*     sureText:'确定按钮文字', //默认 确定 OK
*     cancelText:'取消按钮文字', //默认 取消 Cancel
*     sureFunc:function(){
*          //点击确定按钮执行back函数
*     },
*     cancelFunc:function(){
*          //点击取消按钮执行back函数
*     }
* });
* ( alertTitle/alertContent/sureText/cancelText 如果需国际化，写国际化key，key用alertStr开头,如：alertStr** = ****)
*/
function alertBoxNew(data){
    $('#alertWrap').remove();
    $('#alertWrap').off();
    /*初始化*/
    var alertWidth = '360px';
    if(data.alertWidth){
        alertWidth = data.alertWidth;
    }
    var alertTitle = 'alertStrTit';
    if(data.alertTitle){
        alertTitle = data.alertTitle;
    }
    var alertContent = data.alertContent;
    var alertType = 'none';
    if(data.alertType){
        alertType = data.alertType;
    }
    var btnType = 'all';
    if(data.btnType){
        btnType = data.btnType;
    }
    var sureText = 'alertStrok';
    if(data.sureText){
        sureText = data.sureText;
    }
    var cancelText = 'alertStrcancel';
    if(data.cancelText){
        cancelText = data.cancelText;
    }
    if(data.readyFunc){
        var readyFunc = data.readyFunc;
    }
    if(data.sureFunc){
        var sureFunc = data.sureFunc;
    }
    if(data.cancelFunc){
        var cancelFunc = data.cancelFunc;
    }
    var $alertWrap=$('<div id="alertWrap"></div>');
    if(data.alertIndex){
        $alertWrap.css('z-index', data.alertIndex);
    }
    //国际化
    var _lang=langType();
    $.i18n.properties({
        name : 'strings', //资源文件名称
        path : '/static/i18n/', //资源文件路径https://o5uaa1ha4.qnssl.com
        cache: true,
        mode : 'map', //用Map的方式使用资源文件中的值
        language : _lang,
        callback : function() {
            var _re=/^alertStr/;
            if(_re.test(alertTitle)) 
            {   
                alertTitle = $.i18n.prop(alertTitle);           
            }
            if(_re.test(alertContent))
            {   
                alertContent = $.i18n.prop(alertContent);           
            }
            if(_re.test(sureText)) 
            {   
                sureText = $.i18n.prop(sureText);           
            }
            if(_re.test(cancelText)) 
            {   
                cancelText = $.i18n.prop(cancelText);           
            }
            alertHtml();
        }
    });

    function alertHtml(){
        var _alertBg='<div class="alert-bg">';
        if(btnType=='none'){
            _alertBg += '<i class="alert-closer">X</i>'
        }
        _alertBg += alertTitle+'</div>';

        var btnStr='<div class="alert-box">';
        if (alertType == 'warning') {
            btnStr+='<i class="alert-icon alert-warning"></i>';
        } else if(alertType == 'success'){
            btnStr+='<i class="alert-icon alert-success"></i>';
        };

        var _alertContainer='<div class="alert-text text-center">'+alertContent+'</div>';
        btnStr+=_alertContainer;
        if(btnType=='sure'){
            btnStr+='<div class="text-center top20">'
            btnStr+='<button class="btn-default-black alert-sure">'+sureText+'</button>';
            btnStr+='</div>';
        }else if(btnType=='cancel'){
            btnStr+='<div class="text-center top20">'
            btnStr+='<button class="btn-default-black alert-cancel">'+cancelText+'</button>';
            btnStr+='</div>';
        }else if(btnType=='all'){
            btnStr+='<div text-center class="top20">'
            btnStr+='<button class="btn-default-black right20 alert-sure mid-btn" id="dianji">'+sureText+'</button>';
            btnStr+='<button class="btn-default-black alert-cancel mid-btn mid-btn-cancel-color">'+cancelText+'</button>';
            btnStr+='</div>';
        }

        btnStr+='</div>';

        $alertWrap
            .empty()
            .append(_alertBg)
            .append(btnStr);
        
        $alertWrap.appendTo($('body'));
        var wrap_ht=$alertWrap.height();
        $alertWrap.css({
            // 'marginTop': '-'+parseInt(wrap_ht/2)+'px',
            'width': alertWidth
        });
        if(readyFunc){
            readyFunc();
        }
    }

    $alertWrap.on('click','.alert-sure',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
        });
        if(sureFunc){
             sureFunc();
        } 
    })

    $alertWrap.on('click','.alert-cancel',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
        });
        if(cancelFunc){
            cancelFunc();
        } 
    })

    $alertWrap.on('click','.alert-closer',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
        });
    })
}

//模态对话框
function alertBoxFunc(strIndex,btntype,backFunc){//btntype:sure,cancel,all
    $('#alertWrap').remove();
    var $alertWrap=$('<div id="alertWrap"></div>');
    var _alertBg='<div class="alert-bg">'+$.i18n.prop('alertTit')+'</div>';
    var _alertContainer='<div class="alert-text text-center"></div>';
    var btnStr='<div class="alert-box">';
    btnStr+=_alertContainer;
    if(btntype=='sure')
    {
        btnStr+='<div class="text-center top20">'
        btnStr+='<button class="btn-default-black alert-sure">'+$.i18n.prop('ok')+'</button>';
        btnStr+='</div>';
    }
    else if(btntype=='cancel')
    {
        btnStr+='<div class="text-center top20">'
        btnStr+='<button class="btn-default-black alert-cancel">'+$.i18n.prop('cancel')+'</button>';
        btnStr+='</div>';
    }
    else if(btntype=='all')
    {
        btnStr+='<div text-center class="top20">'
        btnStr+='<button class="btn-default-black right20 alert-sure mid-btn" id="dianji">'+$.i18n.prop('ok')+'</button>';
        btnStr+='<button class="btn-default-black alert-cancel mid-btn mid-btn-cancel-color">'+$.i18n.prop('cancel')+'</button>';
        btnStr+='</div>';
    }

    btnStr+='</div>';

    $alertWrap
        .empty()
        .append(_alertBg)
        .append(btnStr);
    //alertStr国际化
    var _lang=langType();
    $.i18n.properties({
        name : 'strings', //资源文件名称
        path : '/static/i18n/', //资源文件路径https://o5uaa1ha4.qnssl.com
        cache: true,
        mode : 'map', //用Map的方式使用资源文件中的值
        language : _lang,
        callback : function() {//加载成功后设置显示内容
            var _re=/^alertStr/;
            if(_re.test(strIndex)) //需要国际化
            {   
                $alertWrap.find('.alert-text').text($.i18n.prop(strIndex));                
            }
            else 
                $alertWrap.find('.alert-text').text(strIndex);
            var wrap_ht=$alertWrap.height();
            var btnButton = $alertWrap.find('button')
            btnButton.each(function() {
                var texter =$(this).text().split("[")[1];
                if(texter){
                    $(this).text($.i18n.prop(texter.split("]")[0]));
                }
            });
            $alertWrap
                .appendTo($('body'))
                .css('marginTop','-'+parseInt(wrap_ht/2)+'px');
	    }
	});

    $alertWrap.on('click','.alert-sure',function(){
        $alertWrap.fadeOut(0,function(){
            $(this).remove();
        });
        if(backFunc)
            backFunc();
    })


    $alertWrap.on('click','.alert-cancel',function(){
        $alertWrap.fadeOut(0,function(){
            $(this).remove();
        });
    })
}
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

//判定国际化文字类别
function langType(){
    var locale = getCookie("locale");
    var langObj={'zh_CN':'zh','zh_TW':'tw','en_US':'en'};
    if(locale==null)
        return 'tw';
    else
    {
        return langObj[locale];
    }
}
/**
 ** 乘法函数，用来得到精确的乘法结果
 ** 说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
 ** 调用：accMul(arg1,arg2)
 ** 返回值：arg1乘以 arg2的精确结果
 **/
function accMul(arg1, arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try {
        m += s1.split(".")[1].length;
    }
    catch (e) {
    }
    try {
        m += s2.split(".")[1].length;
    }
    catch (e) {
    }
    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
}

// 给Number类型增加一个mul方法，调用起来更加方便。
Number.prototype.mul = function (arg) {
    return accMul(arg, this);
};
/*topbar用户名下拉*/
$(document).ready(function() {
	//alertStr国际化
     var _lang=langType();
     $.i18n.properties({
	        name : 'strings', //资源文件名称
	        path : '/static/i18n/', //资源文件路径https://o5uaa1ha4.qnssl.com
	        cache: true,
	        mode : 'map', //用Map的方式使用资源文件中的值
	        language : _lang,
	        callback : function() {}
    });
    $(".topbar-user").on('mouseenter', function(event) {
        var htmler="";
        $.ajax({
            type:'GET',
            url:'/deal/user/balance',
            success:function(msg){
                if(msg.status == 1){
                    alertBoxFunc(msg.error.message,'sure');
                }else{
                    htmler= '<p>฿ <span class="btc-change">'+ msg.data.balanceBtc +'</span>&nbsp;&nbsp;&nbsp;&nbsp; ≈ &nbsp;&nbsp;&nbsp;&nbsp;$<span class="dollar-change">'+ msg.data.balanceUsd +'</span></p><p>MN:<span class="mn-change">'+msg.data.mn +'</span> MG:<span class="mg-change">'+ msg.data.mg +'</span></p>';
                    $(".topbar-user-detail-content").html(htmler);
                    $('.mn-cheated').html(msg.data.cheat_mg.toFixed(4));
                    $('.mn-deducted').html(msg.data.mg_frozen.toFixed(4));
                    if(msg.data.user_status && msg.data.user_status == '-98'){
                        $('#frozen-mn-amount').html(msg.data.freeze_mn);
                        $('#frozen-mg-amount').html(msg.data.freeze_mg);
                        $('.topbar-user-frozen').show();
                    }else{
                        $('.topbar-user-frozen').hide();
                    }
                }
            },
            error:function(err){
                console.log(err);
            }
        });
    });
    $('.topbar-user-frozen-amount span').on('click', function(){
        $('.frozen-tip-modal').show();
    });
    $('.frozen-tip-modal .btn-confirm').on('click', function(){
        $('.frozen-tip-modal').hide();
    });
    // $('.btn-mg-recharge').on('click', function(){
    //     $('#mgRechargeModal').modal('show');
    // });
    $('.btn-mg-trans').on('click', function(){
        $('#mgTransModal').modal('show');
    });
    
    /*添加导航栏*/

    nav_hover('#myquery','#myaquery','#query_li'); //脑波查询导航
    nav_hover('#mybuy','#myabuy','#buy_li');  // 认购导航
    nav_hover('#reports','#reports_a','#reports_li');
    function nav_hover(obj,obj_a,obj_li){
        var myleft = 0;
        $(obj).hover(function(){
            myleft = $(obj_a).offset().left - 25;
            $(obj_li).css("display","block");
            $(obj_li).css("left",myleft);
        },function(){
            $(obj_li).css("display","none");
        })
        $(obj_li).find('li').hover(function(){
            $(obj_li).css("display","block");
            $(this).css('color','#333');
            $(this).css('background','#C9C9C9');
        },function(){
            $(obj_li).css("display","none");
            $(this).css('color','#666');
            $(this).css('background','#fff');
        })
    }
    //脑波查询导航跳转
    $('#myquery_btn').click(function(){
        window.location.href = "/record/meditation/my/brain/search";
    })
    $('#query_btn').click(function(){
        window.location.href = "/record/meditation/global/brain/search";
    })
    $('#deduct_btn').click(function(){
        window.location.href = "/record/meditation/deduct/brain/search";
    })
    //认购界面跳转
    $('#buy_btn').click(function(){
        window.location.href = "/deal/buy";
    })
    $('#buy_link_btn').click(function(){
        window.location.href = "/deal/buy_link";
    })
    //新闻界面跳转
    $('#reports_notice').click(function(){
        window.location.href = "/reports/notices/";
    })
    $('#reports_news').click(function(){
        window.location.href = "/reports/newses/";
    })
})
