<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "register.login" "注册成功"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/signup_success.css">
</#macro>

<#macro body>

<div class="warp">

    <div id="warp-container">


            <div class="login-bg"></div>

	        <div class="login-header">
	             <div class="login-banner"></div>
	             <a href="/" class="login-logo"></a>
	        </div>

	         <div class="res_bg text-center">
	               <h3 class="login">
	                     <a href="http://www.mindasset.com/" class="back-home"></a>
	                     <span>></span>
	                    <@spring.messageText "register.login" "注册成功"/>
	                </h3>
	         </div>

	         <div class="res_body text-center">   <!-- 恭喜你注册成功 -->
                       <span class="body_radius"> </span>
                       <span class="body_font"><@spring.messageText "register.text1" "恭喜您注册成功！"/></span>
             </div>
	         
             <div class="res_btn text-center">
                    <span class="btn_int"><@spring.messageText "register.text4" "默认15s自动跳转"/></span>
                    <button type="button" class="btn" id="btnon"> <@spring.messageText "register.text2" "返回首页"/></button>
             </div>

             <div class="res_foot">
                  <span></span>
                  <@spring.messageText "register.text3" "战略合作网站"/>
                  <div class="foot_div">
                        <a href="javascript:;"></a>
                  </div>
             </div>
           <input type="hidden" id="mobile" value="${mobile}">

      </div>
      
	</div>
            <footer class="footer">
                    Copyright @ 2016 Mind Asset
             </footer>   
             
</#macro>

<#macro footerjs>
<script type="text/javascript">
   
          var timer = null;
          var str = $("#mobile").val();
              lodong();

          $(".foot_div a").click(function(){
                 this.href="https://www.btc123.com/user/reg?mobile="+str;
              });

          timer = setTimeout(function(){
                  window.location.href = "/";
           },15000); 


       function lodong(){

            $("#btnon").click(function(){
                  
                 window.location.href = "/";

                 clearTimeout(timer);
            });
       };


</script>
</#macro>
