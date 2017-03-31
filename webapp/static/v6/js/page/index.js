define(function(require, exports, module){
    var $ = require('jquery');
    var slide = require("../module/jquery.flexslider");
    var Util = require("../module/util");
    var carousel = require("../module/carousel");
    var Modal = require("../module/modal");

    $.fn.aPosition = function() {
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
    function memorabiliaHtml(){
        var thisHtml = "";
        var barHtml ="";
        for (var i = 0; i < memorabiliaData.length; i++) {
            if(i < memorabiliaData.length-1){
                thisHtml += '<div class="pic-moudle after">'+
                            '<img src="'+memorabiliaData[i].pic+'" alt="'+memorabiliaData[i].title+'">'+
                            '<div>'+
                                '<h4>[ '+memorabiliaData[i].title+' ]</h4>'+
                                '<em class="small-line"></em>'+
                                '<p>'+memorabiliaData[i].info+'</p>'+
                                '<a href="'+memorabiliaData[i].url+'" target = "_blank">' + I18N.prop('index.more') + '<i class="iconfont icon-littlearrow-right"></i></a>'+
                            '</div>'+
                        '</div>';
            }else if(i == memorabiliaData.length-1){
                thisHtml += '<div class="pic-moudle after">'+
                            '<img src="'+memorabiliaData[i].pic+'" alt="'+memorabiliaData[i].title+'">'+
                            '<div>'+
                                '<h3>[ '+memorabiliaData[i].title+' ]</h3>'+
                            '</div>'+
                        '</div>';
            }

            barHtml += '<div class="marker"> <i></i> <span>[ '+ memorabiliaData[i].node +' ]</span></div>';
        };
        $("#memorabilia .moudle-box").html(thisHtml);
        $("#marks-bar").html(barHtml);
        var picer = new carousel({
            "pic":"#memorabilia .pic-moudle",
            "speed":3000,
            "prev":"#prev-gradient",
            "next":"#next-gradient",
            "bar":"#marks-bar .marker"
        });
    }
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
    function noticeList(){
        var noticeHtml = $(".notice-box .warper").html();
        $.ajax({
            url: '/notice/user/limit',
            type: 'GET',
            dataType: 'json',
            success:function(data){
                var datar = data.data;
                //console.log(datar);
                var lengther=20;
                for (var i = 0; i <  3; i++) {
                    if(/^[a-zA-Z]/.test(datar[i].title)){
                        lengther=lengther*2;
                    }
                    noticeHtml += '<a href="/reports/notice/'+datar[i].id+'"  target="_blank">'+datar[i].title.substring(0,lengther)+' … ';
                    //datar[i].is_read  0：未读 1：已读
                    if(datar[i].is_read == 0){
                        noticeHtml += '<i class="red">NEW</i>'
                    }
                    noticeHtml += '</a>'
                };
                $(".notice-box .warper").html(noticeHtml);
                readyLoad(".notice-box a",{"opacity":"0"},{"opacity":"1"});
            }
        })

    }
    var easeOutExpo = function (x, t, b, c, d) {
        return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
    };
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
    };
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
    function headerNav(){
        var header = $(".header .nav");
        var ibar = header.find('#ibar');
        var nowActive = header.find('.active');
        var nowLefter = nowActive.aPosition().left
        var nowWidther = nowActive.width();
        ibar.animate({"width": nowWidther, "left": nowLefter }, 300);
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
        var box = $(".footer-moudle .language");
        var _lang=langType();
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
    if(IS_LOGIN){
        headerNav();
    }


    if(IS_LOGIN){
        noticeList();
    }
    /*  ======= back-to-top when scrolled ======= */
    $(window).on('scroll', function() {

         if ($(window).scrollTop() > 0) {
            $('#back-to-top').fadeIn();
         }
         else {
            $('#back-to-top').fadeOut();
         }
    });

    $('#back-to-top').on('click',function(){
         $("html,body").animate({"scrollTop":top})
    })

    /* ======= Header Background Slideshow - Flexslider ======= */
    $('.bg-slider').flexslider({
        animation: "fade",
        slideshow: true,
        slideshowSpeed: 3000,
        directionNav: false, //remove the default direction-nav - https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties
        slideshowSpeed: 8000
    });
    $('.product').flexslider({
        animation: "slide",
        slideshow: true,
        direction:"horizontal",
        slideshowSpeed: 3000,
        directionNav: true,
        slideshowSpeed: 8000,
        prevText: "Previous",
        nextText: "Next"
    });
    var windowHeight = $(window).height();

    $("#video-box").on('click', '.iconfont', function(event) {
        event.preventDefault();
        /* Act on the event */
        //poster="/static/images/index/video-poster4.jpg"
        var videoHtml = '<video id="myVideo" width="100%"  controls autoplay="autoplay" webkit-playsinline>'+
                                '<source src="' + videoUrl + '" type="video/mp4"/>'+
                                '<object type="application/x-shockwave-flash" name="player" width="100%" id="player" style="visibility: visible;">'+
                                    '<param name="allowFullScreen" value="true">'+
                                    '<param name="allowScriptAccess" value="always">'+
                                    '<param name="bgcolor" value="#000000">'+
                                '</object>'+
                            '</video>';
        var box = new Modal({
            classPrefix: 'index-video-',
            width: 960,
            title: '',
            content: videoHtml,
            hasClose: true,
            hasMask: false
        });
        box.render();
        $(".fluid-width-video-wrapper").parent().css('padding', '0').parent().css({'padding': '0','border': 'none'});
    });

    nextReadyLoad("#memorabilia",memorabiliaHtml);


    var myStatus = $('.mystatus').val();
    var appealCount = $('.appeal_count').val();
    if (parseInt(myStatus) == -90) {
        if (appealCount < 3) {
            $('#alert_status').css('display', 'block');
            $('#iCan').click(function () {
                $('#alert_status').css('display', 'none');
            })
            $('#noCan').click(function () {
                $('#alert_status').css('display', 'none');
                $('#alert_megs').css('display', 'block');
                $('#nextCan').click(function () {
                    $('#alert_megs').css('display', 'none');
                    var myval = $('#mytext').val();
                    if (myval.length < 50) {

                        $('#alert_megs').css('display', 'block');
                    } else {
                        $.ajax({
                            type: "POST",
                            url: "/brainwave/complaints/appeal",
                            dataType: "json",
                            data: {message: myval},
                            success: function (data) {
                                if (data.status != 0) {
                                    var myMessage = data.error.message;
                                    alertBoxFunc(myMessage, "all");
                                } else {
                                    alertBoxFunc(I18N.prop('index.appeal_success'), "sure");
                                }
                            }
                        })
                    }
                })
            })
        } else {
            alertBoxFunc(I18N.prop('index.appeal_fail'), "sure");
        }
    }
    if (localStorage && localStorage.getItem('safetip')) {

    } else {
        $.ajax({
            type: "GET",
            url: "/v2/user/security_level_index",
            success: function (data) {
                if (data.level && Number(data.level) < 4) {
                    $('.index-safe-tip-text').html(data.info);
                    $('.safe-tip-modal .btn-confirm').on('click', function () {
                        if ($('#safe-tip-checkbox').prop('checked')) {
                            localStorage.setItem('safetip', 1);
                        }
                        $('.safe-tip-modal').hide();
                    });
                    $('.safe-tip-modal').show();
                }
            }
        })
    }
    //导航整体效果
    function scrollHeader(name,scrollDate,className){
        var bot = scrollDate;
        var name = $(name);
        var barHeught = name.height();
        var scrollToper = $(window).scrollTop();
        $(window).scroll(function () {
            var scrollTopNow = $(window).scrollTop();
            if(scrollTopNow > bot && scrollTopNow < windowHeight){
                name.addClass(className);
            }else if(scrollTopNow <= bot){
                name.removeClass(className);
                name.stop().animate({"top": "0px"}, 100 );
            }else if(scrollTopNow >= windowHeight){
                name.addClass(className);
                var delta = scrollToper - scrollTopNow ;
                //console.log(delta);
                if(delta >= 50){
                    //console.log("+");
                    name.stop().animate({"top": "0px"}, 100 );
                }else if(delta < -50 ){
                    //console.log("-");
                    name.stop().animate({"top": "-"+barHeught+"px"}, 200 );
                }
            }
            if(scrollTopNow <= 0){
                name.removeClass(className);
                name.stop().animate({"top": "0px"}, 100 );
            }
            scrollToper = scrollTopNow ;
        });
    }
    scrollHeader("#fixed_topper",12,"to-narrow");
    //Blockchain tab
    tab(".blockchain .boxer .box",".blockchain .explain-box .explain","click",5000);

    readyLoad(".blockchain .boxer .box",{"opacity":"0"},{"opacity":"1"});
    readyLoad("#video-box",{"opacity":"0"},{"opacity":"1"});
    readyLoad("#video-box .iconfont",{"opacity":"0","padding-top": 220},{"opacity":"1","padding-top": 120});
    readyLoad("#video-box p",{"opacity":"0","padding-top": 120},{"opacity":"1","padding-top": 0});
    //readyLoad("#memorabilia .moudle-box",{"opacity":"0","top":"-50%"},{"opacity":"1","top":"50%"},95);
    //readyLoad("#memorabilia .mark-cover",{"opacity":"0","top":"150%"},{"opacity":"1","top":"50%"},90);
    readyLoad(".footer",{"opacity":"0"},{"opacity":"1"},90);
    $("section h3").each(function(index, el) {
        readyLoad(this,{"opacity":"0","top": 100},{"opacity":"1","top": 0});
    });

    $("#closeIeAlert").on('click', function (event) {
        event.preventDefault();
        /* Act on the event */
        $(".iealert").hide();
    });
});
