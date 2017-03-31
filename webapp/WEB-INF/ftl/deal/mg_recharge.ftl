<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "mg_recharge.text0" "MG充值"/>
</#macro>
<#macro head>
<style>
    .recharge-plateform-img{
        background: url('/static/images/platform-icon-<@spring.messageText "index.text39" "CN"/>.png') no-repeat;
    }
</style>
<link rel="stylesheet" type="text/css" href="/static/css/recharge.css" />

</#macro>

<#macro body>
<#assign configArr = [
    ['1','比特儿','https://www.bter.com/trade/mg_btc','/static/images/logo_bter.png']
]>
<#assign nav_page="assets" >
<#assign nav_sub_page="mg_recharge" >
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
	    				<div class="recharge-address">
	    					<div class="recharge-address-step">
	    						<i></i><@spring.messageText "mg_recharge.text1" "步骤一"/>：<@spring.messageText "mg_recharge.text3" "复制您的MG充值地址"/>
	    					</div>
	    					<div class="recharge-address-content clearfix">
	    						<div class="recharge-address-op mg-recharge-address-op">
                                    <div class="title_name">MG <@spring.messageText "recharge.text18" "充值地址"/>: </div>
	    							<div class="recharge-address-str clearfix">
	    								<p class="recharge-address-str-text">${mgRechargeAddress}</p>
	    								<div class="recharge-address-qr"></div>
		    							<div class="recharge-address-qr-img">
                                            <img src="/deal/recharge/QR?rechargeAddress=${mgRechargeAddress}" />
		    							</div>
	    							</div>
	    							<button  id="copyBtn"><@spring.messageText "recharge.text19" "复制"/></button>
                                    <div class="prompt"> ※ <@spring.messageText "mg_recharge.text8" "充值过程中会产生网络确认费用"/></div>
	    						</div>
	    					</div>
	    				</div>
                        <div class="recharge-platform mg-recharge-platform">
                            <div class="recharge-address-step">
                                <i></i><@spring.messageText "mg_recharge.text2" "步骤二"/>：<@spring.messageText "mg_recharge.text4" "您可以通过以下平台或方式获取MG"/>
                            </div>
                            <div class="clearfix">
                                <div class="clearfix mindbank">
                                    <h4><@spring.messageText "mg_recharge.text5" "智慧银行客户端"/></h4>
                                    <a href="http://www.mindgene.org/">
                                        <img src="/static/images/logo_mindbank.png" alt="" target="_blank">
                                    </a>
                                </div>
                                <div class="clearfix plat">
                                    <h4><@spring.messageText "mg_recharge.text6" "其他交易平台"/></h4>
                                    <#list configArr as item>
                                    <a href="${item[2]}"  target="_blank">
                                        <img src="${item[3]}" alt="${item[1]}">
                                    </a>
                                    </#list>
                                    <span><@spring.messageText "mg_recharge.text7" "更多平台敬请期待"/></span>
                                </div>
                            </div>
                        </div>
	    				<div class="recharge-note note-list mg-recharge-note">
	    					<div class="recharge-note-title"><@spring.messageText "recharge.text28" "充值记录"/>
	    					</div>
	    					<div class="sail-note-content">
	    						<div class="mod-table">
	    							<div class="table-thead">
	    								<div class="table-th note-tr-address">
	    									<@spring.messageText "recharge.text30" "充值地址"/>
	    								</div>
	    								<div class="table-th note-tr-time">
	    									<@spring.messageText "recharge.text31" "充值时间"/>
	    								</div>
	    								<div class="table-th note-tr-amount">
	    									<@spring.messageText "recharge.text32" "充值金额"/>
	    								</div>
	    								<div class="table-th note-tr-status">
	    									<@spring.messageText "recharge.text33" "充值状态"/>
	    								</div>
	    							</div>
	    							<div class="table-tbody" id="table-tbody">
										
	    							</div>
                                    <div class="table-pager" id="table-pager">
                                
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
<script type="text/javascript" src="/static/js/plugin/jquery.zclip.min.js"></script>
<script>
	$(function(){

		$('.recharge-address-qr').on('mouseover', function(){
			$('.recharge-address-qr-img').show();
		});
		$('.recharge-address-qr').on('mouseout', function(){
			$('.recharge-address-qr-img').hide();
		});
		$('#copyBtn').zclip({
	        path: '/static/other/ZeroClipboard.swf',
	        copy: function () {//复制内容 
	            return $.trim($(this).parent().find('.recharge-address-str .recharge-address-str-text').text());
	        },
	        afterCopy: function () {//复制成功 
	           alertBoxFunc('<@spring.messageText "recharge.text34" "复制成功"/>!','sure');
	        }
	    });

        var paginger = new pagingFunc({
        	pageBox:"#table-pager",
        	ajaxUrl:"/deal/mg_recharge_list",
        	type: "Get",
        	pageKey:"mg_recharge_page",
			sizeKey:"mg_recharge_size",
        	size:10,
            mode:"Server",
			intoBox : function(data){ 
	        	var datar = data.rows;
	        	var htmlT="";
	        	if (datar==null || datar.length <= 0) {
					htmlT='<div class="table-tr clearfix">'+' <@spring.messageText "recharge.no.data" "您暂时没有充值记录"/> '+'</div>';
            	} else{
					for(var i = 0 ; i < datar.length ; i++){
						htmlT += '<div class="table-tr clearfix">'+
									'<div class="table-td note-tr-address"> '+datar[i].rechargeSource +' </div>'+
									'<div class="table-td note-tr-time">'+ datar[i].addTime +'</div>'+
									'<div class="table-td note-tr-amount"> '+ datar[i].rechargeAmount+' </div>'+
									'<div class="table-td note-tr-status">';
							if (datar[i].confirmations>=1) {
								htmlT += '<@spring.messageText "succeed" "成功"/>';
							} else{
								htmlT += '<@spring.messageText "withdrawal.text15" "待确认"/>';
							};
						htmlT +=    '</div>'+
								'</div>' ;
					}
				};
				$("#table-tbody").html(htmlT);
	        }
        });

	});
</script>
</#macro>
