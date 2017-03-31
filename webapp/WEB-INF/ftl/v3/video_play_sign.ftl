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
            padding: 0;
        }

        body {
            background: url(/static/images/video_app_bg.png) no-repeat;
            background-size: cover;
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
            text-indent: 2em;
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
            color: #fff;
            width: 100%;
            line-height: 1.5em;
        }

        /*＊＊＊＊＊*/
        @media screen and (max-width: 960px) {
            body, ul, li, h2 {
                padding: 0;
                margin: 0;
            }

            .header, .footer {
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
                height: auto;
            }

            .headText {
                font-size: 0.8em;
            }

            .bodyText .textH2 {
                font-size: 1em;
                height: 30px;
                line-height: 30px;
            }

            .floatright {
                width: 30px;
            }

            .bodyText .textP {
                font-size: 0.75em;
            }

            .bodyText {
                width: 94%;
                margin: 0 auto;
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
    <!--当前视频-->
        <span>${play }</span>次播放&nbsp;•&nbsp;<span>${share }</span>次分享
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

</body>
</html>