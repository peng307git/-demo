<#include "v6/common/base_v6_m.ftl" />
<#macro title>
<@spring.messageText "register" "注册"/>
</#macro>
<#macro head>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script>
    var wheight;   
    var is= false;//用来解决浏览器自动返回按钮bug
    //根据屏幕宽度自动设置html根节点的font-size值默认1rem=100px;
    (function (doc, win) {
            var docEl = doc.documentElement,
             resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
               recalc = function () {
                    if(!wheight){
                      var clientWidth = docEl.clientWidth;
                      if (!clientWidth) return;
                      docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                      wheight = docEl.clientHeight;
                      win.document.height = wheight;
                        console.log(wheight);
                    };
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
<link rel="stylesheet" type="text/css" href="/static/v6/css/mobile/signup.css">
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
                        <@spring.messageText "signup_phone_signup" "手机号码注册"/>
                    </div>
                    <div class='line'></div>

                    <!--邀请码-->
                    <div class='lable-text icode'><@spring.messageText "invite_code" "邀请码"/>：</div>
                    <div class="inputbox invitecodebox">
                        <input type="text" id="invite_code" />
                        <span class="icon-invite_code"></span>
                    </div>
                    <div class="trip"  id="icode-trip"></div>
                    
                    <!--手机号码-->
                    <div class='lable-text username'><@spring.messageText "mobile" "手机号码"/>：</div>
			        <div class="inputbox usernamebox">
    		        	<select  class="country-code" id="countryCode" >
    		        	</select>
                        <span class='icon-down'></span>
                        <div class="oneline"></div>
    		        	<input class="only-number" type="text" id="txt_username"  />
                        <span class="icon-phone"></span>
			        </div>
                    <div class="trip" id="phone-trip"></div>
                    
                    <!--图片证码-->
                    <div class='lable-text vcode'><@spring.messageText "captcha" "图片验证码"/>：</div>
                    <div class="signup-vcodebox">
                        <div class="left">
                            <input type="text"  class="captch" name="pCode"  id="input-captcha" />
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
                        <input type="hidden" id="ctoken" value="${ctoken}" />
                    </div>
                    <div style="clear: both;"></div>
                    <div class="trip"  id="vcode-trip"></div>
                    <input type="hidden" id="referer" value="${referer}" />

			        

                    <div class="alertTrip">
                        <span>手机号不能为空</span>
                    </div>
                    <div class="btn-login">
                        <input class="button" type="submit" id="nextstep" value="<@spring.messageText "next" "下一步"/>" />
                    </div>
                    <div class='how-get'><@spring.messageText "signup_new.text2" "如何获取邀请码：邀请码可向已经拥有主站账号的好友索要"/></div>
			    </div>
                <!--注册第0步结束-->

                <!--第一步开始-->   
                <div class="formbox step1">
                    <div class="login-title">
                        <@spring.messageText "signup_base_info_set" "基本信息设置"/>
                    </div>
                    <div class='line'></div>
                    
                    <!--昵称-->
                    <div class='lable-text nick'><@spring.messageText "mine.text17" "昵称"/>：</div>
                    <div class="nicknamebox">
                        <div class="left">
                            <input type="text" class="captch"  id="nickname"  placeholder='<@spring.messageText "nickname.rule" "请输入2~16个中文、英文或数字"/>'/>
                        </div>
                        <div class="right">
                        </div>
                    </div>
                    <div class="trip"  id="icode-trip"></div>
                    
                    <!--登陆密码-->
                    <div class='lable-text password'><@spring.messageText "signup_login_password" "登录密码"/>：</div>
                    <div class="inputbox passwordbox">
                        <input type="password" id="password" onpaste="return false"  placeholder='<@spring.messageText "signup_sex_password" "6-16位字母和数字"/>' />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>
                    
                    <!--再次输入登陆密码-->
                    <div class='lable-text password'><@spring.messageText "signup_login_password_agin" "再次输入登录密码"/>：</div>
                    <div class="inputbox passwordbox">
                        <input type="password" id="passwordagain" onpaste="return false" />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>

                    <input type="hidden" id="referer" value="${referer}" />
                        
                    <div class="alertTrip">
                        <span>手机号不能为空</span>
                    </div>
                    <div class="btn-login">
                        <input class="button" type="submit" id="baseInfoNext" value="<@spring.messageText "next" "下一步"/>" />
                    </div>
                
                </div>
        
        <!--注册第一步结束-->

        <!--注册第二步开始-->
                <div class="formbox step2">
                    <div class="login-title">
                        <@spring.messageText "signup_safe_info_set" "安全信息设置"/>
                     </div>
                    <div class='line'></div>
                    
                    <!--支付密码-->
                    <div class='lable-text password'><@spring.messageText "signup_pay_password" "支付密码"/>：</div>
                    <div class="inputbox paypasswordbox">
                        <input type="password" id="paypassword" onpaste="return false"  placeholder='<@spring.messageText "signup_pay_password_tips" "6位数字支付密码"/>' />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>
                    
                    <!--再次输入支付密码-->
                    <div class='lable-text password-agin'><@spring.messageText "signup_pay_password_again_null" "再次输入支付密码"/>：</div>
                    <div class="inputbox paypasswordbox">
                        <input type="password" onpaste="return false"  id="paypasswordagain" />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>

                    <!--密保邮箱-->
                    <div class='lable-text email'><@spring.messageText "signup_password_email" "密保邮箱"/>：</div>
                    <div class="inputbox emailbox">
                        <input type="text" id="email" />
                        <span class="icon-password"></span>
                    </div>
                    <div class="trip"  id="password-trip"></div>

                    <input type="hidden" id="referer" value="${referer}" />
                        
                    <div class="alertTrip">
                        <span>手机号不能为空</span>
                    </div>
                    <div class="btn-login">
                        <input class="button" type="submit" id="signupBtn" value="<@spring.messageText "signup_open_mind" "开启 Mind Asset"/>" />
                    </div>
                
                </div>
                <!--注册第二步结束-->
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
        'phoneOrPasswordError': '<@spring.messageText "login_user_or_password_error" "用户名或密码错误"/>',
        'passwordNullError': '<@spring.messageText "login_password_nul_error" "密码不能为空"/>',
        'vcodeNullError': '<@spring.messageText "login_pic_vcode_null_error" "图片验证码不能为空"/>',
        'vcodeError': '<@spring.messageText "login_pic_error" "图片验证码输入有误"/>',
        'signup_phone_ishave':'<@spring.messageText "signup_new.text1" "该手机号已注册，立即登录"/>',
        'withdrawal.text20':'<@spring.messageText "withdrawal.text20" "秒后重新发送"/>',
        'getsmscaptcha':'<@spring.messageText "getsmscaptcha" "获取短信验证码"/>',
        'signup_icode_null_error':'<@spring.messageText "signup_icode_null_error" "邀请码不能为空"/>',
        'signup_phone_null_error':'<@spring.messageText "signup_phone_null_error" "手机号不能为空"/>',
        'signup_pic_code_null_error':'<@spring.messageText "signup_pic_code_null_error" "图片验证码不能为空"/>',
        'signup_msg_code_null_error':'<@spring.messageText "signup_msg_code_null_error" "短信验证码不能为空"/>',
        'signup_nick_null_error':'<@spring.messageText "signup_nick_null_error" "昵称不能为空"/>',
        'signup_nick_module':'<@spring.messageText "signup_nick_module" "昵称为2-16个中文、英文或数字，请重新输入"/>',
        'signup_nick_ishave':'<@spring.messageText "signup_nick_ishave" "该昵称已被占用"/>',
        'signup_login_password_null_error':'<@spring.messageText "signup_login_password_null_error" "登录密码不能为空"/>',
        'signup_login_password_module':'<@spring.messageText "signup_login_password_module" "登录密码为6-16位字母和数字，请重新输入"/>',
        'signup_login_password_again_null':'<@spring.messageText "signup_login_password_again_null" "请再次输入登录密码"/>',
        'signup_double_password_notonly_error':'<@spring.messageText "signup_double_password_notonly_error" "两次登录密码不一致，请重新输入"/>',
        'signup_pay_password_null_error':'<@spring.messageText "signup_pay_password_null_error" "支付密码不能为空"/>',
        'signup_pay_password_module':'<@spring.messageText "signup_pay_password_module" "支付密码为6位数字，请重新输入"/>',
        'signup_pay_password_again_null':'<@spring.messageText "signup_pay_password_again_null" "请再次输入支付密码"/>',
        'signup_double_pay_password_notonly':'<@spring.messageText "signup_double_pay_password_notonly" "两次支付密码不一致，请重新输入"/>',
        'signup_email_null_error':'<@spring.messageText "signup_email_null_error" "密保邮箱不能为空"/>',
        'signup_email_error':'<@spring.messageText "signup_email_error" "邮箱格式错误"/>',
        'signup_email_ishave':'<@spring.messageText "signup_email_ishave" "该邮箱已被占用"/>',
        'signup_pay_password_tips':'<@spring.messageText "signup_pay_password_tips" "支付密码为6位数字"/>',
        'login_note_title':'<@spring.messageText "login_note_title" "提示"/>',
        'immediately_login':'<@spring.messageText "immediately_login" "立即登录"/>'

    });
    require.config({
    　　 baseUrl: "/",
    　　 paths: {
            "jquery":'/static/js/jquery-1.11.2.min',
            "jsencrypt":"/static/js/jsencrypt"
    　　}
    }); 
    require(['static/v6/js/mobile/signup']);
</script>
</#macro>
