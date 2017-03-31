<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "login" "登录"/>
</#macro>
<#macro head>
<script>
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
<link rel="stylesheet" type="text/css" href="/static/css/login/login.css">
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
<input type="hidden" class="mystatus" value="">
<header  class="header navbar-inverse">
    <div class="container">
        <a class="navbar-brand"  href="/"><i class="icon iconfont icon-mindassetlogo"></i><span>MINDASSET</span> | <@spring.messageText "login" "登录"/> </a>
        <nav class="main-nav navbar-right" role="navigation">
            <div id="navbar-collapse" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-home">
                    <li >
                        <a class="data-toggle" data-toggle='dropdown' href="javascript:void(0)">
                            <@spring.messageText "language" "语言"/>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" id='language_menu'>
                            <li><a href="${request.contextPath}?locale=en_US" >English</a></li>
                            <li><a href="${request.contextPath}?locale=zh_CN" >中文简体</a></li>
                            <li><a href="${request.contextPath}?locale=zh_TW" >中文繁體</a></li>
                        </ul>
                    </li>
                    <li class=""><a href="/user/login"><@spring.messageText "login" "登录"/></a></li>
                    <li class=""><a class="" href="/user/signup"><@spring.messageText "register" "注册"/></a></li>
                </ul>
                <!--//nav-->
            </div>
            <!--//navabr-collapse-->
        </nav>
        <!--//main-nav-->
    </div>
    <!--//container-->
</header>

    <div id="bd">
    	<div class="bd-inner clearfix">
    		<div class="simcenter">
	    		<div class="login-title">
	    			<@spring.messageText "login" "登录"/>
	    		</div>
	    		<div class="formbox">
			        <@spring.messageText "user_id" "用户名"/>：
			        <div class="inputbox usernamebox">
			        	<select  class="country-code" id="countryCode" >

			        	</select>
			        	<input class="only-number" type="text" id="txt_username" placeholder="<@spring.messageText "signup_new.text11" "输入您注册的手机号码"/>"/><i></i>
			        </div>
			        <@spring.messageText "password" "密码"/>：
                    <div class="inputbox passwordbox">
                        <input type="password" id="txt_password" placeholder="<@spring.messageText "password" "密码"/>"/><i></i>
                    </div>
                    <@spring.messageText "captcha" "图片验证码"/>：
                    <div class="inputbox login-vcodebox">
                        <input type="text" class="captch" name="pCode" placeholder="<@spring.messageText "captcha" "图片验证码"/>" id="input-captcha" />
                        <img id="captcha" onclick="changeImg()" src="/user/vaildatecode?ctoken=${ctoken}" />
                        <input type="hidden" id="ctoken" value="${ctoken}" />
                    </div>
                    <input type="hidden" id="referer" value="${referer}" />
			        <div class="checker">
			        	<input type="checkbox" id="ck_rmbUser" checked="checked"/><@spring.messageText "remember_password" "记住密码"/>
			        	<a href="/user/forget"><@spring.messageText "forget_password" "忘记密码？"/></a>
			        </div>
			        <input class="button" type="submit" id="loginBtn" value="<@spring.messageText "login" "登录"/>" />
			    </div>
	    	</div>
	    </div>
    </div>
    <div class="footer">
        <div class="footer-copyright">Copyright © 2016 Mind Asset. All Rights Reserved </div>
    </div>
</div>
</#macro>

<#macro footerjs>
<script src='/static/js/jquery.cookie.js'></script>
<script src='/static/js/business/addressCountry.js'></script>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script src='/static/js/business/loginNew20160913.js'></script>
</#macro>
