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
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=201608300932">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    
    <script>
</script>
</head>
<body>
<div class="warp asset-manager">
    <div class="warp-container">
            <div class='recharge-box2'>
                <div class="container">
                    <h3 class="recharge-title text-center">
                        <div class="recharge-title-top"></div>
                        <div class="recharge-title-bot"></div>
                  	 <@spring.messageText "notice.text1" "网站公告"/>                      </h3>
                     
                     <ul id="lier">
                        <li><section style="display: block;"><h3>${title}</h3><div>${content}</div></section></li>
					</ul>   
                </div>
    </div>
<#include "/decorators/footer.ftl" >

</div>
</body>
</html>