<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "safety.text1" "账户"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/safety.css" />
</#macro>

<#macro body>
<#assign nav_page="user" >
<#assign nav_sub_page="user_safety" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
    	<div class="bd-inner">
	    	<div class="page-title">
	    		<h2><@spring.messageText "index.header.text2" "首页"/> / <@spring.messageText "safety.text1" "账户"/></h2>
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="col-m">
	    			<div class="m-wrap need_verification">
	    				<h2><@spring.messageText "safety.text2" "请输入手机验证码"/></h2>
    					<p id="need-vcode"><input id="myvcode" type="text" ><input type="button" class="get-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'/></p>
    					<button id="submit-btn"><@spring.messageText "safety.text3" "确定"/></button>
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
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script>
	$(function(){
		$('#need-vcode .get-vcode').on('click', function(){
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
		$('#submit-btn').on('click', function(){
			var coder = $('#myvcode').val();
			if (coder=="") {
				alertBoxFunc('<@spring.messageText "safety.text2" "请输入手机验证码"/>', "sure");
				return;
			}
			$.ajax({
				type: 'GET',
				url: '/v2/user/check_code',
				data:{
					code: coder,
				},
				success: function(data){
					if(0 == data.status){
  							self.location='/v2/user/safety/into?code='+coder; 
  					}else{
  						alertBoxFunc(data.error.message,'sure');
  					}
				}
			});
		});	
	});
</script>
</#macro>