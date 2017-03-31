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
				    		<h3><@spring.messageText "safety.text15" "设置邮箱"/></h3>
				    		<div class="emailok" >
				    			<i class="success"></i>
				    			<p><@spring.messageText "safety.text97" "添加邮箱成功"/>，<span class="blue">${user.email}</span></p>
				    			<p><span class="gray" id="backsafety"></span></p>
								<a href="/v2/user/safety/into" class="button"><@spring.messageText "safety.text59" "返回安全中心"/></a>
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
<script>
	$(function(){
		var back = $("#backsafety")
		var wait = 5;
		back.text(wait + "<@spring.messageText "safety.text99" "秒后自动返回安全中心"/>");
		var timer = setInterval(function(){
			if(0 == wait){
				clearInterval(timer);
				self.location='/v2/user/safety/into'; 
			}else{
				back.text(wait + "<@spring.messageText "safety.text99" "秒后自动返回安全中心"/>");
				wait--;
			}
		}, 1000);
	});
</script>
</#macro>