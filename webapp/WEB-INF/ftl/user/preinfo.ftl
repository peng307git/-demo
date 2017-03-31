<!DOCTYPE html>
<html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir=""
      lang=""
      class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir=""
      lang=""
      class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><@spring.messageText "preinfo.text1" "密码验证"/></title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=201608300932">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
    <script type="text/javascript" src="/static/js/global.js?v=201604261834"></script>
    <script type="text/javascript" src='/static/js/business/preinfo.js?v=201604261834'></script>
   
</head>
<body>
<div class="warp asset-manager">
<#include "common/header.ftl" >
    <div class="warp-container">
        <div class="container">
            <div class="manager-bar clearfix">
                <div class="text-center">
                <@spring.messageText "preinfo.text2" "核心管理"/></div>
                <div class="text-center">
                <@spring.messageText "preinfo.text3" "交易平台"/></div>
            </div>
            <div class="manager-container">
                <div class="left-bar">
                	<#assign deal_page_index=3 >
                    <#include "/decorators/deal_left_bar.ftl" >
                </div>
                <div class="right-bar" style='min-height:600px;'>
                    <div class="manager-changeInfo-box bgwhite wrap-shadow" style="top:160px; left:0;">
                        <div class="title-bg"></div>
                        <h3 class='text-center top30'><@spring.messageText "preinfo.text8" "密码验证"/></h3>
                        <form action="" method="post" id="preinfoform">

                            <div class="input-group width420 center top30">
                                <input type="password" class="form-control" placeholder="<@spring.messageText "preinfo.text9" "密码"/>"
                                       name="password" id="password">
                            </div>
                            <div class='text-center top30'>
                                <button type='button' class='btn-default-black'><@spring.messageText "confirm" "确定"/></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</body>
</html>
