<!DOCTYPE html>
<html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="" lang="" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="" lang="" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><@spring.messageText "notice.text1" "公告"/></title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
    <script type="text/javascript" src="/static/js/global.js"></script>
    <!-- plugin/js -->
    <script type="text/javascript" src="/static/js/plugin/jquery.zclip.min.js"></script>
</head>
<body>
<div class="warp asset-manager">
<#include "common/header.ftl" >
    <div class="warp-container">
            <div class='recharge-box2'>
                <div class="container">
                    <h3 class="recharge-title text-center">
                        <div class="recharge-title-top"></div>
                        <div class="recharge-title-bot"></div>
                  	 <@spring.messageText "notice.text1" "公告"/>                      </h3>
                    <table class="yigouTable" cellpadding="0" cellspacing="0">
                    <tr class='order-th'>
                        <th>主题</th>
                        <th>详情</th>
                        <th>公告时间</th>
                    </tr
                    
                    <#if noticeList?exists >
                       <#list noticeList as notice>  
                      				 <tr>
                      				  	<a href="">
                                         <td>${notice.title}  </td>
                                          <td>${notice.message}  </td>
                                          <td>${notice.createTime}  </td>
                                          </a>
                                      </tr>
						</#list>  
                       </#if>
                                    </table>
                </div>
    </div>
<#include "/decorators/footer.ftl" >

</div>
</body>
</html>
