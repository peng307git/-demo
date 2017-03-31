
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
      }
      body{
        background: #1d1d26;
      }
      a{
        display: block;
        margin-top: 10px;
        width: 200px;
        height: 20px;
        background: #19bcd4;
      }
      .main_auto{
        width: 100%;
        height: 100%;
        text-align: center;
        background:url(/static/images/video_app_bg.png) no-repeat;
        background-size: cover;
      }
      .main_auto img{
        position: relative;
        width: 120px;
        height: 120px;
      }
      .main_auto h4{
        padding-top: 120px;
        padding-bottom: 50px;
        color: #fff;
      }
      .main_auto span{
        position: absolute;
        color: #fff;
        top: 320px;
        left: 74px;
      }
      .main_auto .androidspan{
        left: 210px;
      }
      .auto_footer,.app_warp{
        display: none;
      }
      .iosapp{
       left: 50px;
      }
      .androidapp{
        left: 70px;
      }
      .iosapp_1{
        right: 120px;
        top: 600px;
      }
      .androidapp_1{
        top: 1300px;
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
}
@media screen and (max-width: 400px) {
         
}
@media screen and (max-width: 330px) {
          
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
        <h4>长按识别二维码下载APP</h4>
          <img class="iosapp" src="/static/images/app_from_ios.png">
          <span>ios版下载</span>
          <img class="androidapp" src="/static/images/app_from_android.png">
          <span class="androidspan">android版下载</span>
          <img class="iosapp_1" src="/static/images/app_from_ios.png">
         <img class="androidapp_1" src="/static/images/app_from_android.png">
        </div>
        <a href="http://www.mindasset.com/">点击去下载</a>
        <a href="https://itunes.apple.com/us/app/infinite-mind/id1097680754?mt=8">点击下载ios</a>
        <a href="http://app.mindasset.com/?v=1.0.15">点击 下载安桌</a>
       <!-- ****** auto  尾部****** -->
        
<!-- ****** WEB FOOTER****** -->
<div class="footer">
    <div class="footer-links">
        <div class="footer-links-title">
            <h4>友情链接</h4>
        </div>
        <div class="footer-links-content">
            <a href='http://angel.mindasset.com/index_<@spring.messageText "index.text39" "CN"/>.html' target="_blank"><img src="/static/images/links-mindangel.png" ></a>
            <a href='<@spring.messageText "friendlinks.mindbank" "http://www.mindgene.org/download_CN.html" />' target="_blank"><img src="/static/images/links-mindbank.png" ></a>
            <a href='<@spring.messageText "friendlinks.btc123" "https://www.btc123.com/" />' target="_blank"><img src="/static/images/links-btc123.png" ></a>
            <a href='<@spring.messageText "friendlinks.bter" "http://bter.com/" />' target="_blank"><img src="/static/images/links-bter.png" ></a>
        </div>
    </div>
    <div class="footer-copyright">Copyright @ 2016 Mind Asset</div>
</div>
</body>
</html>
