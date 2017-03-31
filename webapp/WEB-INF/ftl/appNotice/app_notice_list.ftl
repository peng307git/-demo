<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta content="telephone=no" name="format-detection">
    <title><@spring.messageText "app.notice.text1" "公告"/></title>
    <link rel="stylesheet" type="text/css" href="/static/css/app_notice.css">
</head>
<body>
    <header class="appHead"><img class="head_return" onclick='myback()' src="/static/images/nocite_icon.png"><@spring.messageText "app.notice.text1" "公告"/></header>

    <section class="app-container">
         <ul class="app_main"></ul>
    </section>
    <input type="hidden" class="jessonid" value="${sessionid}">
<script type="text/javascript" src='/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
<script type="text/javascript">
function myback(){
            var u = navigator.userAgent;
            //var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
            var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
            if (isiOS) {
                    iosback();
            }else{
                    obj.back();
            }
}
 var jessonid = $('.jessonid').val();
     document.cookie="JSESSIONID_COOKIE="+jessonid;
$(function(){
            var myrueryTime = 0;
        //一进入页面就进行的请求
        $.ajax({
            type:"GET",
            url:"/api/notice/list",
            dataType : "json",
            success:function(data){
                var iHtml = "";
                if(data.status == 0){
                    var datar = data.data;
                    myrueryTime = datar.queryTime;    //返回的时间戳
                    var arrynotice = datar.notices;   
                    $(".app_main").html( ajaxHtml(arrynotice,iHtml));
                }
            }
        })
        //根据滚动条的位置来进行加载下一页数据
        $(window).scroll(function(){
            var lastheight = $('.app_main').height();
            var windowheight = $(window).height();
            var scrtop = $(window).scrollTop();
            var lasttop = lastheight-windowheight-100;
            if(myrueryTime > 0 ){
                if(scrtop > lasttop){
                    $.ajax({        
                        type:"GET",
                        url:"/api/notice/list?queryTime="+myrueryTime,
                        dataType : "json",
                        success:function(data){
                            var iHtml = "";
                            if(data.status == 0){
                                var datar = data.data;
                                myrueryTime = datar.queryTime;    //返回的时间戳
                                var arrynotice = datar.notices; 
                                $(".app_main").append( ajaxHtml(arrynotice,iHtml) );
                            }
                        }
                    })
                }
            }
            //console.log('滚动位置 '+scrtop+'  主体高度-窗口高度 '+lasttop )
        })
        /********填充内容*********/
        function ajaxHtml(arrynotice,iHtml){
                var lang = document.title;
                var strTime = '';
                for(var i=0; i<arrynotice.length; i++){
                        if( lang == 'Notice' ){
                            strTime = arrynotice[i].display_time.split('-');
                            strTime = strTime[1]+'-'+strTime[2]+'-'+strTime[0]; 
                        }
                        else{
                            strTime = arrynotice[i].display_time;
                        }
                        if(arrynotice[i].is_read == 0){
                                iHtml +='<li>'+
                                            '<div class="opct-bg">'+
                                                '<p></p>'+
                                            '</div>'+
                                            '<a class="noticea" href="/api/notice/detail/'+arrynotice[i].id+
                                            // ';jsessionid='+jessonid+
                                                '?returnpage=666">'+
                                            '<div class="main">'+         
                                                '<h3><span class="title-text">'+arrynotice[i].title+
                                                '</span><span class="bg-red-main"><span class="bg-red"></span></span>'+
                                                '</h3>'+
                                                '<p class="head-text">'+arrynotice[i].summary+'</p>'+
                                                '<p class="foot-text">'+
                                                    '<span>'+strTime+'</span>'+ 
                                                    '<span class="right-span"><@spring.messageText "app.notice.text3" "查看详情"/><i class="bg-right">'+
                                                    '</i></span>'+
                                                '</p>'+
                                             '</div>'+
                                            '</a>'+
                                        '</li>';
                             }else{
                                iHtml +='<li>'+
                                            '<div class="opct-bg">'+
                                                '<p></p>'+
                                            '</div>'+
                                            '<a class="noticea" href="/api/notice/detail/'+arrynotice[i].id+
                                            // ';jsessionid='+jessonid+
                                                '?returnpage=666">'+
                                            '<div class="main">'+         
                                                '<h3 class="main-h3-title">'+arrynotice[i].title+
                                                '</h3>'+
                                                '<p class="head-text">'+arrynotice[i].summary+'</p>'+
                                                '<p class="foot-text">'+
                                                    '<span>'+strTime+'</span>'+ 
                                                    '<span class="right-span"><@spring.messageText "app.notice.text3" "查看详情"/><i class="bg-right">'+
                                                    '</i></span>'+
                                                '</p>'+
                                            '</div>'+
                                            '</a>'+
                                        '</li>';
                             }  
                    }
                    return iHtml;
        }
})
</script>
</body>
</html>