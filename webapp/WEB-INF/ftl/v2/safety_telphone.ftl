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
	    			<div class="m-wrap">
	    				<div class="detail">
				    		<h3><@spring.messageText "safety.text75" "请选择验证方式"/></h3>
				    		<div class="title"><@spring.messageText "safety.text26" "您正在为"/><span class="blue">${user.telephone}</span><@spring.messageText "safety.text10" "修改"/><@spring.messageText "safety.text4" "绑定手机"/>，<@spring.messageText "safety.text75" "请选择验证方式"/></div>
				    		<ul>
				    			<li>
				    				<p class="telphone">
				    					<span></span>
				    					<b><@spring.messageText "safety.text76" "通过绑定手机号"/></b>
				    					<em></em>
				    					<button  id="by-phone" class="Modify"><@spring.messageText "safety.text77" "立即修改"/></button>
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
				    			<#else>
				    			<li>
				    				<p class="securityquestion">
				    					<span></span>
				    					<b><@spring.messageText "safety.text78" "通过密保问题"/></b>
				    					<em></em>
				    					<button class="graybtn Modify"><@spring.messageText "safety.text77" "立即修改"/></button>
				    				</p>
				    			</li>
				    			</#if>
				    			<!-- <li>
				    				<p class="artificial">
				    					<span></span>
				    					<b><@spring.messageText "safety.text79" "通过人工服务"/></b>
				    					<em><@spring.messageText "safety.text80" "我们会在提交申请材料后24小时内回复，请耐心等待。"/></em>
				    					<button id="by-artificial"><@spring.messageText "safety.text77" "立即修改"/></button>
				    				</p>
				    			</li> -->
				    		</ul>
				    		<div class="warning"><i></i><@spring.messageText "safety.text81" "修改手机号后72小时内不允许提现BTC、MG操作，24小时内不允许出售MG、MP解包转移。"/></div>
				    	
				    	<a href="/v2/user/safety/into" class="button backsafety"><@spring.messageText "safety.text59" "返回安全中心"/></a>
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
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script src='/static/js/business/addressCountry.js'></script>
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
	
	function getNewVcode(box){
		var dataNum=[86,60,91,62,84,886,850,82,63,66,855,65,81,93,54,61,43,880,375,32,55,95,1345,56,57,242,53,357,420,45,593,20,251,679,358,33,241,49,233,30,224,509,852,36,354,98,353,972,39,1876,327,254,965,331,856,371,961,231,370,261,960,52,377,976,212,674,977,31,64,227,234,47,968,92,507,51,48,351,1787,974,40,7,966,27,34,94,46,41,992,255,90,993,256,380,971,44,1,598,998,260,853]
    	var selectHtml=""
		for (var i = 0; i < dataNum.length; i++) {
			if (dataNum[i]==86) {
				selectHtml+='<option value="">'+'+'+dataNum[i]+'</option>';
			} else{
				selectHtml+='<option value="+'+dataNum[i]+' ">'+'+'+dataNum[i]+'</option>';
			};
		};
		$(box).find('select').html(selectHtml);
	}
</script>
<script type="text/alert-template" id="success-html">
<div class="alertInfoBox" id="alertInfoBox">
	<i class="success"></i>
	<h3><@spring.messageText "safety.text37" "设置成功！"/></h3>
	<button class="backto"><@spring.messageText "safety.text59" "返回安全中心"/></button></div>
</div>
</script>
<!-- by手机号 -->
<script type="text/alert-template" id="by-phone-html">
	<div class="alertInputBox" id="alert-telphone">
		
		<div class="vcode">
			<span><@spring.messageText "safety.text24" "手机验证码"/></span>
			<input type="text"/>
			<input type="button" class="get-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
			<p class="warning"></p>
		</div>
		
		<div class="newPhoneNum">
			<span><@spring.messageText "safety.text82" "新手机号"/></span>
			<select  class="country-code" id="countryCode3" >
			</select>
			<input class="only-number" type="text"/>
			<p class="warning"></p>
		</div>
		<div class="new-vcode">
			<span><@spring.messageText "safety.text83" "新手机验证码"/></span>
			<input type="text"/>
			<input type="button" class="get-new-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
			<p class="warning"></p>
		</div>
		<div><button class="submit"><@spring.messageText "safety.text3" "确定"/></button></div>
	</div>
