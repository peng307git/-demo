<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "register" "注册"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/login/login.css">
<link rel="stylesheet" type="text/css" href="/static/css/login/signup_new_20160913.css">
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
<input type="hidden" class="mystatus" value="">
<header  class="header navbar-inverse">
    <div class="container">
        <a class="navbar-brand"  href="/"><i class="icon iconfont icon-mindassetlogo"></i><span>MINDASSET</span> | <@spring.messageText "register" "注册"/></a>
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
            <@spring.messageText "register" "注册"/>
          </div>
          <div class="step_tab">
            <div class="step active">
              <span><i>1</i></span>
              <@spring.messageText "create_account" "创建账号"/>
            </div>
            <div class="step">
              <span><i>2</i></span>
              <@spring.messageText "set_information" "设置信息"/>
            </div>
            <div class="step">
              <span><i>3</i></span>
              <@spring.messageText "safety.text41" "完成"/>
            </div>
          </div>
          <div>
            <div class="formbox">
                <@spring.messageText "invite_code" "邀请码"/>：
                <div class="inputbox invitecodebox">
                  <input type="text" id="invite_code" placeholder="<@spring.messageText "invite_code" "邀请码"/>"/><i></i>
                </div>
                <@spring.messageText "mobile" "手机号码"/>：
                <div class="inputbox usernamebox">
                  <select  class="country-code" id="countryCode" >
                  </select>
                  <input class="only-number" type="text" id="txt_username" placeholder="<@spring.messageText "signup_new.text11" "输入您要注册的手机号码"/>"/><i></i>
                  <p class="prompt"><@spring.messageText "signup_new.text1" "该手机号已注册"/>，<a href="/user/login"><@spring.messageText "immediately_login" "立即登录"/></a></p>
                </div>
                <@spring.messageText "captcha" "图片验证码"/>:
                <div class="inputbox captchabox">
                  <input type="text" class="captch" name="captcha" placeholder="<@spring.messageText "captcha" "图片验证码"/>" id="input-captcha" />
                  <a id="capbox" href="javascript:void(0);">
                    <img id="captcha" src="/user/vaildatecode?ctoken=${ctoken}">
                    <img id="capbg" src="/static/images/reloadimage.png">
                    <input type="hidden" id="ctoken" value="${ctoken}" />
                  </a>
                </div>
                <@spring.messageText "safety.text24" "手机验证码"/>
                <div class="inputbox vcodebox" id="vcodebox">
                  <input type="text" placeholder='<@spring.messageText "safety.text24" "手机验证码"/>'/>
                  <input type="button" class="get-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
                </div>
                <input class="button" type="submit" id="nextstep" value="<@spring.messageText "next" "下一步"/>" />
                <p><@spring.messageText "signup_new.text2" "如何获取邀请码：邀请码可向已经拥有主站账号的好友索要"/></p>
            </div>
            <div class="formbox">
              <i class="required">*</i><@spring.messageText "mine.text17" "昵称"/>:
              <div class="inputbox nicknamebox">
                <input type="text" id="nickname" placeholder='<@spring.messageText "nickname.rule" "请输入2~16个中文、英文或数字"/>'/><i></i>
              </div>
              <i class="required">*</i><@spring.messageText "signup_new.text4" "设置账号登录密码"/>（<@spring.messageText "signup_new.text6" "用于账号的登录"/>）:
              <div class="inputbox passwordbox password">
                <input type="password" id="password" placeholder="<@spring.messageText "password" "密码"/>"  onpaste="return false" onselectstart="return false"/><i></i>
                <em class="warning">
                  <div>
                    <p class="no"><@spring.messageText "safety.text32" "长度在6~16个字符"/></p>
                    <p class="no"><@spring.messageText "safety.text33" "必须包含字母和数字"/></p>
                    <p class="ok"><@spring.messageText "safety.text34" "不允许有空格"/></p>
                  </div>
                </em>
              </div> 
              <div class="inputbox passwordbox">
                <input type="password" id="passwordagain" placeholder="<@spring.messageText "confirm_password" "再次输入密码"/>" onpaste="return false" onselectstart="return false"/><i></i>
              </div> 
              <i class="required">*</i><@spring.messageText "safety.text8" "设置支付密码"/>（<@spring.messageText "signup_new.text5" "用于账号进行交易时，使用的密码"/>）:
              <div class="inputbox paypasswordbox">
                <input  class="NamberPassword" type="password" id="paypassword" placeholder="<@spring.messageText "safety.text21" "请输入6位数字密码"/>" onpaste="return false" onselectstart="return false"/><i></i>
              </div> 
              <div class="inputbox paypasswordbox">
                <input  class="NamberPassword" type="password" id="paypasswordagain" placeholder="<@spring.messageText "confirm_password" "再次输入密码"/>" onpaste="return false" onselectstart="return false"/><i></i>
              </div> 
              <i class="required">*</i><@spring.messageText "safety.text15" "设置邮箱"/>（<@spring.messageText "signup_new.text7" "用于密码的找回等安全设置"/>）:
              <div class="inputbox emailbox">
                <input type="text" id="email" placeholder="<@spring.messageText "safety.text54" "邮箱地址"/>"/><i></i>
              </div>
              <input class="button" type="submit" id="signupBtn" value="<@spring.messageText "register" "注册"/>" />
              <p><@spring.messageText "wave.index.text1" "温馨提示"/>：<br/><@spring.messageText "signup_new.text8" "为了您的账号安全，请牢记您填写的账号密码信息，并且填写您常用的邮箱作为密码找回工具。请勿随意泄露账号信息以及密保邮箱账号信息，以防被不法分子利用。"/></p>
            </div>
            <div class="formbox successbox">
              <h3><i class="success"></i> <@spring.messageText "signup_success.text1" "恭喜您，注册成功！"/></h3>
              <a class="button" id="goindex" href="/" ><@spring.messageText "signup_success.text2" "返回首页"/></a>
              <p class="deadline"><span class="blue" id="deadline">15 s </span><@spring.messageText "signup_success.text3" "后自动跳转至首页"/></p>
              <div class="brline"></div>
              <ol>
                <li><@spring.messageText "signup_success.text4" "您可以前往认购中心购买"/> <a href="/deal/buy_link">Mindlink<@spring.messageText "signup_success.text5" "设备"/></a> <@spring.messageText "signup_success.text6" "或下载"/>app</li>
                <li><@spring.messageText "signup_success.text7" "更多安全设置请前往"/> <a href="/v2/user/safety/into"><@spring.messageText "signup_success.text8" "安全中心"/></a> </li>
                <li><@spring.messageText "signup_success.text9" "查看"/> <a href="/static/landing_zh_CN.html">app<@spring.messageText "signup_success.text10" "操作说明"/></a> </li>
              </ol>
              <div class="appbox clearfix">
                <div class="app android">
                  <img src="/static/images/login/android.png" alt="">
                  <i>&nbsp</i><@spring.messageText "topbar.android_download" "Android版APP下载"/>
                </div>
                <div class="app ios">
                  <img src="/static/images/login/ios.png" alt="">
                  <i>&nbsp</i><@spring.messageText "topbar.ios_download" "IOS版APP下载"/>
                </div>
              </div>
              <div class="frindlink">
                <p><@spring.messageText "signup_new.text9" "战略合作网站"/></p>
                <a href="https://www.btc123.com/" target="new" class="btc123"><img src="/static/images/login/btc123.png" alt=""></a>
              </div>
            </div>
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
<script src='/static/js/jquery.cookie.js'></script>
<script src='/static/js/business/addressCountry.js'></script>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script src='/static/js/business/signupNew20160913.js'></script>
<script type="text/javascript">
$(function(){
  $("#capbg").hide();
  $("#capbox").on('click', function(event) {
    event.preventDefault();
    changeImg();
    $("#capbg").hide();
  });
  checkPassword(".formbox .password");
//获取验证码
  $("#vcodebox").on('click','.get-vcode', function(){
    var self = $(this);
    var telephone = $("#txt_username").val();
    var _areaCode=$("#countryCode").find("option:selected").val();
    var invitationCode = $("#invite_code").val();
    var tel_num=$.trim(telephone);
    if(invitationCode == "" || invitationCode == null){
        alertBoxFunc("请填写邀请码","sure");
        return;
    }
    if(tel_num==""||tel_num==null){
      alertBoxFunc("请输入手机号","sure");
      return;
    }
    _areaCode=$.trim(_areaCode);
    var telephone_code='';
    if(_areaCode==86)    //中国
    {
       telephone_code=tel_num;
    }else{
       telephone_code='+'+_areaCode+" "+tel_num;
    }
    var captcha = $('.captchabox  #input-captcha').val();
    
    if (captcha==""||captcha==null) {
      alertBoxFunc("请输入图片验证码","sure");
    } else{
      var ctoken = $('.captchabox #ctoken').val();
      self[0].setAttribute("disabled", true);
      $.ajax({
        type : "post",
        url:'/v2/user/auth/invitation_code'
        ,data:{'phone':telephone_code,'pCode':captcha,'ctoken':ctoken,'invitationCode':invitationCode},
        dataType : "json"
        ,success:function(msg){
          if(msg.status == 0){
            $("#capbg").show();
            $(".simcenter .usernamebox .prompt").hide();
            var wait = 60;
            self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
            var timer = setInterval(function(){
              if(0 == wait){
                clearInterval(timer);
                self[0].removeAttribute("disabled");
                self.val('<@spring.messageText "getsmscaptcha" "获取短信验证码"/>');
              }else{
                self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                wait--;
              }
            }, 1000);
            self.parent().find('input[type="text"]').focus();
          }else{
            changeImg();
            self[0].removeAttribute("disabled");
            if (msg.error.code == 4) {
              $(".simcenter .usernamebox .prompt").show();
            }else{
              alertBoxFunc(msg.error.message,"sure",function(){
                $('.captchabox  #input-captcha').val("");
              });
            }
          }
        }
        ,error:function(err){
            console.log(err);
        }
      }); 
    };
  });
$('.usernamebox .only-number').on('keypress',function(){
  $(".simcenter .usernamebox .prompt").hide();
})
$('.usernamebox #countryCode').on('change',function(){
  $(".simcenter .usernamebox .prompt").hide();
})
//paypassword
$("#paypassword").on('blur', function(event) {
    var  password = $("#paypassword");
    if(password.val()==""||password.val()==null){
    		password.focus();
    }else if(!isNamberPassword(password.val())){
      password.val("");
      $("#paypasswordagain").val("");
      alertBoxFunc("<@spring.messageText "safety.text21" "请输入6位数字密码"/>","sure");
    }
});

})
</script>

</#macro>

