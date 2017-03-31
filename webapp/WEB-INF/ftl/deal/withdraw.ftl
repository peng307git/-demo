<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "withdrawal.text2" "比特币提现"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/withdraw.css" />
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_withdraw" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
    	<div class="bd-inner">
	    	<div class="page-title">
	    		<h2><@spring.messageText "info.text2" "核心管理"/></h2>
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="col-m">
	    			<div class="m-wrap">
	    				<div class="withdraw-form">
	    					<form action="/deal/withdraw/btc" method="post" id="withdraw-form" autocomplete="off">
	    						<div class="form-item">
									<label class="form-label">BTC <@spring.messageText "withdrawal.text3" "提现地址"/>:</label>
									<div class="form-content">
										<input type="text" class="form-input" id="input-address" name="input-address" />
										<p></p>
									</div>
								</div>
								<div class="form-item">
									<label class="form-label"><@spring.messageText "withdrawal.text4" "可提现最大金额"/>:</label>
									<div class="form-content">
										<div class="form-text" id="form_val">${balance}</div>
										<p></p>
									</div>
								</div>
								<div class="form-item">
									<label class="form-label"><@spring.messageText "withdrawal.text5" "提币数量"/>:</label>
									<div class="form-content">
										<input type="text" class="form-input" id="input-amount" name="input-amount" />
										<p></p>
									</div>
								</div>
								<div class="form-item">
									<label class="form-label"><@spring.messageText "withdrawal.text6" "网络手续费"/>:</label>
									<div class="form-content">
										<div class="form-text">${service_charge}</div>
										<p></p>
									</div>
								</div>
								<div class="form-item">
									<label class="form-label"><@spring.messageText "withdrawal.mg.text12" "实际到账"/>:</label>
									<div class="form-content">
										<div class="form-text" type="text" id="arrival-amount" name="arrival-amount" />
											0
										</div>
									</div>
								</div>
								<#if isPayPassword ?exists >
								<input type="hidden" val="1" id="isPayPassword">
								<div class="form-item">
									<label class="form-label"><@spring.messageText "enter.paypassword" "请输入支付密码:"/></label>
									<div class="form-content">
										<input type="password" class="form-input" id="input-payPassword" name="input-Paypassword" />
										<a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>
										<p></p>
									</div>
								</div>
								</#if>
								<#if vcodeon?exists >
								<div class="form-item">
									<label class="form-label"><@spring.messageText "withdrawal.text7" "短信验证码"/>:</label>
									<div class="form-content">
										<input type="text" class="form-input isnumber" id="input-smsVCode" name="input-smsVCode" />
										<input type="button" name="sendcode" id="sendcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" class="btn-sendvcode"/>
										<p></p>
									</div>
								</div>
								</#if>
                            	<#if googlecodeon?exists >
								<div class="form-item">
									<label class="form-label"><@spring.messageText "safety.text108" "谷歌验证码"/>:</label>
									<div class="form-content">
										<input type="text" class="form-input isnumber" id="input-googlecode" name="input-googlecode" />
										<p></p>
									</div>
								</div>
								</#if>
								<div class="form-item form-note" id="form-note">
									<label class="form-label"><@spring.messageText "withdrawal.email1" "接收邮件地址"/>:</label>
									<div class="form-content">
										<input type="text" class="form-input" id="received-email" name="received-email" placeholder='<@spring.messageText "withdrawal.email2" "请输入您的常用邮箱地址"/>' />
										<p class="judge-note"><em>&times;</em><@spring.messageText "withdrawal.email3" "请输入正确的邮箱地址"/></p>
									</div>
								</div>
								<div class="form-item">
									<label class="form-label">&nbsp;</label>
									<div class="form-content">
										<input type="submit" class="form-submit" name="phone_number" value="<@spring.messageText "withdrawal.text8" "确认提现"/>" />
										<label for="received-email-btn" class="received-email-btn"><input type="checkbox" name="received-email-btn" id="received-email-btn"/><@spring.messageText "withdrawal.email4" "出账时邮件通知我"/></label>
										<p></p>
									</div>
								</div>
	    					</form>
	    				</div>
	    				<div class="withdraw-list">
	    					<div class="withdraw-list-title">
	    						<h5>BTC <@spring.messageText "withdrawal.text9" "提现记录"/></h5>
	    					</div>
	    					<div class="withdraw-list-content">
	    						<div class="mod-table">
	    							<div class="table-thead">
	    								<div class="table-th withdraw-tr-time">
	    									<@spring.messageText "withdrawal.text10" "提现时间"/>
	    								</div>
	    								<div class="table-th withdraw-tr-amount">
	    									<@spring.messageText "withdrawal.text11" "提现金额"/>
	    								</div>
	    								<div class="table-th withdraw-tr-fee">
	    									<@spring.messageText "withdrawal.text6" "网络手续费"/>
	    								</div>
	    								<div class="table-th withdraw-tr-address">
	    									<@spring.messageText "withdrawal.text3" "提现地址"/>
	    								</div>
	    								<div class="table-th withdraw-tr-status">
	    									<@spring.messageText "withdrawal.text12" "提现状态"/>
	    								</div>
	    								<div class="table-th withdraw-tr-desc">
	    									<@spring.messageText "withdrawal.text13" "描述"/>
	    								</div>
	    							</div>
	    							<div class="table-tbody" id="table-tbody">
	    							
	    							</div>
	    							<div class="table-pager">
	    						
	    					</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-s">
	    			<#include "common/assets_side_nav.ftl" >
	    		</div>
	    	</div>
	    </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</#macro>

