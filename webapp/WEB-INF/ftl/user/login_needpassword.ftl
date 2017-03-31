<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "reset_login_password" "重设登录密码"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/static/css/login/login.css">
<link rel="stylesheet" type="text/css" href="/static/css/login/login_needpassword.css">
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_bill" >
<div class="wrap">
<input type="hidden" class="mystatus" value="">
<header  class="header navbar-inverse">
    <div class="container">
        <a class="navbar-brand" href="/"><i class="icon iconfont icon-mindassetlogo"></i><span>MINDASSET</span>| <@spring.messageText "reset_login_password" "重设登录密码"/> </a>
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
            <div class="rowcenter">
                
                <div class="page-content deal-page-content clearfix">
                    <div class="detail">
                        
                        <div class="title"><@spring.messageText "safety.text26" "您正在为"/><span class="blue"></span><@spring.messageText "safety.text13" "设置登录密码"/></div>
                        <ul>
                            <li>
                                <p class="telphone">
                                    <span></span>
                                    <b><@spring.messageText "safety.text76" "通过绑定手机号"/></b>
                                    <em></em>
                                    <button id="by-phone" class="Modify"><@spring.messageText "safety.text77" "立即修改"/></button>
                                </p>
                            </li>
                            
                        </ul>
                        <div class="warning"><i></i><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></div>
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
<script type="text/javascript" src="/static/js/jQuery.md5.js"></script>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>

<script type="text/alert-template" id="success-html">
<div class="alertInfoBox" id="alertInfoBox">
    <i class="success"></i>
    <h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
    <button class="backto"><@spring.messageText "immediately_login" "立即登录"/></button></div>
</div>
</script>
<!-- 手机设置登录密码 end-->
<script type="text/alert-template" id="by-phone-html">
    <div class="alertInputBox"  id="alert-loadpassword">
        <div class="password">
            <span><@spring.messageText "safety.text30" "新登录密码"/></span>
            <input type="password" placeholder="<@spring.messageText "safety.text31" "请输入6-16位含数字和字母的密码"/>"/>
            <em class="warning">
                <div>
                    <p class="no"><@spring.messageText "safety.text32" "长度在6~16个字符"/></p>
                    <p class="no"><@spring.messageText "safety.text33" "必须包含字母和数字"/></p>
                    <p class="ok"><@spring.messageText "safety.text34" "不允许有空格"/></p>
                </div>
            </em>
            <p class="warning"></p>
        </div>
        <div class="passwordagain">
            <span><@spring.messageText "safety.text84" "确认新登录密码"/></span>
            <input type="password" placeholder="<@spring.messageText "safety.text35" "请确认新登录密码"/>"/>
            <em class="warning"></em>
            <p class="warning"></p>
        </div>
        <div class="captcha">
            <span><@spring.messageText "captcha" "图片验证码"/></span>
            <input type="text" class="captch" name="captcha" placeholder="<@spring.messageText "captcha" "图片验证码"/>" id="input-captcha" />
            <a href="javascript:changeImg();">
              <img id="captcha" src="/user/vaildatecode?ctoken=${ctoken}">
              <input type="hidden" id="ctoken" value="${ctoken}" />
            </a>
            <em class="warning"></em>
            <p class="warning"></p>
        </div>
        <div class="vcode">
            <span><@spring.messageText "safety.text24" "手机验证码"/></span>
            <input type="text"/>
            <input type="button" class="get-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
            <em class="warning"></em>
            <p class="warning"></p>
        </div>
        <div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>
    </div>
    <p class="alertFloor"><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</script>
