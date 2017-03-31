<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "safety.text1" "账户"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/safety.css" />
</#macro>

<#macro body>
<#assign nav_page="" >
<#assign nav_sub_page="user_safety" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
    	<div class="bd-inner">
	    	<div class="page-title">
	    		<h2><@spring.messageText "index.header.text2" "首页"/> /<@spring.messageText "safety.text1" "账户"/></h2>
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="col-m">
	    			<div class="m-wrap a-wrap">
	    				<div class="detail">
				    		<h3><@spring.messageText "safety.text13" "设置登录密码"/></h3>
				    		<div class="title"><@spring.messageText "safety.text26" "您正在为"/><span class="blue">${user.telephone}</span><@spring.messageText "safety.text13" "设置登录密码"/></div>
				    		<div >
				    			<div class="message"><@spring.messageText "safety.text96" "邮箱验证成功，请设置新密码。"/></div>
				    			<form class="alertInputBox setpassword" id="setpassword">
				    				<div class="password">
				    					<p><span><@spring.messageText "safety.text30" "新登录密码"/></span><input type="password"></p>
				    					<p class="warning"></p>
				    				</div>
				    				<div class="passwordagain">
				    					<p><span><@spring.messageText "safety.text84" "确认新登录密码"/></span><input type="password"></p>
				    					<p class="warning"></p>
				    				</div>
				    				<p><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></p>
				    			</form>
				    		</div>
				    	</div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</#macro>
<#macro footerjs>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script type="text/alert-template" id="change-loadpassword-html-success">
<div class="alertInfoBox" id="alertInfoBox">
	<i class="success"></i>
	<h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
	<button class="backto"><@spring.messageText "safety.text59" "返回安全中心"/></button></div>
	<p class="alertFloor"><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</div>
</script>
<script>
	$(function(){
		$("#setpassword .submit").on('click', function(event) {
	    		event.preventDefault();
	    		var newPassword = $("#setpassword").find('.password input[type="password"]');
	    		var newPasswordagain = $("#setpassword").find('.passwordagain input[type="password"]');
	    		$("#setpassword").find('p.warning').text("");

	    		if( !isLoadPassword(newPassword.val())){
	    			$("#setpassword").find('.password p.warning').text('<@spring.messageText "safety.text31" "请输入6-16位含数字和字母的密码"/>');
	    			newPassword.val("").focus();
	    			newPasswordagain.val("");
	    		}
	    		if(newPassword.val()!=newPasswordagain.val()){
	    			$("#setpassword").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
	    			newPasswordagain.val("").focus();
	    		}
	    		if(isLoadPassword(newPassword.val())&&newPassword.val()==newPasswordagain.val()){
	    			var pwd = encodeURIComponent(ENCRYPT.encrypt(newPassword.val()));
					$.ajax({
						type: 'post',
						url: '/v2/user/password_from_email',
						data:{
							password : pwd,
							//code: "33"
							code: ${code},
							uid:${uid}
						},
						success: function(data){
							if(0 == data.status){
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
</script>
</#macro>