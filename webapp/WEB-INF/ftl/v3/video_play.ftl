<!DOCTYPE html>
<html lang="en">
<head>
    <div id='wx_pic' style='margin:0 auto;display:none;'>
        <img src='/static/images/video_logo.jpg'/>
    </div>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css"
          href="https://o5uaa1ha4.qnssl.com/static/css/bootstrap.min.css?v=201604261834">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=20160824">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css?v=2016062031231">
    <link rel="stylesheet" type="text/css" href="/static/css/styles-5.css?v=201600824">
<!--视频名称-->
    <title>${classified[0].curricula[0].chapters[0].defaultTitle}</title>
    <style type="text/css">
        html, body {
            height: 100%;
        }
        body {
            background: #1d1d26;
        }
        .auto_container {
            width: 1080px;
            margin: 0 auto;
            overflow: hidden;
            height: auto;
            margin-bottom: 60px;
        }
        .headVideo {
            width: 100%;
            height: 600px;
        }
        .headText {
            width: 100%;
            height: 40px;
            line-height: 40px;
            font-size: 1em;
            color: #535a60;
            background: #111b23;
            text-indent: 1em;
            position: relative;
            top: -6px;
        }
        .bodyText {
            width: 100%;
            margin-top: 6px;
            color: #fff;
        }
        .bodyText .textH2 {
            font-size: 1.5em;
            height: 34px;
            line-height: 34px;
        }
        .bodyText .textP {
            font-size: 1em;
            color: #88888d;
            width: 100%;
        }
        /***********
        .bodyText .textP {
            height: 46px;
            line-height:1.5em;
            overflow:hidden;
            text-overflow:ellipsis;
            display:-webkit-box;
            -webkit-box-orient:vertical;
            -webkit-line-clamp:2;
        }
        .bodyUl{
           width: 100%;
           background: #144967;
           margin-top: 6px;
           padding: 6px 0;
         }
         .bodyUl li{
           width: 100%;
           height: 40px;
           line-height: 40px;
         }
         .bodyUl li a{
           display: block;
           width: 100%;
           height: 100%;
           text-decoration: none;
           color: #fff;
         }
         .bodyUl li div{
           float: left;
           overflow: hidden;
         }
         .bodyUl li div:nth-child(1){
           display: none;
           text-align: center;
         }
         .bodyUl li div:nth-child(2){
           width: 90%;
           text-indent: 2em;
         }
         .bodyUl li div:nth-child(3){
           width: 10%;
         }
         .bodyUl li .hovercolor{
           color: #00affd;
         }**********/
        .auto_footer {
            display: none;
        }
        .app_warp {
            display: none;
        }
        .app_pop{
            width: 174px;
            height: 192px;
            background:#fff;
            text-align: center;
            position: fixed;
            right: 20px;
            top: 300px;
            color: #666;
            border-radius: 4px;
            border:1px solid #ccc;
            font-family:'PingFangSC-Regular',arial, sans-serif;
        }
        .app_pop p{
            font-size: 12px;
            line-height: 17px;
            margin: 0;
        }
        .app_pop img{
            margin-top: 47px;
            margin-bottom: 3px;
        }
        .app_pop .down-btn{
            position: absolute;
            width: 68px;
            height:24px;
            line-height: 24px; 
            top: 13px;
            left: 14px;
            border: 1px solid #328ED9;
            border-radius: 2px;
            font-size: 12px;
            color: #328ED9;
            cursor:pointer;
        }
        .app_pop .down-btn:hover{
            background:#EDEDED; 
        }
        .app_pop .android-btn{
            text-indent: 18px;
        }
        .app_pop .ios-btn{
            left: 94px;
            text-indent: 24px;
        }
        #app_pop .app_down_active{
            background: #0E8BEC;
            color: #FFF;
        }
        .app_download_none{
            display: none;
        }
        .down-btn span{
            position: absolute;
            width: 12px;
            height: 12px;
            overflow: hidden;
            left: 5px;
            top: 5px;
        }
        .down-btn .android_icon{
            background: url('/static/images/app_down_icon.png') 0 -36px;
        }
        .down-btn .ios_icon{
            left: 16px;
            background: url('/static/images/app_down_icon.png') 0 -72px;
        }
        /*＊＊＊＊＊*/
    @media screen and (max-width: 960px) {
            body, ul, li, h2 {
                padding: 0;
                margin: 0;
            }
            .header, .footer,.app_pop{
                display: none;
            }
            .auto_container {
                width: 100%;
                margin: 0;
                min-height: 100%;
                height: auto;
                padding-bottom: 30%;
            }
            .headVideo {
                height: 432px;
            }
            .headText {
                font-size: 0.8em;
            }
            .bodyText .textH2 {
                font-size: 1em;
                height: 30px;
                line-height: 30px;
            }
            .bodyText .textP {
                font-size: 0.75em;
            }
            .bodyText {
                width: 94%;
                margin: 0 auto;
            }
            /********
            .bodyText .textP {
                height: 32px;
                overflow:hidden;
                text-overflow:ellipsis;
                display:-webkit-box;
                -webkit-box-orient:vertical;
                -webkit-line-clamp:2;
            }
            .floatright{
              width: 30px;
            }
            .bodyUl li{
               font-size: 0.9em;
               height: 40px;
               line-height: 40px;
               list-style: none;
             }
             .bodyUl li div:nth-child(1){
               display: none;
             }
             .bodyUl li div:nth-child(2){
               width: 80%;
               text-indent: 1em;
               white-space: nowrap;         /*文本不进行换行*
               overflow: hidden;           /*隐藏溢出文本*
               text-overflow: ellipsis;    /*多出文本使用 ....代替*
             }
             .bodyUl li div:nth-child(3){
               width: 20%;
               text-indent: 1em;
             }  **********************/
            .auto_footer {
                display: block;
                width: 100%;
                height: 13%;
                background: #00283e;
                position: fixed;
                bottom: 0;
            }
            .auto_btn {
                display: block;
                width: 80%;
                height: 60%;
                margin: 0 auto;
                background: #00b0ff;
                border: none;
                color: #fff;
                font-size: 1em;
            }
            .auto_p {
                margin: 0;
                height: 20%;
                width: 100%;
            }
            .app_warp, .app_images {
                position: absolute;
                left: 0;
                top: 0;
            }
            .app_warp {
                z-index: 3;
                width: 100%;
            }
            .app_mask {
                width: 100%;
                height: 100%;
                background: #000;
                opacity: 0.4;
            }
            .app_images {
                width: 100%;
                height: 100%;
                background: url('/static/images/app_zindex_<@spring.messageText "index.text39" "CN"/>.png') no-repeat 60px 20px;
                background-size: 80%;
            }
    }
    @media screen and (max-width: 460px) {
        .headVideo {
            height: 232px;
        }
    }
    @media screen and (max-width: 400px) {
        .app_images {
            background-position: 52px 20px;
        }
        .headVideo {
            height: 202px;
        }
    }
    @media screen and (max-width: 330px) {
        .app_images {
            background-position: 40px 20px;
        }
        .headVideo {
            height: 180px;
        }
    }
    </style>