<script>
    
    $(function(){
        var uid = GetQueryString("UID");
        console.log(uid);
        if( !uid || uid==""){
            window.location.href = '/user/forget';
        }
        $("#bd .detail").find('.title').html('<@spring.messageText "safety.text26" "您正在为"/><span class="blue">'+uid+'</span><@spring.messageText "safety.text13" "设置登录密码"/>')
        //获取验证码
        $(document).on('click','.alertInputBox .get-vcode', function(){
            var self = $(this);
            var captcha = $('.alertInputBox .captcha #input-captcha').val();
            var newPassword = $("#alert-loadpassword").find('.password input[type="password"]');
            var newPasswordagain = $("#alert-loadpassword").find('.passwordagain input[type="password"]');
            $("#alert-loadpassword").find('p.warning').text("");
            
            if( !isLoadPassword(newPassword.val())){
                //$("#alert-loadpassword").find('.password p.warning').text("长度在6~16个字符含字母和数字的密码");
                newPassword.val("").focus();
                newPasswordagain.val("");
                return;
            }
            if(newPassword.val()!=newPasswordagain.val()){
                $("#alert-loadpassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                newPasswordagain.val("").focus();
                return;
            }
            if (captcha==""||captcha==null) {
                $("#alert-loadpassword").find('.captcha p.warning').text('请输入图片验证码');
            } else{
                var ctoken = $('.alertInputBox .captcha #ctoken').val();
                self[0].setAttribute("disabled", true);
                $.ajax({
                    type : "post",
                    url:'/v2/user/auth/find_password_code'
                    ,data:{'phone':uid,'pCode':captcha,'ctoken':ctoken},
                    dataType : "json"
                    ,success:function(msg){
                        changeImg();
                        if(msg.status == 0){
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
                            self[0].removeAttribute("disabled");
                            alertBoxFunc(msg.error.message,"sure",function(){
                                $('.alertInputBox .captcha #input-captcha').val("");
                            });
                        }
                    }
                    ,error:function(err){
                       console.log(err);
                    }
                }); 
            };
            
        });
        
        var vheight = $(window).height();
        //console.log(vheight);
        $(".bd-inner").css('min-height', (vheight-95)+'px');

        $("#by-phone").on('click', function(event) {
            event.preventDefault();
            var content = alertText("#by-phone-html");
            alertFunc({
                title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+uid+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
                contents:content
            })
            $("#alert-loadpassword").on('click','.submit', function(event) {
                var vcode = $("#alert-loadpassword").find('.vcode input[type="text"]');

                var newPassword = $("#alert-loadpassword").find('.password input[type="password"]');
                var newPasswordagain = $("#alert-loadpassword").find('.passwordagain input[type="password"]');
                $("#alert-loadpassword").find('p.warning').text("");
                if(vcode.val()==""){
                    $("#alert-loadpassword").find('.vcode p.warning').text('<@spring.messageText "safety.text85" "请输入正确的手机验证码！"/>');
                    vcode.focus();
                    return;
                }
                if( !isLoadPassword(newPassword.val())){
                    //$("#alert-loadpassword").find('.password p.warning').text("长度在6~16个字符含字母和数字的密码");
                    newPassword.val("").focus();
                    newPasswordagain.val("");
                }
                if(newPassword.val()!=newPasswordagain.val()){
                    $("#alert-loadpassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                    newPasswordagain.val("").focus();
                }
                if(isLoadPassword(newPassword.val())&&vcode.val()!=""&&newPassword.val()==newPasswordagain.val()){
                    var pwd = encodeURIComponent(ENCRYPT.encrypt(newPassword.val()));
                    $.ajax({
                        type: 'post',
                        url: '/v2/user/auth/find_password',
                        data:{
                            'phone':uid,
                            'newPassword': pwd,
                            'code': vcode.val()
                        },
                        success: function(data){
                            if(0 == data.status){
                                $('#alertBox').remove();
                                var contentSuccess = alertText("#success-html");
                                alertFunc({
                                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+uid+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
                                    contents:contentSuccess
                                })
                            }else{
                                alertBoxFunc(data.error.message,'sure');
                            }
                        },
                        fail: function (status) {
                            location.reload();
                        }
                    });
                }
            })
            $("#alert-loadpassword").on('blur','.passwordagain', function(event) {
                var newPassword = $("#alert-loadpassword").find('.password input[type="password"]');
                var newPasswordagain = $("#alert-loadpassword").find('.passwordagain input[type="password"]');
                $("#alert-loadpassword").find('p.warning').text("");
                if( !isLoadPassword(newPassword.val())){
                    //$("#alert-loadpassword").find('.password p.warning').text("长度在6~16个字符含字母和数字的密码");
                    newPassword.val("").focus();
                    newPasswordagain.val("");
                }
                if(newPassword.val()!=newPasswordagain.val()){
                    $("#alert-loadpassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                    newPasswordagain.val("");
                }
            })
        });
    })
</script>
<!-- 手机设置登录密码 end-->

</#macro>

