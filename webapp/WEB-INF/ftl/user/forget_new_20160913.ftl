<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "reset_login_password" "重设登录密码"/>
</#macro>
<#macro head>
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
        <a class="navbar-brand"  href="/" ><i class="icon iconfont icon-mindassetlogo"></i><span>MINDASSET</span> | <@spring.messageText "reset_login_password" "重设登录密码"/></a>
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
            <@spring.messageText "reset_login_password" "重设登录密码"/>
          </div>
          <div class="warning"><i></i><@spring.messageText "signup_new.text10" "请输入您需要重置密码的用户名"/></div>
          <div class="formbox">
              <@spring.messageText "user_id" "用户名"/>：
              <div class="inputbox usernamebox">
                <select  class="country-code" id="countryCode" >

                </select>
                <input class="only-number" type="text" id="txt_username" placeholder="<@spring.messageText "signup_new.text11" "输入您注册的手机号码"/>"/><i></i>
              </div>
              <div class="inputbox captchabox">
                <input type="text" class="captch" name="captcha" placeholder="<@spring.messageText "captcha" "图片验证码"/>" id="input-captcha" />
                <a href="javascript:changeImg();">
                  <img id="captcha" src="/user/vaildatecode?ctoken=${ctoken}">
                  <input type="hidden" id="ctoken" value="${ctoken}" />
                </a>
              </div>
              <input class="button" type="submit" id="loginBtn" value="<@spring.messageText "next" "下一步"/>" />
          </div>
        </div>
      </div>
    </div>
    <div class="footer">
        <div class="footer-copyright">Copyright © 2016 Mind Asset. All Rights Reserved</div>
    </div>
</div>
</#macro>

<#macro footerjs>
<script src='/static/js/business/addressCountry.js'></script>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script src='/static/js/business/forgetNew20160913.js'></script>
<script type="text/javascript">

</script>
</#macro>