</head>
<body>
<!-- ****** WEB HEAD****** -->
<header class="header navbar-fixed-top navbar-inverse">
    <div class="container">
        <a class="navbar-brand"><span class="text">
                <img src="https://o5uaa1ha4.qnssl.com/static/images/index/logo.png" style="height: 30px"></span></a>
        <nav class="main-nav navbar-right" role="navigation">
            <!--//navbar-header-->
            <div id="navbar-collapse" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-home">
                    <li class=""><a href="http://www.mindasset.com/user/login"><@spring.messageText "login" "登录"/></a>
                    </li>
                    <li class=""><a class=""
                                    href="http://www.mindasset.com/user/signup"><@spring.messageText "register" "注册"/></a>
                    </li>
                </ul>
                <!--//nav-->
            </div>
            <!--//navabr-collapse-->
        </nav>
        <!--//main-nav-->
    </div>
    <!--//container-->
</header>
<!-- ****** auto   主体****** -->
<section class="auto_container">
    <video controls poster="" class="headVideo">
        <source class="videoplay" src="${classified[0].curricula[0].chapters[0].url}" type="video/mp4">
    </video>
    <aside class="headText">
        <!--  共<span>${curricula.chapters ?size}<span>集&nbsp;•&nbsp; -->
    <!--当前视频的-->
        <span>${play}</span><@spring.messageText "video.play.text1" "次播放"/>&nbsp;•&nbsp;<span>${share}</span><@spring.messageText "video.play.text2" "次分享"/>
    </aside>
    <section class="bodyText">
        <article>
        <!--当前专辑名称-->
            <h2 class="textH2">${classified[0].curricula[0].defaultTitle }</h2>
        <!--当前专辑简介-->
            <p class="textP">${classified[0].curricula[0].defaultIntroduction }</p>
        </article>
    </section>
