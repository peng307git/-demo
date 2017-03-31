<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1, user-scalable=no">
    <title>Login Invitation</title>
<style type="text/css">
     html,body{
        padding: 0;
        margin: 0;
        height: 100%;
        color: #fff;
    }
    h1,h2{
        padding: 0;
        margin: 0;
    }
    .main{
        width: 100%;
        height: 100%;
        text-align: center;
        background: url('/static/images/app_yaoqing_bg.png') no-repeat;
        background-size: 100% 100%;
    }
    .main h1{
        font-size: 2em;
        padding-top: 35%;
        padding-bottom: 0.5em;
    }
    .main .text-color{
        color: #00b0ff;
    }
    .main h2{
        font-weight: normal;
        font-size: 1.2em;
    }
    .auto_btn{
        width: 70%;
        padding: 1.5em 0;
        position: absolute;
        font-size: 0.6em;
        bottom: 25%;
        left: 15%;
        background: #00b0ff;
        border-radius: 30px;
    }
    @media screen and (max-width: 320px) {
        .main h1{
            font-size: 1.4em;
        }
        .main h2{
            font-size: 0.8em;
        }
        .auto_btn{
            padding: 1em 0;
        }
    }
    @media screen and (min-width: 321px) and (max-width: 413px) {
        .main h1{
            font-size: 1.6em;
        }
        .main h2{
            font-size: 1em;
        }
    }
    @media screen and (min-width: 414px) and (max-width: 639px) {
        .main h1{
            font-size: 2em;
        }
        .main h2{
            font-size: 1.3em;
        }
    }
</style>
</head>
<body>
    <div id='wx_pic' style='margin:0 auto;display:none;'>
        <img src='/static/images/video_logo.jpg' />
    </div>
    <section class="main">
        <h1>Begin Your <span class="text-color">Mind</span> Journey!</h1>
        <h2>Commone World Common Wealth</h2>
        <div class="auto_btn">APP Download</div>
    </section>
<script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
    <script type="text/javascript">

        $('.auto_btn').on('click',function(){
                var u = navigator.userAgent;
                //var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
                var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
                if(isiOS){
                    if( isWeiXin() ){
                         window.location = "http://a.app.qq.com/o/simple.jsp?pkgname=com.mindasset.lion";
                    }
                    else{
                         window.location = "https://itunes.apple.com/us/app/infinite-mind/id1097680754?mt=8";
                    }
                }
                else{
                         window.location = "http://a.app.qq.com/o/simple.jsp?pkgname=com.mindasset.lion";
                }
          })
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
