define(function(require, exports, module){
    var $ = require('jquery');
    var slide = require("../module/jquery.flexslider");
    // var vconsole = require("../lib/vconsole.min");
    var Util = require("../module/util");
    var Modal = require("../module/modal");
    var Tab = require("../module/tab");
    var svgIcon = require("../iconfont");
    var carousel = require("../module/carousel");
    var mobileMenuTap = require("../module/mobileMenuTap");
    var updateBtcInfo = require("../module/updateBtcInfo");
    //footer 判断当前语言
    var footLanguage = require("../module/footLanguage");
    var _lang = Util.langType();
    footLanguage();
    
    //更新价格
    var updatePrice = new updateBtcInfo({
        Box: ".topbar-price",
        btcBox:".new-btc-price",
        mgBtc:".new-mg-price",
        rate:30*1000
    })
    //Price滚动
    setInterval(function changePrice() {
        var topbar = $(".topbar-price");
        var toper = topbar.css('top');
        if(toper=="0px"){
            //console.log(topbar.css('top'));
            topbar.animate({"top": -30}, 300);
        }else{
            topbar.animate({"top": 0}, 300)
        }
        return changePrice;
    }(), 5*1000);
    /* ======= Header Background Slideshow - Flexslider ======= */
    $('.bg-slider').flexslider({
        animation: "slide",
        slideshow: true,
        slideshowSpeed: 3000,
        directionNav: false, 
        slideshowSpeed: 8000,
        animationLoop: false
    });
    if(IS_LOGIN){
        mobileMenuTap();
        mobileNoticeList();
    }
    
    //mobileNoticeList
    function mobileNoticeList(){
        var noticeHtml = '<i class="iconfont icon-gonggao"></i>&nbsp;&nbsp;';
        $.ajax({
            url: '/notice/user/limit',
            type: 'GET',
            dataType: 'json',
            success:function(data){
                var datar = data.data;
                //console.log(datar);
                var lengther=20;
                if(/^[a-zA-Z]/.test(datar[0].title)){
                    lengther=lengther*2;
                }
                noticeHtml += '<a href="/reports/notice/'+datar[0].id+'"  target="_blank">'+datar[0].title.substring(0,lengther)+' … ';
                //datar[i].is_read  0：未读 1：已读
                if(datar[0].is_read == 0){
                    noticeHtml += '<i class="red">NEW</i>';
                }
                noticeHtml += '</a>';
                $(".notice-box").html(noticeHtml);
            }
        })
    }
    //product
    productShow()
    function productShow(){
        $(".product .icon-more").each(function(index, el) {
            var self = $(this);
            self.on('click', function(event) {
                event.preventDefault();
                /* Act on the event */
                self.parent().find('.infobox').show();
                self.hide();
            });
        });
    }
    //blockchain
    var boxTab = new Tab({
        taber: ".blockchain .boxer .box",
        tab_con: ".blockchain .explain-box .explain",
        motion: "click",
        auto: 5000
    });

    //vido
    videoFun()
    function videoFun(){
        var html = '<video id="myVideo" -webkit-playsinline="false" ><source src='+videoUrl+' type="video/mp4" /></video>';
        $(".icon-video-play1").on('click', function(event) {
            console.log("click");
            hiderVideo(0);
            $("body").append(html);
            var video = document.getElementById("myVideo");
            var status = 1;
            video.controls = true;
            launchFullscreen(video);
            video.play();
            
            video.addEventListener('pause',function(){
                console.log("pause");
                hiderVideo(0);
            });

            video.addEventListener("fullscreenchange", FShandler);  
            video.addEventListener("webkitfullscreenchange", FShandler);  
            video.addEventListener("mozfullscreenchange", FShandler);  
            video.addEventListener("MSFullscreenChange", FShandler); 
            function FShandler() { 
                console.log("fullscreenchange");
                if(status == 0 ){
                    hiderVideo(status);
                    status = 1
                }else{
                    status = 0
                }
            }
        });
        
        $(".icon-video-play").on('click', function(event) {
            hiderVideo(0);
        });
        //ios safari 退出全屏时捕获不到退出全屏事件
        // $(document).on('touchstart',function(){
        //     if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) {
        //         hiderVideo(0);
        //     }
        // })
        function hiderVideo(n){
            var video = document.getElementById("myVideo");
            if(n==0) {
                console.log("hiderVideo");
                $("#myVideo").remove();
            }
        }
        //判断各种浏览器，找到正确的方法
        function launchFullscreen(element) {
            if(element.requestFullscreen) {
                element.requestFullscreen();
            } else if(element.mozRequestFullScreen) {
                element.mozRequestFullScreen();
            } else if(element.webkitRequestFullscreen) {
                element.webkitRequestFullscreen();
            } else if(element.msRequestFullscreen) {
                element.msRequestFullscreen();
            }
        }
    }

    //memorabiliaHtml
    function memorabiliaHtml(){
        var thisHtml = "";
        var barHtml ="";
        for (var i = 0; i < memorabiliaData.length; i++) {
            if(i < memorabiliaData.length-1){
                thisHtml += '<div class="pic-moudle after">'+
                                '<img src="'+memorabiliaData[i].pic+'" alt="'+memorabiliaData[i].title+'">'+
                                // '<div>'+
                                //     '<h4>[ '+memorabiliaData[i].title+' ]</h4>'+
                                //     '<em class="small-line"></em>'+
                                    // '<p>'+memorabiliaData[i].info+'</p>'+
                                //     '<a href="'+memorabiliaData[i].url+'" target = "_blank">' + I18N.prop('index.more') + '<i class="iconfont icon-littlearrow-right"></i></a>'+
                                //'</div>'+
                            '</div>';
            }else if(i == memorabiliaData.length-1){
                thisHtml += '<div class="pic-moudle after">'+
                                '<img src="'+memorabiliaData[i].pic+'" alt="'+memorabiliaData[i].title+'">'+
                                // '<div>'+
                                //     '<h3>'+memorabiliaData[i].title+'</h3>'+
                                // '</div>'+
                            '</div>';
            }

            barHtml += '<div class="marker"> <i></i> </div>';
        };
        $("#memorabilia .moudle-box").html(thisHtml);
        $("#marks-bar").html(barHtml);
        $("#marks-bar").width($("#marks-bar .marker").width()*memorabiliaData.length);
        var picer = new carousel({
            "pic":"#memorabilia .pic-moudle",
            "speed":5000,
            "bar":"#marks-bar .marker"
        });
    }
    // 下一屏执行(多用于下屏提前加载)
    Util.nextReadyLoad("#memorabilia", memorabiliaHtml);
    // 基金宣言广告
        $(".isbtn").on("click",function(event){
            event.preventDefault();
            var sysLang = 'zh_CN';
            if(_lang == "zh"){
                sysLang = 'zh_CN';
            }
            else if( _lang == "tw" ){
                sysLang = 'zh_TW';
            }
            else{
                sysLang = 'en_US';
            }
            window.location = "feedback/index?locale="+sysLang;
        })
        $(".feedback-close").on("click",function(event){
            event.preventDefault();
            $(".feedback-index-bg").hide().unbind();
        })
});