</section>
    <div class="app_pop" id="app_pop">
        <span class="android-btn down-btn app_down_active"><span class="android_icon"></span>Android</span>
        <span class="ios-btn down-btn"><span class="ios_icon"></span>iOS</span>
        <img class="app_android_png" src='/static/images/app_download_android.png'>
        <img class="app_download_none app_ios_png" src='/static/images/app_download_ios.png'>
        <p><@spring.messageText "video.play.text3" "掃碼下載"/><br/>Infinite Mind APP</p>
    </div>
<!-- ****** auto  尾部****** -->
<footer class="auto_footer">
    <p class="auto_p"></p>
    <button class="auto_btn"><@spring.messageText "video.play.text4" "打开APP查看更多视频"/></button>
</footer>
<div class="app_warp">
    <div class="app_mask"></div>
    <div class="app_images"></div>
</div>
<!-- ****** WEB FOOTER****** -->
<div class="footer">
    <div class="footer-links">
        <div class="footer-links-title">
            <h4><@spring.messageText "index.text40" "友情链接"/></h4>
        </div>
        <div class="footer-links-content">
            <a href='http://angel.mindasset.com/index_<@spring.messageText "index.text39" "CN"/>.html'
               target="_blank"><img src="/static/images/links-mindangel.png"></a>
            <a href='<@spring.messageText "friendlinks.mindbank" "http://www.mindgene.org/download_CN.html" />'
               target="_blank"><img src="/static/images/links-mindbank.png"></a>
            <a href='<@spring.messageText "friendlinks.btc123" "https://www.btc123.com/" />' target="_blank"><img
                    src="/static/images/links-btc123.png"></a>
            <a href='<@spring.messageText "friendlinks.bter" "http://bter.com/" />' target="_blank"><img
                    src="/static/images/links-bter.png"></a>
        </div>
    </div>
    <div class="footer-copyright">Copyright @ 2016 Mind Asset</div>
