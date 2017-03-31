<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "download_center" "下载中心"/>
</#macro>

<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/download.css" />
</#macro>
<#macro body>
<#assign nav_page="download" >
<#assign nav_sub_page="buythen" >
 <div class="wrap">
  <#include "common/header.ftl" >
    <div class="donwloadwarp">
        <section>
            <h1> 智慧银行v1.0.0发布 </h1>
            <p> 开启智慧核心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;迎接精彩未来</p>
            <div>
                <a class="mac" href=""><i></i><span>MAC版下载</span></a>
                <a class="win" href=""><i></i>win64位下载</a>
                <a class="win" href=""><i></i>win32位下载</a>
            </div>
            <footer>版本：v1.0.0</footer>
        </section>
         <section>
            <div class="appsbox">
                <h1>应用下载<i></i></h1>
                <div class="clearfix">
                    <div class="app iphone">
                        <img src="/static/images/download/QRcodeiPhone.png" alt="">
                        <a href=""><i></i>iPhone版下载</a>
                    </div>
                    <div class="app android">
                        <img src="/static/images/download/QRcodeAndroid.png" alt="">
                        <a href=""><i></i>Android版下载</a>
                    </div>
                </div>
           </div>
           <a class="instructions" href="">查看APP使用说明 >></a>
        </section>
         <section>
            <div class="mindlink">
                <h1>Mind link 设备使用说明<i></i></h1>
                <div class="videobox">
                    <video id="myVideo" width="100%" poster="https://o5uaa1ha4.qnssl.com/static/images/index/fund-video.jpg" controls="">
                       <source src="https://o4we6sxpt.qnssl.com/angel2.mp4" type="video/mp4">
                       <object type="application/x-shockwave-flash" name="player" data="https://o5uaa1ha4.qnssl.com/static/images/GrindPlayer.swf" width="100%" height="480" id="player" style="visibility: visible;"><param name="allowFullScreen" value="true"><param name="allowScriptAccess" value="always"><param name="bgcolor" value="#000000"><param name="flashvars" value="src=https://o4we6sxpt.qnssl.com/app_beta.mp4&amp;autoPlay=false"></object>
                    </video>
                </div>
            </div>
        </section>
    </div>
  <#include "/decorators/footer.ftl" >
</div>
</#macro>
<#macro footerjs>
<script>
    $(function(){
        changeHeight();
        function changeHeight(){
            var windowHight = $(window).height();
            $(".donwloadwarp section").height(windowHight-120)
        }
    })
</script>
</#macro>