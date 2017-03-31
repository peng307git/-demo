<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "rapid_recharge" "快速充值" />
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/recharge.css" />
</#macro>

<#macro body>
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
    	<div class="bd-inner">
	    	<div class="page-title">
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="rechargewx-content-wx">
	    			<span class="rechargewx-item-wx">
	    				<div class="rechargewx-item-img-wx">
	    					<img src="/static/images/otc123.jpg" />
	    				</div>
	    				<div class="rechargewx-item-name-wx">
	    					OTC123
	    				</div>
	    				<div class="rechargewx-item-fee">
	    					<@spring.messageText "rechargewx.item.fee2" "交易手续费"/>：<@spring.messageText "rechargewx.item.fee3" "约"/> 2%
	    				</div>
	    			</span>
	    			<span class="rechargewx-item-wx">
	    				<div class="rechargewx-item-img-wx">
	    					<img src="/static/images/kuaibite0706.jpg" />
	    				</div>
	    				<div class="rechargewx-item-name-wx">
	    					快比特
	    				</div>
	    				<div class="rechargewx-item-fee">
	    					<@spring.messageText "rechargewx.item.fee2" "交易手续费"/>：1%
	    				</div>
	    			</span>
	    			<span class="rechargewx-item-wx">
	    				<div class="rechargewx-item-img-wx">
	    					<img src="/static/images/yilian0706.jpg" />
	    				</div>
	    				<div class="rechargewx-item-name-wx">
	    					易联BTC
	    				</div>
	    				<div class="rechargewx-item-fee">
	    					<@spring.messageText "rechargewx.item.fee2" "交易手续费"/>：1%
	    				</div>
	    			</span>
	    			<span class="rechargewx-item-wx">
	    				<div class="rechargewx-item-img-wx">
	    					<img src="/static/images/bitweifu.jpg" />
	    				</div>
	    				<div class="rechargewx-item-name-wx">
	    					<@spring.messageText "rechargewx.item.name4" "比特微付"/>
	    				</div>
	    				<div class="rechargewx-item-fee">
	    					<@spring.messageText "rechargewx.item.fee2" "交易手续费"/>：1%
	    				</div>
	    			</span>
	    			<span class="rechargewx-item-wx">
		    				<div class="rechargewx-item-img-wx">
		    					<img src="/static/images/qr-bttong.jpg" />
		    				</div>
		    				<div class="rechargewx-item-name-wx">
		    					<@spring.messageText "rechargewx.item.name3" "比特通二维码"/>
		    				</div>
		    				<div class="rechargewx-item-fee">
		    					<@spring.messageText "rechargewx.item.fee2" "交易手续费"/>：1%
		    				</div>
		    			</span>
	    		</div>
	    		<div class="rechargewx-step">
	    			<div class="rechargewx-step-title">
	    				<@spring.messageText "rechargewx.step.title" "微信BTC充值步骤"/>
	    			</div>
	    			<div class="rechargewx-step-content">
	    				<div class="rechargewx-step-text">
		    				<div class="rechargewx-step-one">
		    					<h5>1.<@spring.messageText "rechargewx.step.one" "扫码加入"/></h5>
		    					<p><@spring.messageText "rechargewx.step.one.desc" "请用手机扫码上方二维码，加入微信BTC充值通道"/></p>
		    				</div>
		    				<div class="rechargewx-step-one" style="display:none;">
		    					<h5>2.<@spring.messageText "rechargewx.step.two" "准备购买"/></h5>
		    					<p><@spring.messageText "rechargewx.step.two.desc" "输入M开始微信支付引导服务"/></p>
		    				</div>
		    				<div class="rechargewx-step-one" style="display:none;">
		    					<h5>3.<@spring.messageText "rechargewx.step.three" "开始购买"/></h5>
		    					<p><@spring.messageText "rechargewx.step.three.desc" "输入MR快速买入比特币"/></p>
		    				</div>
		    				<div class="rechargewx-step-one" style="display:none;">
		    					<h5>4.<@spring.messageText "rechargewx.step.four" "购买数量"/></h5>
		    					<p><@spring.messageText "rechargewx.step.four.desc" "输入购买数量，以#号结束"/></p>
		    				</div>
		    				<div class="rechargewx-step-one" style="display:none;">
		    					<h5>5.<@spring.messageText "rechargewx.step.five" "输入地址"/></h5>
		    					<p><@spring.messageText "rechargewx.step.five.desc" "输入您的比特币接受地址，以#号结束"/></p>
		    				</div>
		    				<div class="rechargewx-step-one" style="display:none;">
		    					<h5>6.<@spring.messageText "rechargewx.step.six" "完成购买"/></h5>
		    					<p><@spring.messageText "rechargewx.step.six.desc1" "打开二维码地址，输入系统提示金额，完成支付"/></p>
		    					<p><@spring.messageText "rechargewx.step.six.desc2" "系统自动将比特币转入您的账户，至此完成比特币购买"/></p>
		    				</div>
	    				</div>
	    				<div class="rechargewx-step-icon">
	    					<span class="btn-rechargewx-step-one active">
	    						<@spring.messageText "rechargewx.step1" "扫码加入"/>
	    					</span>
	    					<span class="btn-rechargewx-step-two">
	    						<@spring.messageText "rechargewx.step2" "准备购买"/>
	    					</span>
	    					<span class="btn-rechargewx-step-three">
	    						<@spring.messageText "rechargewx.step3" "开始购买"/>
	    					</span>
	    					<span class="btn-rechargewx-step-four">
	    						<@spring.messageText "rechargewx.step4" "购买数量"/>
	    					</span>
	    					<span class="btn-rechargewx-step-five">
	    						<@spring.messageText "rechargewx.step5" "输入地址"/>
	    					</span>
	    					<span class="btn-rechargewx-step-six">
	    						<@spring.messageText "rechargewx.step6" "完成购买"/>
	    					</span>
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
<script>
$(function(){
	var clickIndex=0;
	var int = setInterval(runClick,3000)
	$('.rechargewx-step-icon span').on('click', function(){
		var index = $(this).index();
		clickIndex= index;
		$('.rechargewx-step-icon span').removeClass('active');
		$(this).addClass('active');
		$('.rechargewx-step-text').children().hide().eq(index).show();
		int = clearInterval(int);
		int = setInterval(runClick,3000);
	});
	function runClick(){
		clickIndex ++;
		if(clickIndex>=6){
			clickIndex=0;
		}
		console.log(clickIndex);
		$('.rechargewx-step-icon span').eq(clickIndex).trigger('click');
	}
});
</script>
</#macro>
