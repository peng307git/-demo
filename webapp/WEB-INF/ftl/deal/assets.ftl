<!DOCTYPE html>
<html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><@spring.messageText "asset.text1" "资产管理"/></title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=201608300932">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
    <script type="text/javascript" src="/static/js/global.js"></script>
    <script type="text/javascript" src='/static/js/business/assets.js'></script>
</head>
<body>
<div class="warp asset-manager">
<#include "/decorators/header.ftl" >
    <div class="warp-container overh">
        <div class="container-bg">
            <div class="container">
                <div class="manager-bar clearfix">
                    <div class="text-center">
                    <@spring.messageText "asset.text2" "核心管理"/></div>
                    <div class="text-center">
                    <@spring.messageText "asset.text3" "交易平台"/></div>
                </div>
                <div class="manager-container">
                    <div class="left-bar">
                       <#assign deal_page_index=4 >
                       <#include "/decorators/deal_left_bar.ftl" >
                    </div>
                    <div class="right-bar" style='min-height:600px;'>
                        <div class="manager-channel-box"></div>
                        <div class="manager-flat-box text-center">
                            <h3 class='text-center'><@spring.messageText "asset.text8" "全球交易平台"/></h3>
                            <ul class="manager-flat-links top40">
                                <li>
                                    <a href="https://www.okcoin.cn/" target="_blank">
                                        <img src="/static/images/kcion.png"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.huobi.com" target="_blank">
                                        <img src="/static/images/fire.png"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.btcc.com" target="_blank">
                                        <img src="/static/images/btcc.png"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.bitstamp.net/" target="_blank">
                                        <img src="/static/images/bitstamp.png"/>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<#include "/decorators/footer.ftl" >
</div>
</body>
</html>
