<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "asset.text1" "资产管理"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/soldmg.css" />
</#macro>

<#macro body>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_sell" >
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
	    				<div class="mg-sales clearfix">
	    					<div class="mg-sales-countdown">
	    						<h5><@spring.messageText "soldmg.text11" "收购总量刷新倒计时"/></h5>
	    						<p><span id="countdown-hour"></span><@spring.messageText "soldmg.text12" "小时"/><span id="countdown-minute"></span><@spring.messageText "soldmg.text13" "分"/><span id="countdown-second"></span><@spring.messageText "soldmg.text14" "秒"/></p>
	    					</div>
	    					<div class="mg-sales-total">
	    						<h5><@spring.messageText "soldmg.text15" "今日全球MG收购总量"/></h5>
	    						<p>${globalOneDayTotalMG} MG</p>
	    					</div>
	    					<div class="mg-sales-date">
	    						<div class="mg-sales-date-year">
	    						<span id="current-month"></span>&nbsp;&nbsp;<span id="current-year"></span>
	    						</div>
	    						<div class="mg-sales-date-day">
	    						<span id="current-day"></span>
	    						</div>
	    						<div class="mg-sales-date-week">
	    							<span id="current-weekday" class='current-weekday'></span>
	    						</div>
	    					</div>
	    				</div>
	    				<div class="mg-price clearfix">
	    					<div class="mg-status-item">
                    			<h5><@spring.messageText "soldmg.text1" "今日MG价格"/></h5>
                    			<p>$${todayMGPrice}<span class="mg-price-tip-btn"></span></p>
                    		</div>
                    		<div class="mg-status-item">
                    			<h5><@spring.messageText "soldmg.text2" "昨日MG价格"/></h5>
                    			<p>$${yesterdayMGPrice}</p>
                    		</div>
                    		<div class="mg-status-item">

                    			<h5><@spring.messageText "soldmg.text51" "今日涨跌"/></h5>
                    			<p class="price-change <#if todayMGratio lt 0>price-change-down</#if>">${todayMGratio}%</p>
                    		</div>
                    
                            <div class="mg-status-item">
                                <h5><@spring.messageText "soldmg.text50" "历史涨跌"/></h5>
                                <p class="price-change<#if historyMGratio lt 0>price-change-down</#if>">${historyMGratio}%</p>
                            </div>
                            <div class="mg-price-tip">
                            	<span></span>
                                <p><@spring.messageText "soldmg.text44" "1.MG价格与MN成本价格、MG认证难度系数有关"/></p>
                                <div>
                                    <p>2.<@spring.messageText "soldmg.pricetip.text11" "计算公式"/></p>
                                    <table>
                                        <tr>
                                            <td><@spring.messageText "soldmg.pricetip.text1" "难度"/></td>
                                            <td><@spring.messageText "soldmg.pricetip.text2" "当前认证难度系数区间内MP基本价格"/></td>
                                            <td><@spring.messageText "soldmg.pricetip.text3" "最高MP基本价格"/></td>
                                        </tr>
                                        <tr>
                                            <td>0</td>
                                            <td><@spring.messageText "soldmg.pricetip.text4" "100美金"/></td>
                                            <td><@spring.messageText "soldmg.pricetip.text4" "100美金"/></td>
                                        </tr>
                                        <tr>
                                            <td>0%~1000%</td>
                                            <td><@spring.messageText "soldmg.pricetip.text5" "100美金+100美金*當前認證難度系數*10%"/></td>
                                            <td><@spring.messageText "soldmg.pricetip.text6" "200美金"/></td>
                                        </tr>
                                        <tr>
                                            <td>1000%~2000%</td>
                                            <td><@spring.messageText "soldmg.pricetip.text7" "200美金+100美金*(當前認證難度系數-1000%)*10%×50%"/></td>
                                            <td><@spring.messageText "soldmg.pricetip.text8" "250美金"/></td>
                                        </tr>
                                        <tr>
                                            <td>2000%~3000%</td>
                                            <td><@spring.messageText "soldmg.pricetip.text9" "250美金+100美金*(當前認證難度系數-2000%)*10%×25%" /></td>
                                            <td><@spring.messageText "soldmg.pricetip.text10" "275美金"/></td>
                                        </tr>
                                        <tr>
                                            <td>...</td>
                                            <td>...</td>
                                            <td>...</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
	    				</div>
	    				<div class="mg-sell-form">
	    					<form action="" method="POST" id="mg-sell-form">
                    			<div class="form-item">
                    				<label class="form-label"><@spring.messageText "soldmg.text5" "智慧基因出售单价:"/></label>
                    				<div class="form-content">
                    					<span class="form-text">$${basedPricingMG}</span>
                    				</div>
                    			</div>
                    			<div class="form-item">
                    				<label class="form-label"><@spring.messageText "soldmg.text6" "出售数量:"/></label>
                    				<div class="form-content">
                    					 <input type="text" value="1" class="form-input" id="mgCount" name="mgCount"  /> MG
                    				</div>
                    			</div>
                    			<div class="form-item">
                    				<label class="form-label"></label>
                    				<div class="form-content form-notice">
                    					<span class="form-text"> <@spring.messageText "soldmg.text36" "单次最小出售MG数量："/> <i>${minSoldAmountPerTime}MG</i><br><@spring.messageText "soldmg.text37" "每天累计出售限额："/> <i>${maxSoldAmountPerDay}MG </i> &nbsp;&nbsp;&nbsp;&nbsp;<@spring.messageText "soldmg.text38" "今日还可出售："/> <i>${lastSoldMgAmount}MG</i></span>
                    				</div>
                    			</div>
                    			<div class="form-item">
                    				<label class="form-label"><@spring.messageText "soldmg.text7" "收到(预估):"/></label>
                    				<div class="form-content">
                    					<span class="form-text"><span id="btcCount">${basedPricingMG/btcUsdPrice}</span> <@spring.messageText "soldmg.text8" "BTC"/></span>
                    				</div>
                    			</div>
                    			<div class="form-item">
                    				<label class="form-label">&nbsp;</label>
                    				<div class="form-content">
                    					<a class="btn-submit-sell" href="###"><@spring.messageText "soldmg.text9" "出售智慧基因"/></a>
                    				</div>
                    			</div>
                    			<input type="hidden" id="availableMG" name="availableMG" value="${availableMG}">
                    		</form>
	    				</div>
	    				<div class="soldmg-list">
	    					<div class="soldmg-list-title">
	    						<h5><@spring.messageText "sold.mg.text12" "出售记录" /></h5>
	    					</div>
	    					<div class="soldmg-list-summary">
	    						<@spring.messageText "sold.mg.text13" "总计" />：<span><@spring.messageText "sold.mg.text14" "出售数量" />：${sold_mg_sum} </span> <span><@spring.messageText "sold.mg.text15" "收获" />BTC：${sold_btc_sum?string('0.00000000')}</span>
	    					</div>
	    					<div class="soldmg-list-content">
	    						<div class="mod-table">
	    							<div class="table-thead">
	    								<div class="table-th soldmg-tr-time">
	    									<@spring.messageText "sold.mg.text16" "出售时间" />
	    								</div>
	    								<div class="table-th soldmg-tr-price">
	    									<@spring.messageText "sold.mg.text17" "单价（美元）" />
	    								</div>
	    								<div class="table-th soldmg-tr-number">
	    									<@spring.messageText "sold.mg.text18" "出售数量" />
	    								</div>
	    								<div class="table-th soldmg-tr-income">
	    									<@spring.messageText "sold.mg.text19" "收入（BTC）" />
	    								</div>
	    							</div>
	    							<div class="table-tbody" id="table-tbody">
		    								
	    							</div>
	    						</div>
	    					</div>
	    					<div class="table-pager">
	    						
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
<#if isPayPassword ?exists >
<input type="hidden" val="1" id="isPayPassword">
<#else>
<input type="hidden" val="0" id="isPayPassword">
</#if>
<script>
	$(function(){
		var basedPricingMG = parseFloat("${basedPricingMG?string('0.00000000')}");
		var btcUsdPrice = parseFloat('${btcUsdPrice}');
		var csrfToken = '${CSRFToken}';
		var canBtnSellMgClick = 1;

		function accMul(arg1, arg2) {
		    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
		    try {
		        m += s1.split(".")[1].length;
		    }
		    catch (e) {
		    }
		    try {
		        m += s2.split(".")[1].length;
		    }
		    catch (e) {
		    }
		    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
		}
		
		// 给Number类型增加一个mul方法，调用起来更加方便。
		Number.prototype.mul = function (arg) {
		    return accMul(arg, this);
		};
		
		function accDiv(arg1, arg2) {
		    var t1 = 0, t2 = 0, r1, r2;
		    try {
		        t1 = arg1.toString().split(".")[1].length;
		    }
		    catch (e) {
		    }
		    try {
		        t2 = arg2.toString().split(".")[1].length;
		    }
		    catch (e) {
		    }
		    with (Math) {
		        r1 = Number(arg1.toString().replace(".", ""));
		        r2 = Number(arg2.toString().replace(".", ""));
		        return (r1 / r2) * pow(10, t2 - t1);
		    }
		}
		
		//给Number类型增加一个div方法，调用起来更加方便。
		Number.prototype.div = function (arg) {
		    return accDiv(this, arg);
		};

		$('#btcCount').html(accDiv(basedPricingMG, btcUsdPrice).toFixed(8));
		//输入mg出售数量
		$('#mgCount').on('keyup', function(){
			var val = $(this).val();
			if (!/^\d+[.]?\d{0,4}$/.test()){
		        $(this).val(/^\d+[.]?\d{0,4}/.exec(val));
		    }
		    var dollarCount = accMul(basedPricingMG,$(this).val());
		    var btcCount = accDiv(dollarCount, btcUsdPrice);
		    $('#btcCount').html(btcCount.toFixed(8));
		});
		
		//出售mg


		$('.btn-submit-sell').on('click', function(){
			var availableMG = parseFloat($('#availableMG').val());
			var sellCount = parseFloat($('#mgCount').val());
			if(availableMG < sellCount){
				alertBoxFunc('<@spring.messageText "soldmg.text39" "MG余额不足"/>', "sure");
				return false;
			}
			if ( $('#mgCount').val()==0) {
				alertBoxFunc('<@spring.messageText "soldmg.text40" "出售数量不能为"/>0', "sure");
				return false;
			};
			if ( $('#mgCount').val()< ${minSoldAmountPerTime} ) {
				alertBoxFunc('<@spring.messageText "soldmg.text41" "MG数量不能小于"/>100', "sure",function(){
						$('#mgCount').val("${minSoldAmountPerTime}");
				});
				return false;
			};
			if ( $('#mgCount').val()> ${lastSoldMgAmount} ) {
				alertBoxFunc('<@spring.messageText "soldmg.text42" "您累计出售的mg已经超出每日限定额度"/> ,<@spring.messageText "soldmg.text43" "请核对本次需要出售的mg数量"/>', "sure",function(){
					$('#mgCount').val("${lastSoldMgAmount}");
				});
				return false;
			};
            var isPayPassword = $("#isPayPassword").attr('val');
			var html = [
				'<div class="modal fade" id="sellModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
				  '<div class="modal-dialog modal-mid" role="document">',
				    '<div class="modal-content">',
				      '<div class="modal-header">',
				        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
				        '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "buythen.text5008" "订单信息确认"/></h4>',
				      '</div>',
				      '<div class="modal-body">',
				        '<form>',
                            <#if vcodeon?exists >
				            '<div class="form-group" id="vcode-box">',
                                '<span><@spring.messageText "buythen.text5050" "手机验证码"/>:</span>',
				          	    '<input type="text" class="input-vcode" placegolder="<@spring.messageText "buythen.text5050" "手机验证码"/>"/>',
				          	    '<input type="button" class="btn-get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" />',
				            '</div>',
                            </#if>
                            <#if googlecodeon?exists >
                            '<div class="form-group" id="googlecode-box">',
                                '<span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>',
                                '<input type="text" class="input-googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">',
                            '</div>',
                            </#if>
                            '<div class="form-group" id="pay-password-box">',
                                '<input type="password" class="pay-password"  placeholder="<@spring.messageText "buythen.text5052" "请输入支付密码"/>" />',
                                ' <a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>',
                            '</div>',
				            '<div class="form-group btn-open-wrap">',
				                '<a class="btn-buy-mp" href="###"><@spring.messageText "sale.conformation" "确认出售"/></a>',
				            '</div>',
				        '</form>',
				      '</div>',
				    '</div>',
				  '</div>',
				'</div>'
			].join('');
			$(document.body).append(html);
			$('#sellModal').modal('show');
			$('#sellModal').on('hidden.bs.modal', function(){
				$(this).remove();
			});
            console.log(isPayPassword);
            if(isPayPassword==0){
                $("#vcode-box").show();
                $("#googlecode-box").show();
                $("#pay-password-box").hide();
            }else if(isPayPassword==1){
                $("#vcode-box").hide();
                $("#googlecode-box").hide();
                $("#pay-password-box").show();
            }
			$('#sellModal .btn-get-vcode').on('click', function(){
				var self = $(this);
				self[0].setAttribute("disabled", true);
				$.get('/user/getSmsCodeConsume/3', function(data){
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
			$('#sellModal .btn-buy-mp').on('click', function(){
				if(!canBtnSellMgClick) return;
				if(isPayPassword==0){
                    if ($('#sellModal .input-vcode').val()=="") {
                        alertBoxFunc('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>','sure');
                        return;
                    }
                    if ($('#sellModal .input-googlecode').val()=="") {
                        alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
                        return;
                    }
                }else if(isPayPassword==1){
                    if ($('#sellModal .pay-password').val()=="") {
                        alertBoxFunc('支付密码不能为空！','sure')
                        return;
                    }
                }

				canBtnSellMgClick = 0;
				payPassword = encodeURIComponent(ENCRYPT.encrypt(payPassword));
				$.ajax({
					type: 'post',
					url: '/deal/soldmg',
					data:{
						mgCount: $('#mgCount').val(),
						todayMGPrice: 1,
						CSRFToken: csrfToken,
						vcode: $('#sellModal .input-vcode').val(),
                        payPassword:$('#sellModal .pay-password').val(),
                        googlecode:$('#sellModal .input-googlecode').val()
					},
					success: function(data){
						canBtnSellMgClick = 1;
						if(0 == data.status){
	  						alertBoxFunc(data.data.message,'sure', function(){
	  							window.location.reload();
	  						});
	  					}else{
	  						alertBoxFunc(data.error.message,'sure');
	  					}
					}
				});
				$('#sellModal').modal('hide');
			});		
		});
		
		var now = ${timeNowInGMT};
		var endDate = getNextDayZeroTime(now);
		var timeDiff =  endDate - now;	
		var beginDate = new Date().getTime();
		function time2date(time){
			if(time < 0){
				return [0, 0, 0, 0];
			}
			var day = Math.floor(time/(1000*60*60*24));
			var hour = Math.floor((time%(1000*60*60*24))/(1000*60*60));
			var minute = Math.floor(time%(1000*60*60)/(1000*60));
			var second = Math.floor(time%(1000*60)/1000);
			
			return [day, hour, minute, second];
		}
		function getNextDayZeroTime(now){
			var nextDay = new Date(now + 1000*60*60*24); //下一天
			return +new Date(nextDay.getFullYear(), nextDay.getMonth(), nextDay.getDate());
		}
		setInterval(function(){
			var time = new Date().getTime();
			var realTimeDiff = timeDiff - (time - beginDate);
			var count = time2date(realTimeDiff);
			if(!count[1] && !count[2] && !count[3]){
				window.location.reload();
			}
			$('#countdown-hour').html(count[1]);
			$('#countdown-minute').html(count[2]);
			$('#countdown-second').html(count[3]);			
		},1000);
		var monthArr = ['<@spring.messageText "soldmg.text16" "一月"/>','<@spring.messageText "soldmg.text18" "二月"/>','<@spring.messageText "soldmg.text20" "三月"/>','<@spring.messageText "soldmg.text22" "四月"/>','<@spring.messageText "soldmg.text24" "五月"/>','<@spring.messageText "soldmg.text26" "六月"/>','<@spring.messageText "soldmg.text28" "七月"/>','<@spring.messageText "soldmg.text30" "八月"/>','<@spring.messageText "soldmg.text31" "九月"/>','<@spring.messageText "soldmg.text32" "十月"/>','<@spring.messageText "soldmg.text33" "十一月"/>','<@spring.messageText "soldmg.text34" "十二月"/>'];
		var dayArr = ['<@spring.messageText "soldmg.text17" "星期日"/>','<@spring.messageText "soldmg.text19" "星期一"/>','<@spring.messageText "soldmg.text21" "星期二"/>','<@spring.messageText "soldmg.text23" "星期三"/>','<@spring.messageText "soldmg.text25" "星期四"/>','<@spring.messageText "soldmg.text27" "星期五"/>','<@spring.messageText "soldmg.text29" "星期六"/>'];
		var currentDate = new Date(now);
		var currentYear = currentDate.getFullYear();
		var currentMonth = currentDate.getMonth();
		var currentDay = currentDate.getDate();
		var currentWeekDay = currentDate.getDay();
		$('#current-year').html(currentYear);
		$('#current-month').html(monthArr[currentMonth]);
		$('#current-day').html(currentDay);
		$('#current-weekday').html(dayArr[currentWeekDay]);

		//出售记录分页
		var paging = new pagingFunc({
        	pageBox:".table-pager",
        	ajaxUrl:"/deal/sold/mg/list",
        	type: "Get",
        	pageKey:"sold_mg_page",
			sizeKey:"sold_mg_size",
        	size:20, 
        	mode:"Server", 
			intoBox : function(data){ //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。
	        	var rows = data.rows;
	        	var htmlT="";
	        	if (rows==null || rows.length <= 0) {
					htmlT='<div class="table-tr clearfix">'+' <@spring.messageText "soldmg.text35" "您暂时没有MG出售记录"/>'+'</div>';
            	} else{
        			for(var i = 0 ; i < rows.length ; i++){
        				//console.log(rows[i].addTime);
        				var addTime = rows[i].addTime ;
        				var priceBtc = rows[i].price.toFixed(4) ;
        				var number =rows[i].amount;
        				var income = rows[i].btc.toFixed(8);

        				htmlT += '<div class="table-tr clearfix">'+
									'<div class="table-td soldmg-tr-time">'+ addTime +'</div>'+
									'<div class="table-td soldmg-tr-price"> '+ priceBtc+' </div>'+
									'<div class="table-td soldmg-tr-number"> '+number+' </div>'+
									'<div class="table-td soldmg-tr-income"> '+income+' </div>'+
								'</div>' 
        			}
				};
				$("#table-tbody").html(htmlT);
	        }
        });

        $('.mg-price-tip-btn').on('mouseover', function(){
        	$('.mg-price-tip').show();
        });
        $('.mg-price-tip-btn').on('mouseout', function(){
        	$('.mg-price-tip').hide();
        });
	});
	
</script>
</#macro>
