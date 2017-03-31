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
	    		<h2><@spring.messageText "index.header.text2" "首页"/> / <@spring.messageText "safety.text1" "账户"/></h2>
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="col-m">
	    			<div class="m-wrap a-wrap">
	    				<div class="detail">
				    		<h3><@spring.messageText "safety.text75" "请选择验证方式"/></h3>
				    		<div class="title"><@spring.messageText "safety.text26" "您正在为"/><span class="blue">${user.telephone}</span><@spring.messageText "safety.text13" "设置登录密码"/>，<@spring.messageText "safety.text75" "请选择验证方式"/></div>
				    		<ul>
				    			<li>
				    				<p class="telphone">
				    					<span></span>
				    					<b><@spring.messageText "safety.text76" "通过绑定手机号"/></b>
				    					<em></em>
				    					<button id="by-phone" class="Modify"><@spring.messageText "safety.text77" "立即修改"/></button>
				    				</p>
				    			</li>
				    			<#if user.questioned >
				    			<li>
				    				<p class="securityquestion">
				    					<span></span>
				    					<b><@spring.messageText "safety.text78" "通过密保问题"/></b>
				    					<em></em>
				    					<button id="by-security" class="Modify"><@spring.messageText "safety.text77" "立即修改"/></button>
				    				</p>
				    			</li>
				    			</#if>
				    			<#if user.email?? >
				    			<li>
				    				<p class="setemail">
				    					<span></span>
				    					<b><@spring.messageText "safety.text89" "通过邮箱修改"/></b>
				    					<em></em>
				    					<button id="by-email" class="Modify"><@spring.messageText "safety.text77" "立即修改"/></button>
				    				</p>
				    			</li>
				    			</#if>
				    		</ul>
				    		<div class="warning"><i></i><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></div>
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
<script type="text/javascript" src="/static/js/jQuery.md5.js"></script>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>

