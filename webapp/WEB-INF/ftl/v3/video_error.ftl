<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/bootstrap.min.css?v=201604261834">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=20160824">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css?v=2016062031231">
    <link rel="stylesheet" type="text/css" href="/static/css/styles-5.css?v=201600824">
    <title>智慧视界</title>
<style type="text/css">
      html,body{
        height: 100%;
      }
      body{
        background: #1d1d26;
      }
      .main_auto{
        width: 100%;
        height: 76%;
        text-align: center;
      }
      .main_auto img{
        position: relative;
        margin-top:260px; 
      }
      .main_auto h4{
        margin-top: 20px;
        color: #fff;
        opacity: 0.5;
      }
      .auto_footer,.app_warp{
        display: none;
      }
      /*＊＊＊＊＊*/
@media screen and (max-width: 960px) {
           body,h4,img{
            padding: 0;
            margin: 0;
           }
           .header,.footer{
            display: none;
           }
           .main_auto{
            height: 100%;
            background:url(/static/images/video_app_bg.png) no-repeat;
            background-size: cover;
           }
           .auto_footer{
            display: block;
            width: 100%;
            height: 13%;
            background: #00283e;
            position: fixed;
            bottom: 0;
          }
          .auto_btn{
            display:block;
            width: 80%;
            height: 60%;
            margin: 0 auto;
            background: #00b0ff;
            border: none;
            color: #fff;
            font-size: 1em;
          }
          .auto_p{
            margin: 0;
            height: 20%;
            width: 100%;
          }
           .app_warp,.app_images{
            position: absolute;
            left: 0;
            top: 0;
          }
          .app_warp{
            z-index: 2;
            width: 100%;
            display: none;
          }
          .app_mask{
            width: 100%;
            height: 100%;
            background: #000;
            opacity: 0.4;
          }
          .app_images{
            width: 100%;
            height: 100%;
            background:url(/static/images/app_zindex.png) no-repeat 60px 20px;
            background-size: 80%;
          }
}
@media screen and (max-width: 400px) {
          .app_images{
            background:url(/static/images/app_zindex.png) no-repeat 53px 20px;
            background-size: 80%;
          }
}
@media screen and (max-width: 330px) {
          .app_images{
            background:url(/static/images/app_zindex.png) no-repeat 40px 20px;
            background-size: 80%;
          }
}
</style>
</head>
<body>
<!-- ****** WEB HEAD****** -->
<header  class="header navbar-fixed-top navbar-inverse">
    <div class="container">
        <a class="navbar-brand" ><span class="text">
                <img src="https://o5uaa1ha4.qnssl.com/static/images/index/logo.png" style="height: 30px"></span></a>
        <nav class="main-nav navbar-right" role="navigation">
            <!--//navbar-header-->
            <div id="navbar-collapse" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-home">
                    <li class=""><a href="http://www.mindasset.com/user/login"><@spring.messageText "login" "登录"/></a></li>
                    <li class=""><a class="" href="http://www.mindasset.com/user/signup"><@spring.messageText "register" "注册"/></a></li>
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
        <div class="main_auto">
          <img src="/static/images/video_404pc.png">
          <h4>天呐，视频找不到了...</h4>
        </div>
       <!-- ****** auto  尾部****** -->
        <footer class="auto_footer">
                 <p class="auto_p"></p>
                 <button class="auto_btn">打开APP查看更多视频</button>

        </footer>
        <div class="app_warp">
              <div class="app_mask"></div>
              <div class="app_images"></div>
        </div>
<!-- ****** WEB FOOTER****** -->
<div class="footer">
    <div class="footer-links">
        <div class="footer-links-title">
            <h4>友情链接</h4>
        </div>
        <div class="footer-links-content">
            <a href='<@spring.messageText "friendlinks.mindangel" "http://angel.mindasset.com/?locale=zh_CN" />' target="_blank"><img src="/static/images/links-mindangel.png" ></a>
            <a href='<@spring.messageText "friendlinks.mindbank" "http://www.mindgene.org/download_CN.html" />' target="_blank"><img src="/static/images/links-mindbank.png" ></a>
            <a href='<@spring.messageText "friendlinks.btc123" "https://www.btc123.com/" />' target="_blank"><img src="/static/images/links-btc123.png" ></a>
            <a href='<@spring.messageText "friendlinks.bter" "http://bter.com/" />' target="_blank"><img src="/static/images/links-bter.png" ></a>
        </div>
    </div>
    <div class="footer-copyright">Copyright @ 2016 Mind Asset</div>
</div>
   <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
<script type="text/javascript">
    $(function(){
          var myHeight = $(document).height();
          $('.app_warp').css('height',myHeight);
          $('.app_warp').click(function(){
                $(this).hide();
          })
          $(document).on('click','.auto_btn',function(){
                var u = navigator.userAgent;
                //var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
                var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
                if(isiOS){
                     if ( isWeiXin() ) {
                          $(window).scrollTop(0);
                          $('.app_warp').show();
                      }
                      else{
                          window.location = "http://a.app.qq.com/o/simple.jsp?pkgname=com.mindasset.lion";
                      }
                }
                else{    
                          testApp("mindasset://app");
                }
          })
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
        },t);  
    }
    //判断是否是微信浏览器打开。
    function isWeiXin() {
              var ua = window.navigator.userAgent.toLowerCase();
              if (ua.match(/MicroMessenger/i) == 'micromessenger') {
                return true;
              } else {
                return false;
              }
    }
</script>
</body>
</html>