<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "safety.text1" "账户"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/safety.css"/>
  <link rel="stylesheet" type="text/css" href="/static/css/shippingAddress.css">
</#macro>

<#macro body>
    <#assign nav_page="user" >
    <#assign nav_sub_page="user_safety" >
<div class="wrap">
    <#include "common/header.ftl" >
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title">
                <h2><@spring.messageText "account.info.text1" "个人中心"/></h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                <div class="col-m">
                    <div class="m-wrap">
                        <div class="evaluate clearfix" id="evaluate">
                            
                        </div>
                        <div class="detail">
                            <h3><@spring.messageText "safety.text94" "安全设置"/></h3>
                            <ul>
                                <li>
                                    <div class="telphone per">
                                            <span></span>
                                            <b><@spring.messageText "safety.text4" "绑定手机"/></b>
                                    <#if user.telephone??>
                                            <div class="emer"><@spring.messageText "safety.text5" "已绑定手机"/>: ${user.telephone} 

                                                <div class="ier"><strong><@spring.messageText "safety.text100" "选择验证方式"/></strong>
                                                    <div class="box">
                                                        <b id="dophone"><@spring.messageText "safety.text101" "手机验证"/>
                                                            <i></i>
                                                            <input type="hidden" value="0">
                                                        </b>
                                                        <p><@spring.messageText "safety.text102" "提现，修改密码，及安全设置时用以收取验证短信"/></p>
                                                        <b id="dogoogle"><@spring.messageText "safety.text103" "谷歌验证"/>
                                                        <#if user.googleKey ?exists >
                                                            <i></i><a href="javascript:void(0);" class="blue" id="checkgoogle"><@spring.messageText "safety.text104" "查看"/></a>
                                                            <input type="hidden" value="0">
                                                        <#else>
                                                            <a href="javascript:void(0);" class="blue" id="set_googlecode"><@spring.messageText "safety.text12" "设置"/></a>
                                                            <input type="hidden" value="0">
                                                        </#if>
                                                        </b>
                                                        <p><@spring.messageText "safety.text105" "提现，修改密码，及安全设置时用以输入谷歌验证码。下载"/> <a href="http://shouji.baidu.com/software/3832652.html" class="blue" target="new">Android</a> / <a href="https://itunes.apple.com/cn/app/google-authenticator/id388497605?mt=8" class="blue" target="new">IOS</a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="button" href="/v2/user/safety/settelphone"><@spring.messageText "safety.text10" "修改"/></a>
                                        </div>
                                    <#else> 
                                            <em class="warning"><@spring.messageText "safety.text6" "未绑定手机"/></em>
                                            <button><@spring.messageText "safety.text7" "绑定"/></button>
                                        </div>
                                    </#if>
                                </li>
                                <li>
                                    <p class="paypassword">
                                        <span></span>
                                        <b><@spring.messageText "safety.text8" "设置支付密码"/></b>
                                        <#if user.payPassword?? >
                                            <em><@spring.messageText "safety.text9" "已设置"/></em>
                                            <button id="set-paypassword"><@spring.messageText "safety.text10" "修改"/></button>
                                        <#else>
                                            <em class="warning"><@spring.messageText "safety.text11" "未设置"/></em>
                                               <button id="set-paypassword"><@spring.messageText "safety.text12" "设置"/></button> 
                                        </#if>
                                    </p>
                                </li>
                                <li>
                                    <p class="loadpassword">
                                        <span></span>
                                        <b><@spring.messageText "safety.text13" "设置登录密码"/></b>
                                        <em><@spring.messageText "safety.text9" "已设置"/></em>
                                        <button  id="change-loadpassword"><@spring.messageText "safety.text10" "修改"/></button>
                                    </p>
                                </li>
                                <li>
                                    <#if user.questioned >
                                        <p class="securityquestion">
                                            <span></span>
                                            <b><@spring.messageText "safety.text14" "设置密保问题"/></b>
                                            <em><@spring.messageText "safety.text9" "已设置"/></em>
                                            <button id="change-question"><@spring.messageText "safety.text10" "修改"/></button>
                                        </p>
                                    <#else>
                                        <p class="securityquestion">
                                            <span></span>
                                            <b><@spring.messageText "safety.text14" "设置密保问题"/></b>
                                            <em class="warning"><@spring.messageText "safety.text11" "未设置"/></em>
                                            <button id="set-question"><@spring.messageText "safety.text12" "设置"/></button>
                                        </p>
                                    </#if>
                                </li>
                                <li>
                                    <p class="setemail">
                                        <span></span>
                                        <b><@spring.messageText "safety.text15" "设置邮箱"/></b>
                                        <#if user.email?? >
                                            <em><@spring.messageText "safety.text16" "已设置验证邮箱"/>: ${user.email}</em>
                                            <button id="set-email"><@spring.messageText "safety.text10" "修改"/></button> 
                                        <#else>
                                            <em class="warning"><@spring.messageText "safety.text17" "未设置验证邮箱"/></em>
                                            <button id="set-email"><@spring.messageText "safety.text12" "设置"/></button>
                                        </#if>
                                    </p>
                                </li>
                                <li>
                                    <p class="setaddress">
                                        <span></span>
                                        <b><@spring.messageText "safety.text18" "设置收货地址"/></b>
                                        <#if user.address>
                                            <em><@spring.messageText "safety.text19" "已设置收货地址"/>: ${user.address}</em>
                                            <button id="set-address"><@spring.messageText "safety.text10" "修改"/></button>
                                        <#else> 
                                            <em class="warning"><@spring.messageText "safety.text20" "未设置收货地址"/></em>
                                            <button id="set-address"><@spring.messageText "safety.text12" "设置"/></button>
                                        </#if>
                                    </p>
                                </li>
                                <!-- <li>
                                    <p class="set_google_validator">
                                        <span></span>
                                        <b>设置谷歌验证</b>
                                        <#if user.address>
                                            <em>已设置谷歌验证 ${user.googleKey}</em>
                                            <button id="set_google_validator">修改</button>
                                        <#else>
                                            <em class="warning">未设置谷歌验证</em>
                                            <button id="set_google_validator">设置</button>
                                        </#if>
                                    </p>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-s">
                    <#include "common/user_side_nav.ftl" >
                </div>
            </div>

        </div>
    </div>
    <#include "/decorators/footer.ftl" >
</div>
</#macro>


