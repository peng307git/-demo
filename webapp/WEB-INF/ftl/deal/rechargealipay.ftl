<#include "common/base-v2.ftl" />
<#macro title>
	<@spring.messageText "rapid_recharge" "快速充值" />
</#macro>
<#macro head>

<link rel="stylesheet" type="text/css" href="/static/css/recharge.css" />

</#macro>

<#macro body>
	<div class="wrap">
		<#include "common/header.ftl">
			<div id="bd">
				<div class="bd-inner">
					<div class="page-title page-title-pay">
						<@spring.messageText "rapid_recharge" "快速充值" />
					</div>
					<div class="page-content deal-page-content page-content-pay clearfix">
						<div class="rechargewx-content">
							<div class="rechargewx-content-sub">
								<a href="http://www.virwox.com/" target="_blank" class="rechargewx-item">
									<div class="rechargewx-item-img">
										<img src="/static/images/virwox.png" />
									</div>
									<div class="rechargewx-item-name">
										<@spring.messageText "rechargewx.item.name1" "点击进入VirWox"/>
									</div>
								</a>
								<div class="rechargewx-item-fee">
									<@spring.messageText "rechargewx.item.fee" "交易手续费以实际交易为准"/>
								</div>
							</div>
							<div class="rechargewx-content-sub">
								<a href="https://usecryptos.com/?ref=D%C3%A2niel" target="_blank" class="rechargewx-item">
									<div class="rechargewx-item-img">
										<img src="/static/images/usecryptos.png" />
									</div>
									<div class="rechargewx-item-name">
										<@spring.messageText "rechargewx.item.name2" "点击进入USECRYPTOS"/>
									</div>
								</a>
								<div class="rechargewx-item-fee">
									<@spring.messageText "rechargewx.item.fee" "交易手续费以实际交易为准"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<#include "/decorators/footer.ftl">
	</div>
</#macro>

<#macro footerjs>
</#macro>