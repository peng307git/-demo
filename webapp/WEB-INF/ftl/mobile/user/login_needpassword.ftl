<#include "v6/common/base_v6_m.ftl" />
<#macro title>
<@spring.messageText "reset_login_password" "重置登录密码"/>
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
</script>

<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/static/v6/css/mobile/newPassword.css">
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
    <input type="hidden" class="mystatus" value="">
    <div id="bd">
       
    	<div class="bd-container clearfix ">
    		<div class="simcenter">
	    		<!--注册第0步开始-->
	    		<div class="formbox step0">
                    <div class="login-title">
                        <@spring.messageText "reset_login_password" "重置登录密码"/>
                    </div>
                    <div class='line'></div>

                   <div class="title"><@spring.messageText "safety.text26" "您正在为"/><span class="blue"></span><@spring.messageText "safety.text13" "设置登录密码"/></div>

                    <!--登陆密码-->
                    <div class='lable-text password'><@spring.messageText "safety.text30" "新登陆密码"/>：</div>
                    <div class="inputbox passwordbox">
                        <input type="password" id="password"/>
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>
                    
                    <!--再次输入登陆密码-->
                    <div class='lable-text password'><@spring.messageText "newpassword_newpassword_again" "再次输入新登陆密码"/>：</div>
                    <div class="inputbox passwordbox">
                        <input type="password" id="passwordagain" />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>
                    
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
                        
                    <!--短信验证码-->
                    <div class='lable-text msgcode'><@spring.messageText "signup_message_code" "短信验证码"/>：</div>
                    <div class="signup-msgcodebox">
                        <div class="left">
                            <input type="text" class="captch" name="pCode" id="msgcode" />
                        </div>
                        <div class="right" id="vcodebox">
                            <input type="button" class="get-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    <div class="trip"  id="vcode-trip"></div>
                    <input type="hidden" id="referer" value="${referer}" />
			        

                    <div class="alertTrip">
                        <span>手机号不能为空</span>
                    </div>
                    <div class="btn-login">
                        <input class="button" type="submit" id="sure" value='<@spring.messageText "safety.text3" "确定"/>' />
                    </div>
                    <div class='how-get'><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/>
                    </div>
			    </div>

                <div class="success step1">
                    <div class="login-title">
                        <@spring.messageText "reset_login_password" "重置登录密码"/>
                    </div>
                    <div class='line'></div>

                   <div class="title"><@spring.messageText "safety.text26" "您正在为"/><span class="blue"></span><@spring.messageText "safety.text13" "设置登录密码"/></div>
                   <div class="svg-icon">
                        <img src='/static/v6/images/mobile/icon_success.png'><span><@spring.messageText "newpassword_set_success" "设置成功"/></span>
                   </div>
                    <div class="btn-login btn-1">
                        <input class="button" type="submit" id="login" value='<@spring.messageText "immediately_login" "立即登录"/>' />
                    </div>
                    <div class='how-get'><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/>
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
        
        'vcodeNullError': '<@spring.messageText "login_pic_vcode_null_error" "图片验证码不能为空"/>',
        'vcodeError': '<@spring.messageText "login_pic_error" "图片验证码输入有误"/>',
        'withdrawal.text20':'<@spring.messageText "withdrawal.text20" "秒后重新发送"/>',
        'getsmscaptcha':'<@spring.messageText "getsmscaptcha" "获取短信验证码"/>',
        'signup_pic_code_null_error':'<@spring.messageText "signup_pic_code_null_error" "图片验证码不能为空"/>',
        'newpassword_msgcode_error':'<@spring.messageText "signup_msg_code_null_error" "短信验证码不能为空"/>',
        'signup_login_password_null_error':'<@spring.messageText "signup_login_password_null_error" "登录密码不能为空"/>',
        'signup_login_password_module':'<@spring.messageText "signup_login_password_module" "登录密码为6-16位字母和数字，请重新输入"/>',
        'signup_login_password_again_null':'<@spring.messageText "signup_login_password_again_null" "请再次输入登录密码"/>',
        'newpassword_newpassword_again':'<@spring.messageText "newpassword_newpassword_again" "请再次输入新登录密码"/>',
        'signup_double_password_notonly_error':'<@spring.messageText "signup_double_password_notonly_error" "两次登录密码不一致，请重新输入"/>',
        'newpassword_msgcode_error':'<@spring.messageText "newpassword_msgcode_error" "短信验证码错误"/>',
        'withdrawal.text20':'<@spring.messageText "withdrawal.text20" "秒后重新发送"/>',
        'getsmscaptcha':'<@spring.messageText "getsmscaptcha" "获取短信验证码"/>',
        

    });
    require.config({
    　　 baseUrl: "/",
    　　 paths: {
            "jquery":'/static/js/jquery-1.11.2.min',
            "jsencrypt":"/static/js/jsencrypt"
            
    　　}
    }); 

    require(['static/v6/js/mobile/newPassword']);
</script>
</#macro>
