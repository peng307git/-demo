<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta content="telephone=no" name="format-detection">
    <title><@spring.messageText "app.notice.text2" "公告详情"/></title>
    <link rel="stylesheet" type="text/css" href="/static/css/app_notice.css">
    <style type="text/css">
        a:link{ 
            color:#00B0FF;
        } 
        a:visited{
            color:#0079B0;
        }
    </style>
</head>
<body>
    <header class="appHead">
            <img id="return_img" class="return_head" src="/static/images/nocite_icon.png">
            <@spring.messageText "app.notice.text2" "公告详情"/>
    </header>
   <!--  公告详情 -->
    <div class="details">
        <#if notice?exists>
            <div class="details-main">
                <h4>${notice.title}</h4>
                <h5 class="myTime"></h5>
                <h6></h6>
                <div class="details-text">
                ${notice.notice}
                </div>
            </div>
            <input type="hidden" class="en_time" value='${notice.releaseTime?string("HH:mm MM-dd-yyyy")}'>
            <input type="hidden" class="cn_time" value='${notice.releaseTime?string("yyyy-MM-dd HH:mm")}'>
        </#if>
    </div>
    <script type="text/javascript" src="/static/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
            //判断终端系统
            var u = navigator.userAgent;
            var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
            //返回公告列表页面
            function myback(){
                    if (isiOS) {
                            self.location=document.referrer;
                    }else{
                            obj.backTo();
                    }
            }
            //返回主页面
            function returnHome(){
                    if (isiOS) {
                            iosback();
                    }else{
                            obj.back();
                    }
            }
            //取url后面参数的值
            function GetQueryString(name){  
                    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if(r!=null)return  unescape(r[2]); return null;
            }
            var returnPage = GetQueryString("returnpage");
            //点击返回
            $('#return_img').on('click',function(){
                    if(returnPage == '666'){
                            myback();
                    }else{
                            returnHome();
                    }
            })
            //改变日期格式
            var lang = document.title;
            var iTime = '';
                if(lang == 'Notice Details' ){
                    iTime = $('.en_time').val();
                }
                else{
                    iTime = $('.cn_time').val();
                }
            $('.myTime').html(iTime);
    </script>
</body>
</html>