<script>
	//获取验证码
	$(document).on('click','.alertInputBox .get-vcode', function(){
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
	
</script>
<script type="text/alert-template" id="success-html">
<div class="alertInfoBox" id="alertInfoBox">
	<i class="success"></i>
	<h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
	<button class="backto"><@spring.messageText "safety.text59" "返回安全中心"/></button></div>
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
		<#if vcodeon?exists >
		<div class="vcode">
			<span><@spring.messageText "safety.text24" "手机验证码"/></span>
			<input type="text"/>
			<input type="button" class="get-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
			<em class="warning"></em>
			<p class="warning"></p>
		</div>
		</#if>
        <#if googlecodeon?exists >
		<div class="googlecode-box">
            <span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>
            <input type="text" id="googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">
            <em class="warning"></em>
            <p class="warning"></p>
        </div>
        </#if>
		<div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>
	</div>
	<p class="alertFloor"><@spring.messageText "safety.text36" "修改登录密码后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></p>
</script>
<script>
    $(function(){
    	$("#by-phone").on('click', function(event) {
    		event.preventDefault();
	    	var content = alertText("#by-phone-html");
	    	alertFunc({
	    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
	    		contents:content
	    	})
	    	$("#alert-loadpassword").on('click','.submit', function(event) {
	    		var vcode = $("#alert-loadpassword").find('.vcode input[type="text"]');
                var googlecode = $("#alert-loadpassword").find('#googlecode');
	    		var newPassword = $("#alert-loadpassword").find('.password input[type="password"]');
	    		var newPasswordagain = $("#alert-loadpassword").find('.passwordagain input[type="password"]');
	    		$("#alert-loadpassword").find('p.warning').text("");

	    		if(vcode.val()==""){
	    			$("#alert-loadpassword").find('.vcode p.warning').text('<@spring.messageText "safety.text85" "请输入正确的手机验证码！"/>');
	    			vcode.focus();
                    return;
	    		}
                if (googlecode.val()=="") {
                    alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
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
						url: '/v2/user/password_code',
						data:{
							password: pwd,
							code: vcode.val(),
							googlecode:googlecode.val()
						},
						success: function(data){
							if(0 == data.status){
		  						$('#alertBox').remove();
		  						var contentSuccess = alertText("#success-html");
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
	    			newPasswordagain.val("").focus();
	    		}
			})
    	});
    })
</script>
<!-- 手机设置登录密码 end-->
<!-- by securityquestion  -->
<script type="text/alert-template" id="by-security-html">
<div class="alertInputBox" id="alert-security">
	<div class="taber">
		<div class="active"><@spring.messageText "safety.text40" "验证安全保护问题"/></div>
		<div><@spring.messageText "safety.text13" "设置登录密码"/></div>
		<div><@spring.messageText "safety.text41" "完成"/></div>
	</div>
	<div class="moudle">
	<div class="title"><@spring.messageText "safety.text88" "请输入您的密保答案"/></div>
		<div class="question-box" id="Verify-question-box">
			<div>
				<div>
					<span><@spring.messageText "safety.text43" "问题一"/> ：</span>
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
	</div>
	<div class="moudle">
		<i class="success"></i>
		<h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
		<p><br/></p>
	</div>
	<div><button class="submit"><@spring.messageText "safety.text48" "下一步"/></button></div>
</div>
</script>
<script>
	$(function(){
		function bysecurityquestion(){
			var verifyDater;
			var inMoudle=0;
			$('#by-security').on('click', function(event) {
				event.preventDefault();
				inMoudle=0;
				var content = alertText("#by-security-html");
		    	alertFunc({
		    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
		    		contents:content
		    	});
		    	$.ajax({
					url: '/v2/user/questions/mine',
					type: 'get',
					data:{},
					success: function(data){
						// if(0 == data.status){
							//console.log(data);
							var qu = $("#Verify-question-box").find('.question')
							for (var i = 0; i < qu.length; i++) {
	  							qu.eq(i).text(data[i].info).attr('id-name', data[i].id);
	  						}
	  						
	  					// }else{
	  					// 	alertBoxFunc(data.error.message,'sure');
	  					// }
					},
					fail: function (status) {
			            location.reload();
			        }
		 		})
		    	changeMoudle();
			})
			
			$(document).on('click','#alert-security .submit', function(event) {
	    		var self = $(this);
	    		event.preventDefault();
	    		var moudles = $("#alert-security").find('.moudle');
	    		//console.log(inMoudle+"/"+moudles.length);
	    		//console.log(moudles.length);
    			if(inMoudle==0){
    				var verifyQu = $("#Verify-question-box").find('.question');
    				var verifyAn = $("#Verify-question-box").find('div input[type="text"]');
    				var verifyQuestionArry = [];
    				var verifyAnswerArry=[];
    				for (var i = 0; i < verifyQu.length; i++) {
    					verifyQuestionArry.push(verifyQu.eq(i).attr("id-name"));
    					verifyAnswerArry.push(verifyAn.eq(i).val());
    				};
    				verifyDater=arryPus(verifyQuestionArry,verifyAnswerArry);
    				$.ajax({
    					url: '/v2/user/questions/checks',
    					type: 'post',
    					data:{
    						data: verifyDater.join(";")
    					},
    					success: function(data){
    						if(0 == data.status){
	    						//console.log(data);
	    						inMoudle++ ;
    							changeMoudle();
    							
    						}else{
	  							alertBoxFunc(data.error.message,'sure');
	  						}
    					},
						fail: function (status) {
				            location.reload();
				        }
    				})
    			}
    			else if(inMoudle==1){
		    		var newPassword = $("#alert-security").find('.password input[type="password"]');
		    		var newPasswordagain = $("#alert-security").find('.passwordagain input[type="password"]');
		    		$("#alert-security").find('p.warning').text("");
		    		if( !isLoadPassword(newPassword.val())){
		    			//$("#alert-security").find('.password p.warning').text("长度在6~16个字符含字母和数字的密码");
		    			newPassword.val("").focus();
		    			newPasswordagain.val("");
		    		}
		    		if(newPassword.val()!=newPasswordagain.val()){
		    			$("#alert-security").find('.passwordagain p.warning').text('<@spring.messageText "safety.text28" "两次输入密码不一样"/>');
		    			newPasswordagain.val("").focus();
		    		}
		    		if(isLoadPassword(newPassword.val())&&newPassword.val()==newPasswordagain.val()){
		    			var pwd = encodeURIComponent(ENCRYPT.encrypt(newPassword.val()));
						$.ajax({
							type: 'post',
							url: '/v2/user/password_question',
							data:{
								password: pwd,
								data: verifyDater.join(";"),
							},
							success: function(data){
								if(0 == data.status){
			  						$('#alertBox').remove();
			  						var contentSuccess = alertText("#success-html");
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
    			}
	    	});
			
			function changeMoudle (){
				var taber = $("#alert-security").find('.taber div');
	    		taber.eq(inMoudle).addClass('active');
	    		var moudles = $("#alert-security").find('.moudle');
	    		moudles.eq(inMoudle).show().siblings('.moudle').hide();
	    	};
		}
		bysecurityquestion();
	})
//获取emaillink
	$(document).on('click','.alertInputBox .get-emaillink', function(){
		var self = $(this);
		self[0].setAttribute("disabled", true);
		$.get('/v2/user/email_code', function(data){
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
				
			}else{
				self[0].removeAttribute("disabled");
				alertBoxFunc(data.error.message, "sure");
			}
		});
	});
</script>
<!-- by securityquestion end -->
<!-- by 邮箱 -->
<script type="text/alert-template" id="by-email-html">
<div class="alertInputBox" id="alert-email">
	
	<div class="moudle">
		<i class="success"></i>
		<h3><@spring.messageText "safety.text90" "已发送修改链接至您的"/>  <@spring.messageText "safety.text57" "邮箱"/> </h3>
		<p><@spring.messageText "safety.text91" "请在您的邮件内点击链接进行密码修改。"/></p>
		<p class="gray"><@spring.messageText "safety.text55" "如果没收到邮件，请查收垃圾邮件或点击重新获取"/></p>
		<p><br/></p>
	</div>
	<div><button class="backto"><@spring.messageText "safety.text59" "返回安全中心"/></button><input type="button" class="get-emaillink" value="<@spring.messageText "safety.text60" "重新获取"/>"></div>
</div>
</script>
<script>
	$(function(){
		var inMoudle=0;
		$(document).on('click','#by-email', function(event) {
			event.preventDefault();
	     	$.ajax({
				url: '/v2/user/email_code',
				type: 'GET',
				data:{},
				success: function(data){
				 	if(0 == data.status){
						var content = alertText("#by-email-html");
				    	alertFunc({
				    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text13" "设置登录密码"/>',
				    		contents:content,
				    		width:620
				    	});
    					//console.log(emailX);
    					var emailData = toX(data.data)
    					$("#alert-email").find('h3').html('<@spring.messageText "safety.text90" "已发送修改链接至您的"/>  <b class="blue">'+emailData+'</b> <@spring.messageText "safety.text57" "邮箱"/> ');
    					
				 	}else{
				 			alertBoxFunc(data.error.message,'sure');
				 		}
				},
				fail: function (status) {
		            location.reload();
		        }
			})
		})
	})
</script>
<!-- by邮箱 end -->
</#macro>