</div>
<script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
<script type="text/javascript">
$(function(){
        //       var onoff = true;
        // $('#imgclick').on('click',function(){
        //   var myHeight = $('.textP').height();
        //       if(onoff){
        //         $('.textP').css({
        //             'height':'auto',
        //             'overflow':'visible',
        //             'display':'block'
        //         });
        //         $('.floatright').css({
        //             '-moz-transform':'rotate(180deg)',
        //             '-webkit-transform':'rotate(180deg)'
        //         })
        //         onoff = false;
        //       }else{
        //         $('.textP').css({
        //             'height':'myHeight',
        //             'overflow':'hidden',
        //             'display':'-webkit-box'
        //         });
        //         $('.floatright').css({
        //             '-moz-transform':'rotate(0deg)',
        //             '-webkit-transform':'rotate(0deg)'
        //         })
        //         onoff = true;
        //       }
        // })
        // var headvideosrc = $('.videoplay').attr('src');
        // var myvideosrc = $('.videosrc');
        // var titletext = $('.title-text');
        // for(var i=0; i<titletext.length; i++){
        //     var actionsrcbody = myvideosrc[i].getAttribute('actionsrc');
        //       if( headvideosrc == actionsrcbody ){
        //              $('.videosrc').eq(i).addClass("hovercolor");
        //       }
        //  }
        // $(document).on('click','.videosrc',function(){
        //       var _self = $(this);
        //       document.title = _self.find('.title-text').html();
        //       $('.videosrc').removeClass("hovercolor");
        //       $(this).addClass("hovercolor");
        //       // var mySrc = _self.attr("actionsrc");
        //       // $('.headVideo').attr('src',mySrc);
        //       // $('.headVideo').attr('autoplay',true);
        // })
        var myHeight = $(document).height();
        var u = navigator.userAgent;
        var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
        $('.app_warp').css('height', myHeight);
        $('.app_warp').click(function () {
            $(this).hide();
        })
        $(document).on('click', '.auto_btn', function () {
            //var loadDateTime = new Date();
            if (isiOS) {
                // if (isWeiXin()) {
                //     $(window).scrollTop(0);
                //     $('.app_warp').show();
                // }
                    // window.location = 'mindasset://';
                    // setTimeout(function () {
                    //     var timeOutDateTime = new Date();
                    //     if (!loadDateTime || timeOutDateTime - loadDateTime < 2010) {
                    //         window.location = "http://a.app.qq.com/o/simple.jsp?pkgname=com.mindasset.lion";
                    //     }        
                    // },2000);
                window.location = "http://a.app.qq.com/o/simple.jsp?pkgname=com.mindasset.lion";
            }
            else {
                testApp("mindasset://app");
            }
        })
    /*虽然在Js中可以启动某个app，但是并不能判断该app是否安装，启动app需要的时间较长，js中断时间长，如果没安装，js瞬间就执行完毕*/
    function testApp(url) {
        var timeout, t = 1000, hasApp = true;
        setTimeout(function () {
            if (hasApp) {
            }
            else {
                window.location = "http://a.app.qq.com/o/simple.jsp?pkgname=com.mindasset.lion";
            }
            document.body.removeChild(ifr);
        }, 2000)
        var t1 = Date.now();
        var ifr = document.createElement("iframe");
        ifr.setAttribute('src', url);
        ifr.setAttribute('style', 'display:none');
        document.body.appendChild(ifr);
        timeout = setTimeout(function () {
            var t2 = Date.now();
            if (!t1 || t2 - t1 < t + 30) {
                hasApp = false;
            }
        }, t);
    }
    //判断是否是微信浏览器打开。
    function isWeiXin() {
        var ua = window.navigator.userAgent.toLowerCase();
        if (ua.match(/MicroMessenger/i) == 'micromessenger') {
            return true;
        } else {
            return false;
        }
    };
    //扫码下载
    $('.android-btn').on('click',function(){
        $('.down-btn').removeClass('app_down_active');
        $(this).addClass('app_down_active');
        $('.android-btn').find('span').css('background-position','0 -36px');
        $('.ios-btn').find('span').css('background-position','0 -72px');
        $('.app_android_png').removeClass('app_download_none');
        $('.app_ios_png').addClass('app_download_none');
    });
    $('.ios-btn').on('click',function(){
        $('.down-btn').removeClass('app_down_active');
        $(this).addClass('app_down_active');
        $('.android-btn').find('span').css('background-position','0 0px');
        $('.ios-btn').find('span').css('background-position','0 -108px');
        $('.app_ios_png').removeClass('app_download_none');
        $('.app_android_png').addClass('app_download_none');
    });
})
</script>
</body>
</html>