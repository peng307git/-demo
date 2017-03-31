<#include "v6/common/base_v6_m.ftl" />
<#macro title>
<@spring.messageText "reset_login_password" "重设登录密码"/>
</#macro>
<#macro head>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script>
    //根据屏幕宽度自动设置html根节点的font-size值默认1rem=100px;
    (function (doc, win) {
            var docEl = doc.documentElement,
             resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
               recalc = function () {
                  var clientWidth = docEl.clientWidth;
                  if (!clientWidth) return;
                    docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                };
                // Abort if browser does not support addEventListener
              if (!doc.addEventListener) return;
              win.addEventListener(resizeEvt, recalc, false);
              doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

    function getCookie(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length == 2) return parts.pop().split(";").shift();
    }

    (function(){
        var isLangSet = localStorage.getItem('isLangSet') || 0;
        if(!isLangSet){
            localStorage.setItem('isLangSet', 1);
            var lang = getCookie('locale');
            console.log(lang);
            var sysLang = navigator.language;
            if(sysLang && (['zh-CN', 'zh-TW', 'en-US'].indexOf(sysLang) > -1)){

            }else{
                sysLang = 'en-US';
            }
            sysLang = sysLang.replace('-','_')
            if(lang != sysLang){
                location.replace('/?locale='+sysLang);
            }
        }
    })();
</script>

<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/static/v6/css/mobile/forget.css">
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
    <input type="hidden" class="mystatus" value="">
    <div id="bd">
       
    	<div class="bd-container clearfix ">
    		<div class="simcenter">
	    		<div class="formbox step0">
                    <div class="login-title">
                        <@spring.messageText "reset_login_password" "重设登录密码"/>
                    </div>
                    <div class='line'></div>

                    <div class="warning"><@spring.messageText "signup_new.text10" "请输入您需要重置密码的用户名"/></div>
                   
                    <!--手机号码-->
                    <div class='lable-text username'><@spring.messageText "user_id" "用户名"/>：</div>
			        <div class="inputbox usernamebox">
    		        	<select  class="country-code" id="countryCode" >
    		        	</select>
                        <span class='icon-down'></span>
                        <div class="oneline"></div>
    		        	<input class="only-number" type="text" id="txt_username"/>
                        <span class="icon-phone"></span>
			        </div>
                    <div class="trip" id="phone-trip"></div>
                    <!--图片证码-->
                    <div class='lable-text vcode'><@spring.messageText "captcha" "图片验证码"/>：</div>
                    <div class="signup-vcodebox">
                        <div class="left">
                            <input type="text" class="captch" name="pCode"  id="input-captcha" />
                        </div>
                        <div class="right">
                            <img id="captcha" height="100%" onclick="changeImg()" src="/user/vaildatecode?ctoken=${ctoken}" />
                        </div>
                        <input type="hidden" id="ctoken" value="${ctoken}" />
                    </div>
                    <div style="clear: both;"></div>
                    <div class="trip"  id="vcode-trip"></div>
                    <input type="hidden" id="referer" value="${referer}" />
                        

                    <div class="alertTrip">
                        <span>手机号不能为空</span>
                    </div>
                    <div class="btn-login">
                        <input class="button" type="submit" id="loginBtn" value="<@spring.messageText "next" "下一步"/>" />
                    </div>
			    </div>
	    	</div>
	    </div>
    </div>
</div>
</#macro>

<#macro footerjs>

<script src="/static/v6/js/lib/require.js"></script>

<script>
    I18N.addLang({
        'phoneNullError': '<@spring.messageText "login_phone_null_error" "手机号不能为空"/>',
        'vcodeNullError': '<@spring.messageText "login_pic_vcode_null_error" "图片验证码不能为空"/>',
        'vcodeError': '<@spring.messageText "login_pic_error" "图片验证码输入有误"/>',
        'forget_phone_noregist':'<@spring.messageText "forget_phone_noregist" "该手机号未注册"/>'
    });
    require.config({
    　　 baseUrl: "/",
    　　 paths: {
            "jquery":'/static/js/jquery-1.11.2.min',
            "jsencrypt":"/static/js/jsencrypt"
    　　}
    }); 
    require(['static/v6/js/mobile/forget']);
</script>
</#macro>
