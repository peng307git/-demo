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
    <title><@spring.messageText "mind_mine" "智慧矿场"/></title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script src="/static/js/global.js" type="text/javascript"></script>
    <script type="text/javascript" src='/static/js/business/mine_null.js'></script>

</head>
<body>
<div class="warp asset-manager">
<#include "common/header.ftl" >
    <div class="warp-container">
        <div class="container-bg">
            <div class="mine-null-box">
            <@spring.messageText "mine.text2" "您还没有购买产品，请先购买产品！"/>
            </div>
        </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</body>
</html>


