<#macro footerjs>
<script type="text/javascript" src="/static/js/jQuery.md5.js"></script>
<script type="text/javascript" src="/static/js/libin.js"></script>
<script type="text/javascript" src="/static/js/business/addressCountry.js"></script>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<script type="text/javascript" src="/static/js/business/shippingAddress.min.js"></script>
<!-- <script type="text/javascript" src="/static/js/business/popupWindow.js?v=201608311711"></script> -->
<script>
	function updateLevel(){
		var levelArry=["low","low", "moderate", "high"]
		$.get('/v2/user/security_level', function(data){
			var number = Math.floor(data.level/2);
			var levelText = levelArry[number];
			var langImg = langType();
			if(langImg == 'en'){
				levelText = levelText + '-us';
			}
			var htmlLevel = '<span class="level '+levelText+'"></span><p><span class="blue">'+"${user.telephone}"+'</span> '+data.info+' </p>'
			$("#evaluate").html(htmlLevel)
		});
	};
	updateLevel();
    $(document).on('click','#evaluate .blue', function(){
        var self = $(this);
        //console.log(self.attr('idname')+":"+self.html());
        $(document).find('#'+self.attr('idname')).trigger("click");
    })
	//获取验证码
	$(document).on('click',' .get-vcode', function(){
		var self = $(this);
		self[0].setAttribute("disabled", true);
		$.get('/v2/user/get_code', function(data){
			if(0 == data.status){
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
				alertBoxFunc(data.error.message, "sure");
			}
		});
	});
	//获取emaillink
	$(document).on('click','.alertInputBox .get-emaillink', function(){
		var self = $(this);
		self[0].setAttribute("disabled", true);
		$.get('/v2/user/email/check', function(data){
			if(0 == data.status){
				var wait = 200;
				self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
				var timer = setInterval(function(){
					if(0 == wait){
						clearInterval(timer);
						self[0].removeAttribute("disabled");
						self.val('<@spring.messageText "safety.text60" "重新获取"/>');
					}else{
						self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
						wait--;
					}
				}, 1000);
                self.parent().find('input[type="text"]').focus();
			}else{
				self[0].removeAttribute("disabled");
				alertBoxFunc(data.error.message, "sure");
			}
		});
	});
    
    $(".ier strong").click(function(){
        $(".ier .box").toggle();
    });
    //获取手机、谷歌验证安全状态
    $(function(){
        $.ajax({
            url: '/v2/user/safety/status',
            type: 'GET',
            data: {param1: 'value1'},
            success:function(result){
                if(0 == result.status){
                    reloadStatus(result.data);
                    IbtnToggle("#dophone","/v2/user/v_code/status");
                    IbtnToggle("#dogoogle","/v2/user/g_code/status");
                }else{
                    alertBoxFunc(result.error.message,"sure");
                }
            },
            fail: function (status) {
                location.reload();
            }
        })

        function IbtnToggle(id,url){
            $(document).on('click',id+' i', function(){
                var self = $(this);
                var status ="";
                var i = self.parent().find('input').val();
                var content = '<div class="vcode" id="switch_code"><span><@spring.messageText "safety.text24" "手机验证码"/>: </span><input type="text"/><input type="button" class="get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>"></div>';
                var successText = "";
                if (i == "1") {
                    var otherI="";
                    status ="CLOSE";
                    if(id=="#dophone"){
                        otherI=$("#dogoogle").find('input').val();
                    }else if(id=="#dogoogle"){
                        otherI=$("#dophone").find('input').val();
                    }
                    if (otherI=="0") {
                        alertBoxNew({alertContent:'<@spring.messageText "user.info.safity.status.1" "手机验证与谷歌验证不可同时关闭"/>',btnType:"sure"})
                    } else{
                        if(id=="#dophone"){
                            successText = '<@spring.messageText "phone.closed" "手机验证已经关闭。"/>';
                        }else if(id=="#dogoogle"){
                            successText = '<@spring.messageText "google.closed" "谷歌验证已经关闭。"/>';
                        }
                        alertBoxNew({
                            //alertTitle:'标题', 
                            alertWidth:"400px",
                            alertContent:content, 
                            sureFunc:function(){
                                  var code = $("#switch_code").find('input[type="text"]').val();
                                  btnSwitch(url,status,code,successText);
                            }
                        });
                    };
                } else if(i == "0"){
                    status ="OPEN";
                    console.log("id: "+ id);
                    if(id=="#dophone"){
                        successText = '<@spring.messageText "phone.opened" "手机验证已经开启。"/>';
                    }else if(id=="#dogoogle"){
                        successText = '<@spring.messageText "google.opened" "谷歌验证已经开启。"/>';
                    }
                    alertBoxNew({
                        //alertTitle:'标题', 
                        alertWidth:"400px",
                        alertContent:content, 
                        sureFunc:function(){
                              var code = $("#switch_code").find('input[type="text"]').val();
                              btnSwitch(url,status,code,successText);
                        }
                    });
                };
                
            })
        }
        function btnSwitch(url,status,code,successText){
            $.ajax({
                url: url,
                type: 'POST',
                data: {
                    status: status,
                    code:code
                },
                success:function(result){
                    if(0 == result.status){
                        reloadStatus(result.data,successText);
                    }else{
                        alertBoxFunc(result.error.message,"sure");
                    }
                }
            })
        }
        function reloadStatus(result,reload){
            var g_code = result.g_code ;
            var v_code = result.v_code ;
            var google = $("#dogoogle");
            var phone = $("#dophone");
            if(g_code == "CLOSE"){
                google.find('input').val("0");
                google.find('i').addClass('off');
            }else if(g_code == "OPEN"){
                google.find('input').val("1");
                google.find('i').removeClass('off');
            }
            if(v_code == "CLOSE"){
                phone.find('input').val("0");
                phone.find('i').addClass('off');
            }else if(v_code == "OPEN"){
                phone.find('input').val("1");
                phone.find('i').removeClass('off');
            }
            if(reload){
                alertBoxNew({
                    alertContent:reload, 
                    alertType:"success", 
                    btnType:'sure', 
                    sureFunc:function(){
                        location.reload();
                    }
                });
            }
        }
    })
</script>

<!-- 设置谷歌验证 -->
<script type="text/alert-template" id="set-googlecode-html">
<div id="setGooglecode" class="alertInputBox" >
    <div class="clearfix">
        <div class="codeimage" id="codeimage"><img src="" alt=""></div>
        <div class="verifybox">
            <p><span><@spring.messageText "safety.text106" "秘 钥"/></span><input id="secret_key" type="text" value="er" ></p>
            <p class="info"><@spring.messageText "safety.text107" "请先扫描二维码或手工输入秘钥，将<em>手机</em>上生成的<em>动态验证码</em>填写到下方输入框。"/></p>
            <p><span><@spring.messageText "safety.text108" "谷歌验证码"/></span><input id="google_key" type="text"></p>
        </div>
    </div>
    <div class="vcode">
        <span><@spring.messageText "safety.text24" "手机验证码"/></span>
        <input type="text"/>
        <input type="button" class="get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>">
        <p class="warning"></p>
    </div>
    <div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>
