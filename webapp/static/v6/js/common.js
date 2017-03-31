//刷新图片验证码
function changeImg(){
    document.getElementById("captcha").src="/user/vaildatecode?ctoken="+$('#ctoken').val()+"&random="+Math.random();
}
/**
* 新版模态对话框by杨祖健20161016
*/
function alertBoxNew(data){
    $('#alertWrap').remove();
    $('#alertbg').remove();
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
    if(data.sureFunc){
        var sureFunc = data.sureFunc;
    }
    if(data.cancelFunc){
        var cancelFunc = data.cancelFunc;
    }
    var $alertbg=$('<div id="alertbg"></div>');
    var $alertWrap=$('<div id="alertWrap"></div>');
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
        $alertbg.appendTo($('body'));
        $alertWrap.appendTo($('body'));
        var wrap_ht=$alertWrap.height();
        $alertWrap.css({
            // 'marginTop': '-'+parseInt(wrap_ht/2)+'px',
            'width': alertWidth
        });;
    }

    $alertWrap.on('click','.alert-sure',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
        if(sureFunc){
             sureFunc();
        } 
    })

    $alertWrap.on('click','.alert-cancel',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
        if(cancelFunc){
            cancelFunc();
        } 
    })
    $alertWrap.on('click','.alert-closer',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
    })
    $alertbg.on('click',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
    })
}

function getCookie(name){
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
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

//tab 选项卡
function tab(taber,tab_con,motion,auto){
    var taber = $(taber);
    var longer = taber.length;
    var tab_con = $(tab_con);
    var nunIndex = 0;
    change(nunIndex);
    function change(n){
        taber.eq(n).addClass('active').siblings().removeClass('active');
        tab_con.eq(n).show().siblings().hide();
    }
    if(auto){
        var timer = setInterval(function(){
            nunIndex++;
            if(nunIndex>=longer){
                nunIndex = 0;
            }
            change(nunIndex);
        },auto)
    }
    taber.each(function(index, el) {
        $(this).on(motion, function(event) {
            event.preventDefault();
            nunIndex=$(this).index()
            change(nunIndex);
            if(auto&&timer){
                clearInterval(timer);
            }
        });
    });
}
// 这一屏伪加载
function readyLoad(name,beforeDAta,afterData,Percent){
    var windowHeight = $(window).height();
    var name = $(name);
    var lengther = name.length;
    var heighter = name.height();
    var ni = 0;
    var topPx = name.offset().top;
    var winPercent = 80;
    if(Percent){
        winPercent = Percent;
    }
    name.css(beforeDAta);
    var winScrollTop = $(window).scrollTop();
    showName();
    $(window).scroll(function () {
        winScrollTop = $(window).scrollTop();
        showName();
    })
    function showName(){
        if($(window).scrollTop() > (topPx-(windowHeight*winPercent/100)) && ni == 0 && $(window).scrollTop() < (topPx+heighter)){
            ni = 1;
            //console.log(lengther);
            name.each(function(index, el) {
                setTimeout(function(){
                    //console.log(index);
                    name.eq(index).animate(afterData, 500,easeOutBounce);
                },300*index)
            });
        }
    }
}
// 下一屏执行(多用于下屏提前加载)
function nextReadyLoad(name,doFuntion){
    var windowHeight = $(window).height();
    var name = $(name);
    var ni = 0;
    var topPx = name.offset().top;
    $(window).scroll(function () {
        if($(window).scrollTop() > (topPx-windowHeight) && ni == 0){
            ni = 1;
            doFuntion();
        }
    })
}

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
     /*topbar用户名下拉*/
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

    //更新btc价格
    setInterval(function updateBtcInfo() {
        $.ajax({
            url:'/deal/getCurrentcoin',
            type:'GET',
            success:function(data){
                if(data.status == 0){
                    var $price=$('.topbar-price');
                    $price.find('.new-btc-price').text(" $ "+parseFloat(data.data['btcUsdPrice']).toFixed(2));
                    $price.find('.new-mg-price').text( " ฿ "+parseFloat(data.data['mg_price']).toFixed(6));
                    
                }
            }
        });
        return updateBtcInfo;
    }(), 30*1000);

    //header nav 
    if(ISLOGIN && ISLOGIN == true){
        headerNav();
    }
    function headerNav(){
        var header = $(".header .nav");
        var ibar = header.find('#ibar');
        var nowActive = header.find('.active');
        var nowLefter = nowActive.aPosition().left
        var nowWidther = nowActive.width();
        ibar.css('opacity', 0);
        ibar.animate({"width": nowWidther, "left": nowLefter }, 300,function(){
            ibar.css('opacity', 1);
        });
        header.find('li').each(function(index, el) {
            var navigation_bar = $(this).find('.navigation_bar');
            var lefter = $(this).aPosition().left;
            var widther = $(this).width()
            if(navigation_bar){
                navigation_bar.css('left', lefter+(widther/2));
            }
            $(this).hover(function() {
                $(this).addClass('hov');
                ibar.stop().animate({"width": widther , "left": lefter }, 300);
                navigation_bar.show();
            }, function() {
                $(this).removeClass('hov');
                navigation_bar.hide();
            });
        });
        header.on('mouseleave', function(event) {
            event.preventDefault();
            ibar.stop().animate({"width": nowWidther , "left": nowLefter }, 300);
        });
    }
    //footer 判断当前语言
    chLanguage();
    function chLanguage(){
        //console.log(_lang);
        var box = $(".footer-moudle .language")
        switch(_lang)
        {
        case "zh":
            box.addClass('chainlogo');
            box.find('.chbar').addClass('language_active');
            box.find('span').text(box.find('.chbar').text());
            break;
        case "en":
            box.addClass('usalogo');
            box.find('.enbar').addClass('language_active');
            box.find('span').text(box.find('.enbar').text());
            break;
        case "tw":
            box.addClass('hklogo');
            box.find('.hkbar').addClass('language_active');
            box.find('span').text(box.find('.hkbar').text());
            break;
        }
    }
})
jQuery.fn.aPosition = function() {
    thisLeft = this.offset().left;
    thisTop = this.offset().top;
    thisParent = this.parent();
    parentLeft = thisParent.offset().left;
    parentTop = thisParent.offset().top;
    return {
        left: thisLeft-parentLeft,
        top: thisTop-parentTop
    };
};

var easeOutExpo = function (x, t, b, c, d) { 
            return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b; 
        }
var easeOutBounce = function (x, t, b, c, d) { 
            if ((t/=d) < (1/2.75)) { 
                return c*(7.5625*t*t) + b; 
            } else if (t < (2/2.75)) { 
                return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b; 
            } else if (t < (2.5/2.75)) { 
                return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b; 
            } else { 
                return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b; 
            } 
        }