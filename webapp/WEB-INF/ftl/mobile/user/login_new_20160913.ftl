<#include "v6/common/base_v6_m.ftl" />
<#macro title>
<@spring.messageText "login" "登录"/>
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
                    
                    if(document.activeElement.tagName=="INPUT" || document.activeElement.tagName=="TEXTAREA") {
                                window.setTimeout(function() {
                                 document.activeElement.scrollIntoViewIfNeeded();
                         },0);
                    }
                }
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
<link rel="stylesheet" type="text/css" href="/static/v6/css/mobile/login.css">
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
<input type="hidden" class="mystatus" value="">
    <div id="bd">
    	<div class="bd-container clearfix">
    		<div class="simcenter">
	    		<div class="login-title">
	    			<@spring.messageText "login" "登录"/>
	    		</div>
                <div class='line'></div>
	    		<div class="formbox">
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

			        <div class='lable-text password'><@spring.messageText "password" "密码"/>：</div>
                    <div class="inputbox passwordbox">
                        <input type="password" onpaste="return false"  id="txt_password" />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>
                    <div class='lable-text vcode'><@spring.messageText "captcha" "图片验证码"/>：</div>
                    <div class="login-vcodebox">
                        <div class="left">
                            <input type="text" onfocus="textfocus(this)" onblur="textblur(this)"  class="captch" name="pCode"  id="input-captcha" />
                        </div>
                        <div class="right">
                            <img id="captcha" onclick="changeImg()" height="100%" src="/user/vaildatecode?ctoken=${ctoken}" />
                        </div>
                        <input type="hidden" id="ctoken" value="${ctoken}" />
                    </div>
                    <div style="clear: both;"></div>
                    <div class="trip"  id="phone-trip"></div>
                    <input type="hidden" id="referer" value="${referer}" />
			        <div class="checker">
                        <div class="left">
                            <input type="checkbox" id="ck_rmbUser" checked="checked"/>
                            <span class='memo'><@spring.messageText "remember_password" "记住密码"/></span>
                        </div>
                        <div class="right">
                            <a href="/user/forget"><@spring.messageText "forget_password" "忘记密码？"/></a>
                        </div>
			        </div>
                    <div style="clear: both;"></div>
                    <div class="alertTrip">
                        <span>手机号不能为空</span>
                    </div>
                    <div class="btn-login">
                        <button class="button"  id="loginBtn"><@spring.messageText "login" "登录"/>
                        </button>
                    </div>
			    </div>
                <div class="no-login-trip" id = 'noLogin'>
                    <span class="zh"><@spring.messageText "login_no_account" "还没账户"/>？</span><span onclick='goSignUp()' 
                    class='now-zc'>
                    <@spring.messageText "login_now_register" "立即注册"/>
                        
                    </span>
                </div>
	    	</div>
	    </div>
    </div>
    <div class="footer">
    </div>
</div>
</#macro>

<#macro footerjs>
<script src="/static/v6/js/lib/require.js"></script>

<script>
    I18N.addLang({
        'phoneNullError': '<@spring.messageText "login_phone_null_error" "手机号不能为空"/>',
        'phoneOrPasswordError': '<@spring.messageText "login_user_or_password_error" "用户名或密码错误"/>',
        'passwordNullError': '<@spring.messageText "login_password_nul_error" "密码不能为空"/>',
        'vcodeNullError': '<@spring.messageText "login_pic_vcode_null_error" "图片验证码不能为空"/>',
        'vcodeError': '<@spring.messageText "login_pic_error" "图片验证码输入有误"/>'
    });

    require.config({
    　　 baseUrl: "/",
    　　 paths: {
            "jquery":'/static/js/jquery-1.11.2.min',
            "jsencrypt":"/static/js/jsencrypt"
    　　}
    }); 
    require(['static/v6/js/mobile/mobileLogin']);
</script>
</#macro>