</div>
</script>
<script type="text/alert-template" id="set-googlecode-html-success">
<div class="alertInfoBox" id="alertInfoBox">
    <i class="success"></i>
    <h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
    <button class="backto"><@spring.messageText "safety.text59" "返回安全中心"/></button></div>
</div>
</script>
<script type="text/alert-template" id="check-phonecode-html">
<div id="check-phonecode" class="alertInputBox" >
    <p><@spring.messageText "safety.text109" "查看谷歌认证秘钥需要进行身份验证后才能继续，请输入短信验证码。"/></p>
    <div class="vcode">
        <span><@spring.messageText "safety.text24" "手机验证码"/></span>
        <input type="text"/>
        <input type="button" class="get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>">
        <p class="warning"></p>
    </div>
     <div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>
</div>
</script>
<script type="text/alert-template" id="check-googlecode-html">
<div id="check-googlecode" class="" >
    <img src="">
    <p><span><@spring.messageText "safety.text106" "秘 钥"/></span><input type="text"></p>
</div>
</script>
<script>
$(function(){

    $("#set_googlecode").on('click', function(event) {
        event.preventDefault();
        var content = alertText("#set-googlecode-html");
        $.get('/v2/authenticator/key', function(result){
            if(0 == result.status){
                alertFunc({
                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text110" "设置谷歌验证"/>',
                    contents:content,
                    width:620
                });
                $('#codeimage img').attr('src','/v2/authenticator/key.png?key='+result.data);
                $('#secret_key').val(result.data).attr('readonly','readonly');
            }else{
                alertBoxFunc(result.error.message,"sure",function(){
                    location.reload();
                });
            }
        });
    });
    $(document).on('click','#setGooglecode .submit', function(event) {
        console.log("we:");
        var googleKey = $("#google_key").val();
        var secretKey = $("#secret_key").val();
        var vcode = $("#setGooglecode .vcode").find('input[type="text"]').val();
        if (googleKey==""||googleKey==null) {
            alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
            return;
        };
        if (vcode==""||vcode==null) {
            alertBoxFunc("<@spring.messageText "safety.text27" "手机验证码不能为空。"/>","sure");
            return;
        };
        $.ajax({
            type: 'post',
            url: '/v2/user/authenticator/key',
            data:{
                key:secretKey,
                gCode:googleKey,
                code: vcode
            },
            success: function(result){
                if(0 == result.status){
                    $("#dogoogle").html('<@spring.messageText "safety.text103" "谷歌验证"/><i></i><a href="javascript:void(0);" class="blue" id="checkgoogle"><@spring.messageText "safety.text104" "查看"/></a>')
                    var content = alertText("#set-googlecode-html-success");
                    alertFunc({
                        title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text110" "设置谷歌验证"/>',
                        contents:content,
                        width:620
                    });
                }else{
                    alertBoxFunc(result.error.message,"sure");
                }
            },
            fail: function (status) {
                location.reload();
            }
        });
    });
    $(document).on('click','#checkgoogle', function(event) {
        event.preventDefault();
        var content = alertText("#check-phonecode-html");
        alertFunc({
            title:'<@spring.messageText "safety.text112" "查看谷歌认证秘钥"/>',
            contents:content,
            width:620
        });
    })
    $(document).on('click','#check-phonecode .submit', function(event) {
        event.preventDefault();
        var vcode = $("#check-phonecode .vcode").find('input[type="text"]').val();
        if (vcode==""||vcode==null) {
            alertBoxFunc("<@spring.messageText "safety.text27" "手机验证码不能为空。"/>","sure");
            return;
        };
        $.ajax({
            type: 'GET',
            url: '/v2/user/authenticator/key',
            data:{
                code: vcode
            },
            success: function(result){
                if(0 == result.status){
                    var content = alertText("#check-googlecode-html");
                    alertFunc({
                        title:'<@spring.messageText "safety.text113" "谷歌身份验证器"/>',
                        contents:content,
                        width:320
                    });
                    $('#check-googlecode img').attr('src','/v2/authenticator/key.png?key='+result.data);
                    $('#check-googlecode input[type="text"]').val(result.data).attr('readonly','readonly');
                }else{
                    alertBoxFunc(result.error.message,"sure");
                }
            },
            fail: function (status) {
                location.reload();
            }
        });
    })
})
</script>
<!-- 设置支付密码 -->
<script type="text/alert-template" id="set-paypassword-html">
    <div class="alertInputBox" id="alert-paypassword">
        <div class="password">
            <span><@spring.messageText "safety.text8" "设置支付密码"/></span>
            <input class="NamberPassword" type="password" placeholder="<@spring.messageText "safety.text21" "请输入6位数字密码"/>"/>
            <p class="warning"></p>
        </div>
        <div class="passwordagain">
            <span><@spring.messageText "safety.text22" "确认支付密码"/></span>
            <input  class="NamberPassword" type="password" placeholder="<@spring.messageText "safety.text23" "请重复6位数字密码"/>"/>
            <p class="warning"></p>
        </div>
        <#if vcodeon?exists >
        <div class="vcode">
            <span><@spring.messageText "safety.text24" "手机验证码"/></span>
            <input type="text"/>
            <input type="button" class="get-vcode-password" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>">
            <p class="warning"></p>
        </div>
        </#if>
        <#if googlecodeon?exists >
        <div class="googlecode">
            <span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>
            <input type="text" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">
            <p class="warning"></p>
        </div>
        </#if>
        <div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>

    </div>
    <p class="alertFloor"><@spring.messageText "safety.text25" "修改支付密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</script>
<script type="text/alert-template" id="change-paypassword-html-success">
<div class="alertInfoBox" id="alertInfoBox">
    <i class="success"></i>
    <h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
    <button class="closeSure"><@spring.messageText "safety.text59" "返回安全中心"/></button></div>
    <p class="alertFloor"><@spring.messageText "safety.text25" "修改支付密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</div>