</script>
<script>
$(function(){
	$('#by-phone').on('click', function(event) {
		event.preventDefault();
    	var content = alertText("#by-phone-html");
    	alertFunc({
    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text10" "修改"/><@spring.messageText "safety.text4" "绑定手机"/>',
    		contents:content,
    		width:650
    	})
    	var login=new addressCountry({id:"#countryCode3",showId:true});
    	 $("#countryCode3").val("86");
    	//getNewVcode("#alert-telphone");
    	$("#alert-telphone").on('click', '.get-new-vcode', function(event) {
			event.preventDefault();
			/* Act on the event */
			var newPhoneNum = $("#alert-telphone").find('.newPhoneNum input[type="text"]');
			var vcode = $("#alert-telphone").find('.vcode input[type=text]').val();
			//var googlecode = $("#alert-telphone").find('.googlecode input[type=text]').val();
			var self = $(this);
			self[0].setAttribute("disabled", true);
			if(isNamber(newPhoneNum.val())){
				$("#alert-telphone").find('.newPhoneNum p.warning').text("");
				if(vcode==""){
					self[0].removeAttribute("disabled");
					alertBoxFunc('<@spring.messageText "safety.text85" "请输入正确的手机验证码！"/>','sure');
					return;
				}
				// if(googlecode==""){
				// 	self[0].removeAttribute("disabled");
				// 	alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
				// 	return;
				// }
				var quhao = $("#alert-telphone").find('.newPhoneNum select').val()
				var newPhone="";
				if (quhao=="86") {
					newPhone = newPhoneNum.val()
				}else{
					newPhone = "+"+ quhao +" "+ newPhoneNum.val()
				}
				
				$.ajax({
					type: 'POST',
					url: '/v2/user/get_new_code',
					data:{
						phone:newPhone,
						code: vcode
						//,googlecode:googlecode
					},
					success: function(data){
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
					},
					fail: function (status) {
			            location.reload();
			        }
				});
				
			}else{
				self[0].removeAttribute("disabled");
				$("#alert-telphone").find('.newPhoneNum p.warning').text('<@spring.messageText "safety.text86" "请输入正确的手机号码！"/>');
			}
		});
		$("#alert-telphone").on('click','.submit', function(event) {
			event.preventDefault();
			var newPhoneNum = $("#alert-telphone").find('.newPhoneNum input[type="text"]');
			var vcode = $("#alert-telphone").find('.vcode input[type=text]').val();
			//var googlecode = $("#alert-telphone").find('.googlecode input[type=text]').val();
			var newVcode = $("#alert-telphone").find('.new-vcode input[type=text]').val();
			if(isNamber(newPhoneNum.val())){
				$("#alert-telphone").find('.newPhoneNum p.warning').text("");
				if(vcode==""){
					alertBoxFunc('<@spring.messageText "safety.text85" "请输入正确的手机验证码！"/>','sure');
					return;
				}
				// if(googlecode==""){
				// 	alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
				// 	return;
				// }

				var quhao = $("#alert-telphone").find('.newPhoneNum select').val() 
				var newPhone="";
				if (quhao=="86") {
					newPhone = newPhoneNum.val()
				}else{
					newPhone = "+"+ quhao +" "+ newPhoneNum.val()
				}
				$.ajax({
					type: 'POST',
					url: '/v2/user/telephone',
					data:{
						old_code:vcode,
						phone:newPhone,
						// googlecode:googlecode,
						code:newVcode
					},
					success: function(data){
						if(0 == data.status){
	  						var content2 = alertText("#success-html");
					    	alertFunc({
					    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text10" "修改"/><@spring.messageText "safety.text4" "绑定手机"/>',
					    		contents:content2
					    	})
	  					}else{
	  						alertBoxFunc(data.error.message,'sure');
	  					}
					},
					fail: function (status) {
			            location.reload();
			        }
				});
				
			}else{
				$("#alert-telphone").find('.newPhoneNum p.warning').text('<@spring.messageText "safety.text86" "请输入正确的手机号！"/>');
			}
		});
		$("#alert-telphone").on('blur','.vcode input[type="text"]', function(event) {
			$.ajax({
				url: '/v2/user/check_code',
				type: 'get',
				data:{
					code:$('#alert-telphone .vcode input[type="text"]').val()
				},
				success: function(data){
					if(0 == data.status){
							$("#alert-telphone").find('.vcode p.warning').text('');
						}else{
							$("#alert-telphone").find('.vcode p.warning').text('<@spring.messageText "safety.text85" "请输入正确的手机验证码！"/>');
						}
				},
				fail: function (status) {
		            location.reload();
		        }
			})
		})
	});
})
</script>
<!-- by手机号 end -->
<!-- by securityquestion  -->
<script type="text/alert-template" id="by-security-html">
<div class="alertInputBox" id="alert-security">
	<div class="taber">
		<div class="active"><@spring.messageText "safety.text40" "验证安全保护问题"/></div>
		<div><@spring.messageText "safety.text87" "输入手机号"/></div>
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
		<div class="newPhoneNum">
			<span><@spring.messageText "safety.text82" "新手机号"/></span>
			<select  class="country-code" id="countryCode2" >
			</select>
			<input class="only-number" type="text"/>
			<p class="warning"></p>
		</div>
		<div class="new-vcode">
			<span><@spring.messageText "safety.text83" "新手机验证码"/></span>
			<input type="text"/>
			<input type="button" class="get-new-vcode" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
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
		    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text10" "修改"/><@spring.messageText "safety.text4" "绑定手机"/>',
		    		contents:content
		    	});
		    	var login=new addressCountry({id:"#countryCode2",showId:true});
    	 		$("#countryCode2").val("86");
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
	  						//getNewVcode("#alert-security");
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
	    						console.log(data);
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
    				var phoneA = moudles.eq(1).find('.newPhoneNum input[type="text"]').val();
    				var phoneVcode = moudles.eq(1).find('.new-vcode input[type="text"]').val();
    				//console.log(toX("123456789"));
    				if(phoneA!=""){
    					if(phoneVcode!=""){
    						$.ajax({
		    					url: '/v2/user/telephone',
		    					type: 'post',
		    					data:{
		    						code:phoneVcode,
		    						data: verifyDater.join(";"),
		    						phone:phoneA
		    					},
		    					success: function(data){
		    						if(0 == data.status){
				  						var content2 = alertText("#success-html");
								    	alertFunc({
								    		title:'<@spring.messageText "safety.text26" "您正在为"/> <span class="blue">'+'${user.telephone}'+'</span> <@spring.messageText "safety.text10" "修改"/><@spring.messageText "safety.text4" "绑定手机"/>',
								    		contents:content2
								    	})
				  					}else{
				  						alertBoxFunc(data.error.message,'sure');
				  					}
		    					},
								fail: function (status) {
						            location.reload();
						        }
		    				})	
	    				}else{
	    					alertBoxFunc('<@spring.messageText "safety.text85" "请输入正确的手机验证码！"/>','sure');
	    					moudles.eq(1).find('.new-vcode input[type="text"]').focus();
	    				}
    				}else{
    					alertBoxFunc('<@spring.messageText "safety.text86" "请输入正确的手机号！"/>','sure');
    					moudles.eq(1).find('.newPhoneNum input[type="text"]').focus();
    				}
    			}
	    	});
			$(document).on('click', '#alert-security .get-new-vcode', function(event) {
				event.preventDefault();
				/* Act on the event */
				var newPhoneNum = $("#alert-security").find('.newPhoneNum input[type="text"]');
				
				var self = $(this);
				self[0].setAttribute("disabled", true);
				if(isNamber(newPhoneNum.val())){
					$("#alert-telphone").find('.newPhoneNum p.warning').text("");
					
					var quhao = $("#alert-security").find('.newPhoneNum select').val();
					var newPhone="";
					if (quhao=="86") {
						newPhone = newPhoneNum.val()
					}else{
						newPhone = "+"+ quhao +" "+ newPhoneNum.val()
					}
						$.ajax({
							type: 'post',
							url: '/v2/user/get_new_code_q',
							data:{
								phone:newPhone,
								data: verifyDater.join(";")
							},
							success: function(data){
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
							},
							fail: function (status) {
					            location.reload();
					        }
						});
				}else{
					self[0].removeAttribute("disabled");
					$("#alert-telphone").find('.newPhoneNum p.warning').text('<@spring.messageText "safety.text86" "请输入正确的手机号！"/>');
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
</script>
<!-- by securityquestion end -->
<!-- <script type="text/alert-template" id="artificial-html">
<div class="alertInfoBox" id="alertInfoBox">
	<i class="success"></i>
	<h3>提交申请成功！</h3>
	<p class="gray">我们会在提交申请材料后24小时内回复，请耐心等待。</p>
	<br/><br/>
	<button class="backto">返回安全中心</button></div>
</div>
</script>
<script>
	$(function(){
		$('#by-artificial').on('click', function(event) {
			event.preventDefault();
	    	var content = alertText("#artificial-html");
	    	alertFunc({
	    		title:"您正在为 <span class='blue'>"+"${user.telephone}"+"</span> 绑定手机号",
	    		contents:content
	    	})
	    })
	})
</script> -->
</#macro>