<#macro footerjs>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<script>
   
	$(function(){
		var isPayPassword = $("#isPayPassword").attr('val');
		//输入提币数量
		$('#input-amount').on('keyup', function(){
            var val = $(this).val();
            var btcbalance = parseFloat($("#form_val").text());
			if (!/^\d+[.]?\d{0,8}$/.test()){
		        $(this).val(/^\d+[.]?\d{0,8}/.exec(val));
		    }
		    if (parseFloat($(this).val()) > btcbalance) {
				$(this).parent().find('p').html('<i style="float:left"> *  <@spring.messageText "withdrawal.mg.text8" "您的余额不足" /></i>');	
				return;
			}else{
				$(this).parent().find('p').html('');
			}
		    var poundageVal= ($('#input-amount').val()-0.001).toFixed(8);
		    if (poundageVal< 0) {
		    	poundageVal = 0;
		    };
		    $("#arrival-amount").html(poundageVal);
		});
		//发送验证码
		$('#sendcode').on('click', function(){
            var self = $(this);
			var btcAddress = $("#input-address").val();
			if (btcAddress == "" || btcAddress == null) {
				alertBoxFunc("<@spring.messageText "withdrawal.text17" "提现地址不能为空"/>", "sure");
				return;
			}
			
			var btcAmount = $("#input-amount").val();
			var formvalue = $('#form_val').html();   //可提现总数
			if (btcAmount == "" || btcAmount == null) {
				alertBoxFunc("<@spring.messageText "withdrawal.text18" "提币数量不能为空"/>", "sure");
				return;
			} else if(  btcAmount < 0.002 ){
				alertBoxFunc("<@spring.messageText "withdrawal.text22" "提币数量必须大于"/> 0.002", "sure");
				return;
			}
            else if(  parseFloat(btcAmount) > parseFloat(formvalue) ){
            	alertBoxFunc("<@spring.messageText "withdrawal.mg.text8" "您的余額不足"/>","sure");
            	return;
            }
			
			if (isNaN(btcAmount)) {
				alertBoxFunc("<@spring.messageText "withdrawal.text19" "提币数量不是数字"/>", "sure");
				return;
			}
			
			if(isPayPassword==1){
				var payPassword = $("#input-payPassword").val();
				if (payPassword == "" || payPassword == null) {
					alertBoxFunc("支付密码不能为空！", "sure");
					return;
				}
			}
			$.ajax({
				url : '/deal/sms/vercode',
				type : 'POST',
				success : function(data) {		
					if (data.status == 0) {
						var wait = 60;
						self[0].setAttribute("disabled", true);
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
						alertBoxFunc(data.error.message, "sure");
					}
				},
				error : function() {
					alert("函数执行错误！");
				}
			});
		});
		//出账时邮箱通知 按钮事件
		$('#received-email-btn').on('click',function(event){
            $('#form-note').toggle();
        });
		//确认提现
		$('#withdraw-form').on('submit', function(e){
			e.preventDefault();
			var btcAddress = $("#input-address").val();
			if (btcAddress == "" || btcAddress == null) {
				alertBoxFunc("<@spring.messageText "withdrawal.text17" "提现地址不能为空"/>", "sure");
				return;
			}
			
			var btcAmount = $("#input-amount").val();
			if (btcAmount == "" || btcAmount == null) {
				alertBoxFunc("<@spring.messageText "withdrawal.text18" "提币数量不能为空"/>", "sure");
				return;
			}else if( btcAmount < 0.002 ){
				alertBoxFunc("<@spring.messageText "withdrawal.text22" "提币数量必须大于"/> 0.002", "sure");
				return;
			}
			
			if (isNaN(btcAmount)) {
				alertBoxFunc("<@spring.messageText "withdrawal.text19" "提币数量不是数字"/>", "sure");
				return;
			}

			if(isPayPassword==1){
				var payPassword = $("#input-payPassword").val();
				if (payPassword == "" || payPassword == null) {
					alertBoxFunc("支付密码不能为空！", "sure");
					return;
				}
			}

			var smsVCode = $("#input-smsVCode").val();
			if (smsVCode == "" ) {
				alertBoxFunc("<@spring.messageText "withdrawal.text21" "短信验证码不能为空"/>", "sure");
				return;
			}

			var googlecode = $("#input-googlecode").val();
			if (googlecode == "" ) {
				alertBoxFunc("<@spring.messageText "safety.text111" "请输入谷歌验证码"/>", "sure");
				return;
			}
			//是否有邮件
			var email = '';
			if($('#received-email-btn').is(':checked')){
				 var mailCon = $('#received-email').val();
	        	     var reg = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
	        	     if(!reg.test(mailCon)){
	        	     	$('.judge-note').show();
	        	     	return;
	        	     }else{
	        	     	$('.judge-note').hide();
	        	     	email = $('#received-email').val();
	        	     }
			}
			//按钮置灰
			$(".form-submit").attr('disabled',"true");
			payPassword = encodeURIComponent(ENCRYPT.encrypt(payPassword));
			$.ajax({
				type : "post",
				url : '/deal/withdraw/btc',
				data : {
					'btc_address' : btcAddress,
					'amount' : btcAmount,
					'sms_v_code' : smsVCode,
					'payPassword':payPassword,
					'googlecode':googlecode,
					'email':email
				},
				dataType : "json",
				success : function(msg) {
					if (msg.status == 0) {
						alertBoxFunc(msg.data, "sure", function() {
							window.location = "/deal/withdraw/btc";
						});
					} else {
						$(".form-submit").removeAttr("disabled");
						alertBoxFunc(msg.error.message, "sure");
					}
				},
				error : function(err) {
					$(".form-submit").removeAttr("disabled");
					console.log(err);
				}
			});
		});
		//提现记录分页
		var paging = new pagingFunc({
        	pageBox:".table-pager",
        	ajaxUrl:"/deal/withdraw/list",
        	type: "Get",
        	pageKey:"withdraw_page",
			sizeKey:"withdraw_size",
        	size:20, 
        	mode:"Server", 
			intoBox : function(data){ //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。
	        	var datar = data.rows;
	        	var htmlT="";
	        	if (datar==null || datar.length <= 0) {
					htmlT='<div class="table-tr clearfix">'+'<@spring.messageText "withdrawal.text100" "您暂时没有提现记录 "/>'+'</div>';
            	} else{
					for(var i = 0 ; i < datar.length ; i++){
						var addTime = datar[i].addTime ;
        				var amount = datar[i].amount ;
        				var fee =${service_charge};
        				var address = datar[i].btcAddress;
						var confirm = datar[i].confirm;
						var status = datar[i].status;
        				htmlT += '<div class="table-tr clearfix">'+
									'<div class="table-td withdraw-tr-time">'+ addTime +'</div>'+
									'<div class="table-td withdraw-tr-amount"> '+ amount+' </div>'+
									'<div class="table-td withdraw-tr-fee"> '+fee+' </div>'+
									'<div class="table-td withdraw-tr-address"> '+address+' </div>'+
									'<div class="table-td withdraw-tr-status">';
						if (status==1) {
							htmlT += '<@spring.messageText "withdrawal.text14" "已提现成功"/>';
						} else{
							htmlT += '<@spring.messageText "withdrawal.text15" "待确认"/>';
						};
						htmlT +=    '</div>'+
									'<div class="table-td withdraw-tr-desc"> <@spring.messageText "withdrawal.text16" "提现确认数"/>：'+confirm+' </div>'+
								'</div>' ;
					}
				};
				$("#table-tbody").html(htmlT);
	        }
        });
		//地址验证
		$("#input-address").on('blur', function(event) {
			var valer = $(this).val().toString().split("");
			if(valer[0]!=1&&valer[0]!=3){
				//console.log(valer[0])
				$(this).parent().find('p').html('<i style="float:left">BTC <@spring.messageText "withdrawal.text29" "地址错误，请重新输入。"/></i>')
			}else{
				$(this).parent().find('p').html('');
			}
		});
		$(document).on('keypress','.isnumber',function(event) {
			var eventObj = event || e;
		    var keyCode = eventObj.keyCode || eventObj.which;
		    if (keyCode == 46  || ((keyCode >= 48 && keyCode <= 57)|| keyCode == 8||keyCode==0)) {
		    	//console.log(keyCode);
		    	return true;
		    }else{
		    	return false;
		    }
		});
		$(document).on('keyup','.isnumber', function(){
            var val = $(this).val();
			if (!/^\d{0,6}$/.test()){
		        $(this).val(/^\d{0,6}/.exec(val));
		    }
		})
	});
</script>
</#macro>