</script>
<script>
$(function(){
    $(document).on('click','#set-paypassword', function(event) {
        event.preventDefault();
        var content = alertText("#set-paypassword-html");
        alertFunc({
            title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text8" "设置支付密码"/>',
            contents:content
        })
        $("#alert-paypassword").on('click','.submit', function(event) {
            $("#alert-paypassword").find('p.warning').text("");
            event.preventDefault();
            var password = $("#alert-paypassword").find('.password input');
            var passwordagain = $("#alert-paypassword").find('.passwordagain input');
            if(isNamberPassword(password.val())){
                if(password.val() === passwordagain.val()){
                    var vcode = $("#alert-paypassword").find('.vcode input[type=text]').val();
                    if(vcode==""){
                        $("#alert-paypassword").find('.vcode p.warning').text('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>');
                        $("#alert-paypassword").find('.vcode input[type=text]').focus();
                        return ;
                    }
                    var googlecode = $("#alert-paypassword").find('.googlecode input[type=text]').val();
                    if(googlecode==""){
                        $("#alert-paypassword").find('.googlecode p.warning').text('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>');
                        $("#alert-paypassword").find('.googlecode input[type=text]').focus();
                        return ;
                    }
                    var passwordVal = encodeURIComponent(ENCRYPT.encrypt(password.val()));
                    $.ajax({
                        type: 'post',
                        url: '/v2/user/pay_password',
                        data:{
                            password: passwordVal,
                            code: vcode,
                            googlecode:googlecode
                        },
                        success: function(data){
                            if(0 == data.status){
                                  updateLevel();
                                  console.log("click");
                                  $(".detail").find('.paypassword').html('<span></span><b><@spring.messageText "safety.text8" "设置支付密码"/></b><em><@spring.messageText "safety.text9" "已设置"/></em><button id="set-paypassword"><@spring.messageText "safety.text10" "修改"/></button>');
                                  $('#alertBox').remove();
                                  var contentSuccess = alertText("#change-paypassword-html-success");
                                  alertFunc({
                                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text8" "设置支付密码"/>',
                                    contents:contentSuccess
                                })
                                $("#alertInfoBox").on('click', '.closeSure', function(event) {
                                    event.preventDefault();
                                    /* Act on the event */
                                    $('#alertBox').remove();
                                });
                              }else{
                                  alertBoxFunc(data.error.message,'sure');
                              }
                        },
                        fail: function (status) {
                            location.reload();
                        }
                    });
                }else{
                    if(password.val()==""){
                        $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text21" "请输入6位数字密码"/>');
                        password.val("").focus();
                    }else{
                        $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                        passwordagain.val("").focus();
                    }
                }
            }else{
                $("#alert-paypassword").find('.password p.warning').text('<@spring.messageText "safety.text21" "请输入6位数字密码"/>');
                password.val("").focus();
            }
        });
        $("#alert-paypassword").on('keyup','.password input[type="password"]', function(event) {
            var  password = $("#alert-paypassword").find('.password input');
            var passwordagain = $("#alert-paypassword").find('.passwordagain input');
            if(!isNamberPassword(password.val())){
                $("#alert-paypassword").find('.password p.warning').text('<@spring.messageText "safety.text21" "请输入6位数字密码"/>');
            }else{
                $("#alert-paypassword").find('.password p.warning').text("");
            }
            if(passwordagain.val()!=""){
                if(password.val()!= passwordagain.val()){
                    $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                }else{
                    $("#alert-paypassword").find('.passwordagain p.warning').text("");
                }
            }
        });
        $("#alert-paypassword").on('blur','.password input[type="password"]', function(event) {
            var  password = $("#alert-paypassword").find('.password input');
            //var passwordagain = $("#alert-paypassword").find('.passwordagain input');
            if(!isNamberPassword(password.val())){
                $("#alert-paypassword").find('.password p.warning').text('<@spring.messageText "safety.text21" "请输入6位数字密码"/>');
                password.focus();
            }else{
                $("#alert-paypassword").find('.password p.warning').text("");
            }
        });
        $("#alert-paypassword").on('keyup','.passwordagain input[type="password"]', function(event) {
            var  password = $("#alert-paypassword").find('.password input');
            var passwordagain = $("#alert-paypassword").find('.passwordagain input');
            if(!isNamberPassword(password.val())){
                $("#alert-paypassword").find('.password p.warning').text('<@spring.messageText "safety.text21" "请输入6位数字密码"/>');
            }else if(password.val()!= passwordagain.val()){
                $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
            }else{
                $("#alert-paypassword").find('.passwordagain p.warning').text("");
            }
        });
        $("#alert-paypassword").on('click','.get-vcode-password', function(event) {
            var self = $(this);
            var  password = $("#alert-paypassword").find('.password input');
            var passwordagain = $("#alert-paypassword").find('.passwordagain input');
            if(isNamberPassword(password.val())){
                if(password.val()!= passwordagain.val()){
                    $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                }else{
                    $("#alert-paypassword").find(' p.warning').text("");
                    self[0].setAttribute("disabled", true);
                    $.get('/v2/user/get_code', function(data){
                        if(0 == data.status){
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
                            alertBoxFunc(data.error.message, "sure");
                        }
                    });
                }
            }else{
                if(password.val()==""){
                    $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text21" "请输入6位数字密码"/>');
                    password.val("").focus();
                }else{
                    $("#alert-paypassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
                    passwordagain.val("").focus();
                }
            }
        })
    });
})
</script>
<!-- 设置支付密码 end -->

<!-- 修改登录密码 -->
<script type="text/alert-template" id="change-loadpassword-html">
    <div class="alertInputBox"  id="alert-loadpassword">
        <div class="passwordold">
            <span><@spring.messageText "safety.text29" "原登录密码"/></span>
            <input type="password"/>
            <em class="warning"><a href="/v2/user/safety/needpassword"><@spring.messageText "forget_password" "忘记密码？"/></a></em>
            <p class="warning"></p>
        </div>
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
        <div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>
    </div>
    <p class="alertFloor"><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</script>
<script type="text/alert-template" id="change-loadpassword-html-success">
<div class="alertInfoBox" id="alertInfoBox">
    <i class="success"></i>
    <h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
    <button class="closeSure"><@spring.messageText "safety.text59" "返回安全中心"/></button></div>
</div>
</script>
<script>
    $(function(){
        $("#change-loadpassword").on('click', function(event) {
            event.preventDefault();
            var content = alertText("#change-loadpassword-html");
            alertFunc({
                title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
                contents:content
            })
            $("#alert-loadpassword").on('click','.submit', function(event) {
                var oldPassword = $("#alert-loadpassword").find('.passwordold input[type="password"]');
                var newPassword = $("#alert-loadpassword").find('.password input[type="password"]');
                var newPasswordagain = $("#alert-loadpassword").find('.passwordagain input[type="password"]');
                $("#alert-loadpassword").find('p.warning').text("");

                if(oldPassword.val()==""){
                    $("#alert-loadpassword").find('.passwordold p.warning').text('<@spring.messageText "safety.text58" "请输入原密码。"/>');
                    oldPassword.focus();
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
                if(isLoadPassword(newPassword.val())&&oldPassword.val()!=""&&newPassword.val()==newPasswordagain.val()){
                    var newPasswordVal = newPassword.val();
                    var oldPasswordVal = oldPassword.val();
                    newPasswordVal = encodeURIComponent(ENCRYPT.encrypt(newPasswordVal));
                    oldPasswordVal = encodeURIComponent(ENCRYPT.encrypt(oldPasswordVal));
                    $.ajax({
                        type: 'post',
                        url: '/v2/user/password',
                        data:{
                            password: newPasswordVal,
                            old_password: oldPasswordVal
                        },
                        success: function(data){
                            if(0 == data.status){
                                  updateLevel();
                                  $('#alertBox').remove();
                                  var contentSuccess = alertText("#change-loadpassword-html-success");
                                  alertFunc({
                                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
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
        });
    })
</script>
<!-- 设置登录密码 end-->

<!-- 设置密保问题 -->
<script type="text/alert-template" id="set-question-html">
<div class="alertInputBox" id="alert-question">
    <div class="taber">
        <div class="active"><@spring.messageText "safety.text38" "验证身份"/></div>
        <div><@spring.messageText "safety.text39" "设置安全保护问题"/></div>
        <div><@spring.messageText "safety.text40" "验证安全保护问题"/></div>
        <div><@spring.messageText "safety.text41" "完成"/></div>
    </div>
    <div class="moudle">
       
        <div class="vcode">
            <span><@spring.messageText "safety.text24" "手机验证码"/></span>
            <input type="text"/>
            <input type="button" class="get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>">
            <p class="warning"></p>
        </div>
        
    </div>
    <div class="moudle">
        <div class="title"><@spring.messageText "safety.text42" "请设置您的安全保护问题"/></div>
        <div class="question-box" id="set-question-box">
            <div>
                <div>
                    <span><@spring.messageText "safety.text43" "问题一"/> ：</span>
                    <select >
                      
                    </select>
                </div>
                <div>
                    <span><@spring.messageText "safety.text46" "答案"/>：</span>
                    <input type="text"></input>
                </div>
                <div>
                    <span><@spring.messageText "safety.text44" "问题二"/>：</span>
                    <select >
                      
                    </select>
                </div>
                <div>
                    <span><@spring.messageText "safety.text46" "答案"/>：</span>
                    <input type="text"></input>
                </div>
                <div>
                    <span><@spring.messageText "safety.text45" "问题三"/>：</span>
                    <select >
                      
                    </select>
                </div>
                <div>
                    <span><@spring.messageText "safety.text46" "答案"/>：</span>
                    <input type="text"></input>
                </div>
            </div>
        </div>
    </div>
    <div class="moudle">
    <div class="title"><@spring.messageText "safety.text47" "请验证您的安全保护问题"/></div>
        <div class="question-box" id="Verify-question-box">
            <div>
                <div>
                    <span><@spring.messageText "safety.text43" "问题一"/>：</span>
                    <b class="question">
                      
                    </b>
                </div>
                <div>
                    <span><@spring.messageText "safety.text46" "答案"/>：</span>
                    <input type="text"></input>
                </div>
                <div>
                    <span><@spring.messageText "safety.text44" "问题二"/>：</span>
                    <b class="question">
                      
                    </b>
                </div>
                <div>
                    <span><@spring.messageText "safety.text46" "答案"/>：</span>
                    <input type="text"></input>
                </div>
                <div>
                    <span><@spring.messageText "safety.text45" "问题三"/>：</span>
                    <b class="question">
                      
                    </b>
                </div>
                <div>
                    <span><@spring.messageText "safety.text46" "答案"/>：</span>
                    <input type="text"></input>
                </div>
            </div>
        </div>
    </div>
    <div class="moudle">
        <i class="success"></i>
        <h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
    </div>
    <div><button class="submit"><@spring.messageText "safety.text48" "下一步"/></button></div>
</div>
<p class="alertFloor"><@spring.messageText "safety.text114" "修改密保问题后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</script>
<script>
    $(function(){
        function questioner(){
            var inMoudle=0;
            $(document).on('click','#set-question', function(event) {
                event.preventDefault();
                inMoudle=0;
                var content = alertText("#set-question-html");
                alertFunc({
                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text14" "设置密保问题"/>',
                    contents:content
                })
                changeMoudle ();
            })
            $(document).on('click','#change-question', function(event) {
                event.preventDefault();
                inMoudle=0;
                var content = alertText("#set-question-html");
                alertFunc({
                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text49" "修改密保问题"/>',
                    contents:content
                })
                changeMoudle ();
                // var nextSubmit = $("#alert-question").find('.submit');
                // nextSubmit.on('click', function(event) {
                //     var self = $(this);
                //     event.preventDefault();
                //     var moudles = $("#alert-question").find('.moudle');
                //     if(inMoudle<moudles.length-1){ 
                //         inMoudle++; 
                //         changeMoudle();
                //     }
                //     if(inMoudle >= moudles.length-1){
                //         updateLevel();
                //         $(this).text('返回安全中心');
                //         setTimeout(function(){self.addClass('closeSure');},300)
                //     }
                // });
            })
            function changeMoudle (){
                var taber = $("#alert-question").find('.taber div');
                taber.eq(inMoudle).addClass('active');
                var moudles = $("#alert-question").find('.moudle');
                moudles.eq(inMoudle).show().siblings('.moudle').hide();
            };
            var questionArry = [];
            var answerArry=[];
            $(document).on('click','#alert-question .submit', function(event) {
                var self = $(this);
                event.preventDefault();
                var moudles = $("#alert-question").find('.moudle');
                //console.log(inMoudle+"/"+moudles.length);
                var questionTextArry = [];
                var verifyQuestionArry = [];
                var verifyAnswerArry=[];
                $("#alert-question").find('p.warning').text("");
                if(inMoudle==0){
                    $("#alert-question").find('p.warning').text("");
                    var vcode = $("#alert-question").find('.vcode input[type=text]').val();
                    if(vcode==""){
                        $("#alert-question").find('.vcode p.warning').text('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>');
                        $("#alert-question").find('.vcode input[type=text]').focus();
                        return ;
                    }
                    // var googlecode = $("#alert-question").find('.googlecode input[type=text]').val();
                    // if(googlecode==""){
                    //     $("#alert-question").find('.googlecode p.warning').text('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>');
                    //     $("#alert-question").find('.googlecode input[type=text]').focus();
                    //     return ;
                    // }
                    $.ajax({
                        url: '/v2/user/check_code',
                        type: 'get',
                        data:{
                            code:vcode,
                            // googlecode:googlecode
                        },
                        success: function(data){
                            if(0 == data.status){
                                  loadQuestions();
                              }else{
                                  alertBoxFunc(data.error.message,'sure');
                              }
                        },
                        fail: function (status) {
                            location.reload();
                        }
                    })
                    //loadQuestions();
                    function loadQuestions(){
                        //var _lang=langType();
                        var locale = getCookie("locale");
                        $.ajax({
                            url: '/v2/user/questions',
                            type: 'get',
                            data:{
                                locale : locale
                            },
                            success: function(data){
                                // if(0 == data.status){
                                    //console.log(data);
                                    var selectHtml=""
                                    for (var i = 0; i < data.length; i++) {
                                        selectHtml+='<option value="'+data[i].id+'">'+data[i].info+'</option>'
                                    };
                                    $("#set-question-box").find('select').html(selectHtml)
                                    inMoudle++;
                                    changeMoudle();
                                    // changeQu(data);
                                    $("#set-question-box").find('select').eq(0).val("0");
                                    $("#set-question-box").find('select').eq(1).val("1");
                                    $("#set-question-box").find('select').eq(2).val("2");
                            //     }else{
                                  //     alertBoxFunc(data.error.message,'sure');
                                  // }
                            },
                            fail: function (status) {
                                location.reload();
                            }
                        })
                    };
                    // function changeQu(data){
                    //     var selecter = $("#set-question-box").find('select');
                    //     selecter.each(function(index, el) {
                    //         $(this).on('click', function(event) {
                    //             var indexer =selecter.index($(this));
                    //             console.log(indexer);
                    //             var selectHtml=""
                    //             for (var i = 0; i < data.length; i++) {
                    //                 selectHtml+='<option value="'+data[i].id+'">'+data[i].info+'</option>'
                    //             };
                    //             $(this).html(selectHtml)
                    //             for (var i = 0; i < $("#set-question-box select").length; i++) {
                    //                 if(i==indexer){
                    //                     console("this");
                    //                 }else{
                    //                     console.log($(this).find('option:selected').val());
                    //                 }
                    //             };
                    //         });
                    //     });
                    // }
                }
                else if(inMoudle==1){
                    var qu = $("#set-question-box").find('select');
                    var an = $("#set-question-box").find('div input[type="text"]');
                    questionArry = [];
                    answerArry=[];
                    for (var i = 0; i < qu.length; i++) {
                        var quid = qu.eq(i).val();
                        questionArry.push(quid);
                        answerArry.push(an.eq(i).val());
                        questionTextArry.push(qu.eq(0).find('option[value="'+quid+'"]').text());

                    };
                    //console.log(questionTextArry);
                    questionArry = $.unique(questionArry)
                    if(questionArry.length==3){
                        //console.log(questionArry);
                        console.log(answerArry);
                        var ans = 0;
                        for (var i = 0 ; i < answerArry.length; i++) {                                
                            if (answerArry[i]=="") {
                                alertBoxFunc('<@spring.messageText "safety.text50" "答案不能为空！"/>','sure');
                            }else{
                                ans ++ ;
                            };
                            $("#Verify-question-box").find('.question').eq(i).text(questionTextArry[i]).attr('id-name', questionArry[i]);
                        };
                        if(ans<3){
                            alertBoxFunc('<@spring.messageText "safety.text50" "答案不能为空！"/>','sure');
                        }else{
                            //var dater=arryPus(questionArry,answerArry);
                            //console.log( dater.join() );
                            // $.ajax({
                            //     url: '/v2/user/questions',
                            //     type: 'post',
                            //     data:{
                            //         code:$('#alert-question .vcode input[type="text"]').val(),
                            //         data: dater.join(";")
                            //     },
                            //     success: function(data){
                            //         if(0 == data.status){
                            //             console.log(data)
                                        inMoudle++;
                                        changeMoudle();
                            //         }else{
                            //               alertBoxFunc(data.error.message,'sure',function(){
                            //                 $('#alertBox').remove();
                            //             });
                            //           }
                            //     },
                            //     fail: function (status) {
                            //         location.reload();
                            //     }
                            // })
                        }
                    }else{
                        alertBoxFunc('<@spring.messageText "safety.text51" "问题有重复！"/>','sure');
                    }    
                }
                else if(inMoudle==2){
                    var verifyQu = $("#Verify-question-box").find('.question');
                    var verifyAn = $("#Verify-question-box").find('div input[type="text"]');
                    verifyAnswerArry=[];
                    for (var i = 0; i < verifyQu.length; i++) {
                        verifyQuestionArry.push(verifyQu.eq(i).attr("id-name"));
                        verifyAnswerArry.push(verifyAn.eq(i).val());
                    };
                    var rightNum = 3;
                    //console.log( answerArry + ':' + verifyAnswerArry);
                    for (var j = 0; j < answerArry.length; j++){
                        //console.log(answerArry[j]+':'+verifyAnswerArry[j]);
                        if(answerArry[j] == verifyAnswerArry[j]){
                            //console.log(answerArry[j]);
                            rightNum --;
                        }
                    }
                    if(rightNum <=0 ){
                        //console.log("全对");
                    
                        var dater=arryPus(questionArry,answerArry);
                        //console.log($('#alert-question .vcode input[type="text"]').val()+"$"+dater);
                        // var verifyDater=arryPus(verifyQuestionArry,verifyAnswerArry);
                        $.ajax({
                            url: '/v2/user/questions',
                            type: 'post',
                            data:{
                                code:$('#alert-question .vcode input[type="text"]').val(),
                                // googlecode:$('#alert-question .googlecode input[type="text"]').val(),
                                data: dater.join(";")
                            },
                            success: function(data){
                                if(0 == data.status){
                                    console.log(data);
                                    inMoudle++ ;
                                    changeMoudle();
                                    updateLevel();
                                    self.text('<@spring.messageText "safety.text59" "返回安全中心"/>');
                                    $(".detail").find('.securityquestion').html('<span></span><b><@spring.messageText "safety.text14" "设置密保问题"/></b><em><@spring.messageText "safety.text9" "已设置"/></em><button id="change-question"><@spring.messageText "safety.text10" "修改"/></button>');
                                    setTimeout(function(){self.addClass('closeSure');},300)
                                }else{
                                      alertBoxFunc(data.error.message,'sure');
                                  }
                            },
                            fail: function (status) {
                                location.reload();
                            }
                        })
                    }else{
                        alertBoxFunc('<@spring.messageText "v2.user.question.check.error" "密保问题答案不正确"/>','sure');
                    }
                }
                
            });
        }
        questioner();
    })
</script>
<!-- 设置密保问题 end -->

<!-- 设置邮箱 -->
<script type="text/alert-template" id="set-email-html">
<div class="alertInputBox" id="alert-email">
    <div class="taber">
        <div class="active"><@spring.messageText "safety.text38" "验证身份"/></div>
        <div><@spring.messageText "safety.text52" "添加邮箱"/></div>
        <div><@spring.messageText "safety.text53" "添加成功"/></div>
    </div>
    <div class="moudle">
        
        <div class="vcode">
            <span><@spring.messageText "safety.text24" "手机验证码"/></span>
            <input type="text"/>
            <input type="button" class="get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>">
            <p class="warning"></p>
        </div>
        
    </div>
    <div class="moudle">
        <div class="email-box" id="set-email-box">
            <span><@spring.messageText "safety.text54" "邮箱地址"/></span>
            <input type="text"/>
            <p class="warning"></p>
        </div>
    </div>
    <div class="moudle">
        <i class="success"></i>
        <h3></h3>
        <p class="gray"><@spring.messageText "safety.text55" "如果没收到邮件，请查收垃圾邮件或点击重新获取"/></p>
        <p><br/></p>
    </div>
    <div><button class="submit"><@spring.messageText "safety.text48" "下一步"/></button></div>
</div>
<p class="alertFloor"><@spring.messageText "safety.text115" "修改邮箱后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</script>
<script>
    $(function(){
        function setEmail(){
            var inMoudle=0;
            $(document).on('click','#set-email', function(event) {
                event.preventDefault();
                var _self = $(this)
                inMoudle=0;
                var content = alertText("#set-email-html");
                alertFunc({
                    title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text15" "设置邮箱"/>',
                    contents:content,
                    width:620
                });
                changeMoudle();
            })
            $(document).on('click','#alert-email .submit', function(event) {
                var _self = $(this);
                event.preventDefault();
                var moudles = $("#alert-email").find('.moudle');
                console.log(inMoudle+"/"+moudles.length);
                //console.log(moudles.length);
                if(inMoudle==0){
                    $("#alert-email").find('p.warning').text("");
                    var vcode = $("#alert-email").find('.vcode input[type=text]').val();
                    if(vcode==""){
                        $("#alert-email").find('.vcode p.warning').text('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>');
                        $("#alert-email").find('.vcode input[type=text]').focus();
                        return ;
                    }
                    // var googlecode = $("#alert-email").find('.googlecode input[type=text]').val();
                    // if(googlecode==""){
                    //     $("#alert-email").find('.googlecode p.warning').text('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>');
                    //     $("#alert-email").find('.googlecode input[type=text]').focus();
                    //     return ;
                    // }
                   
                    $.ajax({
                        url: '/v2/user/check_code',
                        type: 'get',
                        data:{
                            code:vcode,
                            // googlecode:googlecode
                        },
                        success: function(data){
                            if(0 == data.status){
                                  inMoudle++;
                                changeMoudle();
                              }else{
                                  alertBoxFunc(data.error.message,'sure');
                              }
                        },
                        fail: function (status) {
                            location.reload();
                        }
                    })
                    // inMoudle++;
                    // changeMoudle();
                    //console.log(inMoudle);
                }
                else if(inMoudle==1){
                    var emailA = moudles.eq(1).find('.email-box input[type="text"]').val();
                    //console.log(toX("123456789"));
                    if(emailA!=""){
                        if(isEmail(emailA)){
                            $.ajax({
                                url: '/v2/user/email',
                                type: 'post',
                                data:{
                                    code:$('#alert-email .vcode input[type="text"]').val(),
                                    // googlecode:$('#alert-email .googlecode input[type="text"]').val(),
                                    email: emailA
                                },
                                success: function(data){
                                    if(0 == data.status){
                                        inMoudle++;
                                        changeMoudle();
                                        var emailX = toX(emailA);
                                        //console.log(emailX);
                                        moudles.eq(2).find('h3').html('<@spring.messageText "safety.text56" "邮件已发送至"/> <b class="blue">'+emailX+'</b> <@spring.messageText "safety.text57" "邮箱"/> ');
                                        updateLevel();
                                        var parenter = _self.parent();
                                        //console.log(_self.html());
                                        parenter.html('<button  class="closeSure"><@spring.messageText "safety.text59" "返回安全中心"/></button><input type="button" class="get-emaillink" value="<@spring.messageText "safety.text60" "重新获取"/>">')
                                        $(".detail").find('.setemail').html('<span></span><b><@spring.messageText "safety.text15" "设置邮箱"/></b><em><@spring.messageText "safety.text16" "已设置验证邮箱"/></em><button id="set-email"><@spring.messageText "safety.text10" "修改"/></button>');
                                        setTimeout(function(){$('#alert-email .submit').addClass('closeSure');},300)
                                    }else{
                                          alertBoxFunc(data.error.message,'sure');
                                      }
                                },
                                fail: function (status) {
                                    location.reload();
                                }
                            })
                            
                        }else{
                            alertBoxFunc('<@spring.messageText "safety.text61" "邮箱格式不正确，请重新输入"/>','sure');
                            moudles.eq(1).find('.email-box input[tpe="text"]').focus();
                        }
                    }else{
                        alertBoxFunc('<@spring.messageText "safety.text62" "邮箱地址不能为空"/>','sure');
                        moudles.eq(1).find('.email-box input[tpe="text"]').focus();
                    }
                    
                }
            });
            function changeMoudle (){
                var taber = $("#alert-email").find('.taber div');
                taber.eq(inMoudle).addClass('active');
                var moudles = $("#alert-email").find('.moudle');
                moudles.eq(inMoudle).show().siblings('.moudle').hide();
            };
        }
        setEmail();
    })
</script>
<!-- 设置邮箱 end -->

<!-- 设置收货地址 -->
<script type="text/alert-template" id="set-address-html">
<div class="alertInfoBox" id="alertAddBox">
    <div class="title"><@spring.messageText "safety.text63" "已保存的收货地址"/></div>
    <div class="table_div" >
        
    </div>
    <div id="pagers"></div>
    <button class="newAddress" id="newAddress"><@spring.messageText "safety.text64" "新增地址"/></button></div>
</div>
</script>
<script>
    $(function(){
        // citychange($("#province"));
        $(document).on('click', '#set-address',function(event) {
            event.preventDefault();
            var content = alertText("#set-address-html");
            alertFunc({
                title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text18" "设置收货地址"/>',
                contents:content,
                width:"750",
                padding:"0"
            });
            
            loadAddress();
        })
         
        // //添加国内收货地址
        // chinaaddto(loadAddress);
        // //添加国际收货地址
        // usaaddto(loadAddress);

        $(document).on('click','#alertAddBox .table_div  .tr_div button', function(event) {
            var _self = $(this).parent().parent();
            //console.log("id-name:"+_self.attr('id-name'));
            $.ajax({
                url: '/user/defaultAddress',
                type: 'post',
                data:{
                    id: _self.attr('id-name')
                },
                success: function(data){
                    if(data.status == 0){
                        loadAddress();
                    }else{
                        alertBoxFunc(data.error.message, "sure");
                    }
                },
                fail: function (status) {
                    location.reload();
                }
            })
        });
        $(document).on('click','#alertAddBox .table_div  .tr_div .delete', function(event) {
            var _self = $(this).parent().parent();
            alertBoxFunc('<@spring.messageText "safety.text65" "是否删除该条地址？"/>',"all",function(){
                //console.log("id-name:"+_self.attr('id-name'));
                $.ajax({
                    url: '/user/userAddressDel',
                    type: 'GET',
                    data:{
                        addressId: _self.attr('id-name')
                    },
                    success: function(data){
                        if(data.status == 0){
                            //console.log(data);
                            _self.hide();
                        }else{
                            alertBoxFunc(data.error.message, "sure");
                        }
                    },
                    fail: function (status) {
                        location.reload();
                    }
                })
            })
        });
        function loadAddress(){
            $.ajax({
                url: '/user/userAddress',
                type: 'GET',
                data:{
                    'user_address_page': 0,
                    'user_address_size':200
                },
                success: function(data){
                    if(data.status == 0){
                        var datar = data.data.rows;
                        var htmlT = '<div class="th_div">'+
                                        '<div class="td_div"><@spring.messageText "safety.text66" "收件人"/></div>'+
                                        '<div class="td_div address"><@spring.messageText "safety.text67" "收货地址"/></div>'+
                                        '<div class="td_div"><@spring.messageText "safety.text68" "邮编"/></div>'+
                                        '<div class="td_div"><@spring.messageText "safety.text69" "电话"/></div>'+
                                        '<div class="td_div"><@spring.messageText "safety.text70" "操作"/></div>'+
                                        '<div class="td_div"> </div>'+
                                    '</div>';
                        if (datar==null || datar.length <= 0) {
                            htmlT +='<div class="tr_div clearfix">'+'<@spring.messageText "safety.text71" "您暂时没有已保存的收货地址记录"/>'+'</div>';
                        } else{
                            htmlT += '<div class="tr_box">';
                            var defaulter = "";
                            for(var i = 0 ; i < datar.length ; i++){
                                var name = datar[i].name ;
                                var addressDeatail = datar[i].country + datar[i].province + datar[i].city + datar[i].area + datar[i].detailedAddress;
                                var postCode = datar[i].postCode;
                                if(postCode==null||postCode==0||postCode==""){
                                    postCode = "000000"
                                }
                                var phone = datar[i].phone;
                                var idName = datar[i].id;
                                var defaultAdd = datar[i].defaultAddress;
                                htmlT += '<div class="tr_div" id-name="'+idName+'">'+
                                            '<input class="hiddeninputid" type="hidden" value = '+idName+'>'+
                                            '<div class="td_div">'+name+'</div>'+
                                            '<div class="td_div address">'+addressDeatail+'</div>'+
                                            '<div class="td_div">'+postCode+'</div>'+
                                            '<div class="td_div">'+toX(phone)+'</div>'+
                                            '<div class="td_div"><a class="delete" href="javascript:void(0);"><@spring.messageText "safety.text72" "删除"/></a>|<a class="modify"  addressid="'+ idName +'" href="javascript:void(0);"><@spring.messageText "safety.text10" "修改"/></a></div>'
                                            ;
                                     if (!defaultAdd) {
                                        htmlT += '<div class="td_div"> <button><@spring.messageText "safety.text73" "设为默认"/></button> </div>';
                                     } else{
                                        htmlT += '<div class="td_div"> <em class="button"><@spring.messageText "safety.text74" "默认地址"/></em> </div>';
                                        defaulter = datar[i].detailedAddress;
                                     };
                                htmlT += '</div>';
                            }
                            htmlT += '</div>';
                            updateLevel();
                            $(".detail").find('.setaddress').html('<span></span><b><@spring.messageText "safety.text18" "设置收货地址"/></b><em><@spring.messageText "safety.text19" "已设置收货地址"/>: '+defaulter+'</em><button id="set-address"><@spring.messageText "safety.text10" "修改"/></button>');
                        };
                        $("#alertAddBox .table_div").html(htmlT);
                        
                        
                    }else{
                        alertBoxFunc(data.error.message, "sure");
                    }
                },
                fail: function (status) {
                    location.reload();
                }
            })
        }
        // modifyAddress('.modify',loadAddress);
        var shiper = new shippingAddress({
          addbtn:"#newAddress",
          modifybtn:".modify",
          addsuccess:function(){
            loadAddress();
          },
          modifysuccess:function(){
            loadAddress();
          }
        });
    })
</script>
<!-- 设置收货地址 end -->
<script type="text/alert-template" id="windowPopup">
          
</script>
<script type="text/alert-template" id="usawindowPopup">
 
</script>
<script type="text/javascript">
    $(function(){
        //url ?BTN = ** 参数，页面初始化执行BTN
        urlBtnToDo();    
        function urlBtnToDo(){
            var btn = GetQueryString("BTN");
            if( btn && btn!=""){
                console.log(btn);
                $(document).find('#'+btn).trigger("click");
            }
        }
        //  添加样式
       //clickfoota(".newAddress")
        // //console.log($(".countchina").html()) 
        // var login=new addressCountry({id:"#countryCode"});
        // var login1=new addressCountry({id:"#countryCode1",showId:true});
        // var login2=new addressCountry({id:"#countryCode2",showId:true});
        /**************************************/
          // var shengnewobj = $('.sheng option:selected').text();
          //    $('.sheng').focus(function(){
          //         shengnewobj = $('.sheng option:selected').text();
          //      })
          //    $('.sheng').blur(function(){
          //     var shengtext = $('.sheng option:selected').text();
          //       if(shengnewobj != shengtext){
          //            doProvAndCityRelation(); 
          //            doCityAndCountyRelation(); 
          //       }
          //    })
          //     $('.shi').focus(function(){
          //            doProvAndCityRelation(); 
          //            $('#chooseCitymy').remove();
          //            $('#chooseCitymy_1').remove();
          //            doCityAndCountyRelation();
          //      })
          //     $('.diqu').focus(function(){
          //           $('#chooseCountymy').remove();
          //            doCityAndCountyRelation();
          //      })
        /**************************************/
    })
</script>

</#macro>
