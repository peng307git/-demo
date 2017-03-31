<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "asset.text4" "比特币充值"/>
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
	['1','OKCoin中国','https://www.okcoin.cn'],
	['2','火币网','https://www.huobi.com'],
	['3','BTCC','https://www.btcc.com/'],
	['4','Bitstamp','https://www.bitstamp.net/'],
	['5','BitVC','https://www.bitvc.com'],
	['6','云币网','https://yunbi.com/'],
	['7','Lakebtc','https://www.lakebtc.com/'],
	['8','比特汇','https://www.btct.com/index.html'],
	['9','Itbit','https://www.itbit.com/'],
	['10','比特时代','http://www.btc38.com/'],
	['11','BTC100','https://www.btc100.com/'],
	['12','比特儿Bter','http://bter.com/'],
	['13','双子星Gemini','https://gemini.com/'],
	['14','BTCBear','https://btcbear.com/'],
	['15','Avatrade','http://www.avatrade.cn/'],
	['16','Kraken','https://www.kraken.com/'],
	['17','Bitcoin.de','https://www.bitcoin.de/'],
	['31','bitFlyer','https://bitflyer.jp/'],
	['19','QuadrigaCX','https://quadrigacx.com/'],
	['20','Bitt','https://www.bitt.com/home'],
	['21','Expresscoin','http://www.expresscoin.com/'],
	['22','Bitrefill','https://www.bitrefill.com/'],
	['23','BitMex','https://www.bitmex.com/'],
	['24','CoinOmat','https://coinomat.com/#OKPAY/BTC'],
	['25','Harborly','https://harbor.ly/'],
	['26','Gocoin','http://www.gocoin.com/'],
	['27','btcbox','https://www.btcbox.co.jp/'],
	['28','zaif','https://zaif.jp/'],
	['29','anxpro','https://anxpro.com/']
]>
<#assign nav_page="assets" >
<#assign nav_sub_page="assets_recharge" >
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
	    					<div class="recharge-address-title">
	    						BTC <@spring.messageText "recharge.text18" "充值地址"/>
	    					</div>
	    					<div class="recharge-address-content clearfix">
	    						<div class="recharge-address-op">
	    							<div class="recharge-address-str clearfix">
	    								<p class="recharge-address-str-text">${rechargeAddress}</p>
	    								<div class="recharge-address-qr"></div>
		    							<div class="recharge-address-qr-img">
                                            <img src="/deal/recharge/QR?rechargeAddress=${rechargeAddress}" />
		    							</div>
	    							</div>
	    							<button  id="copyBtn"><@spring.messageText "recharge.text19" "复制"/></button>
	    						</div>
	    						<div class="recharge-address-tip">
	    							<@spring.messageText "recharge.text20" "充值须知：由于比特币的价格为实时波动的，建议您的实际充值额度略高于充值额度参考价格的2%，避免出现因比特币余额不足的问题导致认购失败。"/>
	    							
	    						</div>
	    					</div>
	    				</div>
	    				<!-- <div class="recharge-package">
	    					<div class="recharge-package-title">
	    						<@spring.messageText "recharge.text21" "充值数量参考"/>
	    					</div>
	    					<div class="recharge-package-content clearfix">
	    						<div class="sail-set-title">
	    							<@spring.messageText "recharge.text4" "启航套餐"/>
	    						</div>
	    						<div class="sail-set-content"> 
	    							<span>
	    								<div class="sail-device">
	    									<img src="/static/images/sail-device.png" />
	    								</div>
	    								<div class="sail-price">
	    									<@spring.messageText "recharge.text27" "套餐价"/>：<em>$100</em>
	    								</div>
	    							</span>
	    							<i class="blue">+</i>
	    							<span>
	    								<div class="sail-device">
	    									<img src="/static/images/sail-package.png" />
	    								</div>
	    								<div class="sail-price">
	    									<@spring.messageText "recharge.text27" "套餐价"/>：<em>$100</em>
	    								</div>
	    							</span>
	    							<i class="blue">=</i> <@spring.messageText "recharge.text5" "购买套餐需充值BTC："/><em>฿${experiPrice} </em>
	    						</div>
	    					</div>
	    				</div> -->
	    				<div class="recharge-note note-list">

	    					<div class="recharge-note-title"><@spring.messageText "recharge.text28" "充值记录"/><i></i><span class="more" id="allNote"><@spring.messageText "recharge.text29" "全部记录"/> 》</span>

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
	    							<div class="table-tbody" id="list-init">
										
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    				<div class="recharge-channel">
	    					<div class="recharge-channel-title">
	    						<@spring.messageText "recharge.text22" "快捷充值通道"/>
	    					</div>
	    					<div class="recharge-channel-content clearfix">
	    						<div class="recharge-channel-item recharge-channel-alipay">
	    							<div class="recharge-channel-item-img">
	    								<img src="/static/images/paypal.png" />
	    							</div>
	    							<div class="recharge-channel-item-text">
	    								<a href="/deal/rechargealipay"><@spring.messageText "recharge.text24" "PayPal BTC充值通道"/></a>
	    							</div>
	    						</div>
	    						<div class="recharge-channel-item recharge-channel-wx">
	    							<div class="recharge-channel-item-img">
	    								<img src="/static/images/wechat.png" />
	    							</div>
	    							
	    							<div class="recharge-channel-item-text">
	    								<a href="/deal/rechargewx"><@spring.messageText "recharge.text25" "微信BTC充值通道"/></a>
	    							</div>
	    						</div>
	    						<div class="recharge-channel-item recharge-channel-alipay">
	    							<div class="recharge-channel-item-img">
	    								<img src="/static/images/alipay.png" />
	    							</div>
	    							<div class="recharge-channel-item-text">
	    								<a href="http://www.renrenbit.com/ma" target="_blank"><@spring.messageText "recharge.text26" "支付宝BTC充值通道"/></a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    				<div class="recharge-platform">
	    					<div class="recharge-platform-title">
	    						<@spring.messageText "recharge.text23" "全球交易平台"/>
	    					</div>
	    					<div class="recharge-platform-content">
	    						<ul class="clearfix">
	    							<#list configArr as item>
	    							<li>
	    								<a href='<@spring.messageText "friendlinkurl${item[0]}" "${item[2]}"/>' target="_blank">
	    									<div class="recharge-plateform-img recharge-plateform-img${item[0]}"></div>
	    									<div class="recharge-platform-name"><@spring.messageText "friendlink${item[0]}" "${item[1]}"/></div>
	    								</a>
	    							</li>
	    							</#list>
	    							<li>
	    								<a href="###">
	    									<div class="recharge-plateform-img recharge-plateform-img30"></div>
	    									<div class="recharge-platform-name"><@spring.messageText "checking" "审核中"/></div>
	    								</a>
	    							</li>
	    						</ul>
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
         
         //充值地址更新时，出弹窗提醒
        var isRemind = ${isRemind};
        if(isRemind == 0){
        	    var $alertShade = $("<div></div>");
        	    $alertShade.css({'position':'fixed','left':'0','top':'0','background':'rgba(0,0,0,0.4)','width':'100%','height':'100%'});
      	    $alertShade.appendTo(document.body);
        	    alertBoxNew({
			     alertContent:'<p class="text-left"><@spring.messageText "recharge.text37" "为了您的资金安全，比特币充值地址将不定期更新，请您在充值之前复制新的比特币地址。"/></p>', 
			     btnType:'sure', 
			     sureText:'<@spring.messageText "recharge.text36" "我知道了"/>',
			     sureFunc:function(){
			          $alertShade.remove();
			     }
		    });
        }
         
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
	    listInit();
	    function listInit(){
	    	var lister = $("#list-init");
	    	var listHtml ="";
	    	$.ajax({
                url: "/deal/btc/recharge/list",              //请求地址
                type: "Get",  
                //请求方式
                // data: { withdraw_page: pagerNowNum-1, withdraw_size: pagersize ,withdraw_sort:"add_time,DESC"},        //请求参数
                dataType: "json",
                success: function (data) {
                    // 此处放成功后执行的代码
                	var datar = data.data
               		if (datar==null || datar.length <= 0) {
						listHtml = '<div class="table-tr clearfix">'+' <@spring.messageText "recharge.no.data" "您暂时没有充值记录"/> '+'</div>';
              		} else{
              			var needt =0;
              			if (datar.length>10) { needt = 10} else { needt = datar.length };
                  		for(var i = 0 ; i < needt ; i++){
                  			listHtml += '<div class="table-tr clearfix">'+
        							'<div class="table-td note-tr-address"> '+datar[i].rechargeAddress+' </div>'+
									'<div class="table-td note-tr-time">'+ datar[i].dealTime +'</div>'+
									'<div class="table-td note-tr-amount"> '+ datar[i].total+' </div>'+
									'<div class="table-td note-tr-status">';
							if (datar[i].accounted==1) {
								listHtml += '<@spring.messageText "succeed" "成功"/>';
							} else{
								listHtml += '<@spring.messageText "withdrawal.text15" "待确认"/>';
							};
							listHtml += '</div>'+'</div>' ;
						}
					}
                  lister.html(listHtml)
                },
                fail: function (status) {
                    location.reload();
                }
            })
			var html = [
                '<div class="modal fade" id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                  '<div class="modal-dialog modal-lg" role="document">',
                    '<div class="modal-content note-list">',
                      '<div class="recharge-note-title recharge-note-title-sm">',
                      '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                      '<@spring.messageText "recharge.text28" "充值记录"/><i></i></div>',
                      '<div class="modal-body">',
                        '<div class="mod-table">',
    							'<div class="table-thead table-thead-color">',
    								'<div class="table-th note-tr-address"><@spring.messageText "recharge.text30" "充值地址"/></div>',
    								'<div class="table-th note-tr-time"><@spring.messageText "recharge.text31" "充值时间"/></div>',
    								'<div class="table-th note-tr-amount"><@spring.messageText "recharge.text32" "充值金额"/></div>',
    								'<div class="table-th note-tr-status"><@spring.messageText "recharge.text33" "充值状态"/></div>',
    							'</div>',
    							'<div class="table-tbody" id="table-tbody">',
    								
    							'</div>',
    							'<div class="table-pager" id="table-pager">',
		    						'<a id="prev" href="####"><@spring.messageText "wave.query.text14" "上一页"/></a><i>1</i><em>/</em><span></span><a id="next" href="####"><@spring.messageText "wave.query.text15" "下一页"/></a>',
		    					'</div>',
    						'</div>',
                      '</div>',
                    '</div>',
                  '</div>',
                '</div>'
            ].join('');
            $(document.body).append(html);
            //recordInt("#table-tbody");
	    }
	    
	    $('#allNote').on('click',function(e){
            $('#rechargeModal').modal('show');
            $('#rechargeModal').on('hidden.bs.modal', function (e) {
                $('#rechargeModal').modal('hide');
            });
	    });

        var paging = new pagingFunc({
        	pageBox:"#table-pager",//分页数标签的父级
        	ajaxUrl:"/deal/btc/recharge/list",//mode:"Server"时 必选
        	type: "Get",//ajax type 默认 GET
        	pageKey:"withdraw_page",//ajax 参数 当前页Key 默认page
			sizeKey:"withdraw_size",//ajax 参数 单页容量Key 默认size
        	size:10, //ajax 参数 单页容量 默认10
        	//mode:"Server", //分页方法 Server or FE (注意大小写),默认FE
        	centerBox:"#table-tbody",//被分页内容的父级元素 mode:"FE" 时必选 
        	centerSelf:".table-tr",//本分页内容本元素 mode:"FE" 时必选 
			//sortKey:"withdraw_sort",  // 后台排序方式Key ---- 目前防止SQL注入由后端控制，此功能取消。
			//otherData:"ee=66&ii=99",//追加参数（如我的脑波数据展示选择的时间段等）需拼成字符串 "ee=66&ii=99"
			intoBox : function(data){ //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。
	        	var datar = data;
	        	var htmlT="";
	        	if (datar==null || datar.length <= 0) {
					htmlT='<div class="table-tr clearfix">'+' <@spring.messageText "recharge.no.data" "您暂时没有充值记录"/> '+'</div>';
            	} else{
					for(var i = 0 ; i < datar.length ; i++){
						var addTime = datar[i].addTime ;
						var amount = datar[i].amount ;
						var address = datar[i].btcAddress;
						var confirm = datar[i].confirm;
						var status = datar[i].status;
						htmlT += '<div class="table-tr clearfix">'+
									'<div class="table-td note-tr-address"> '+datar[i].rechargeAddress+' </div>'+
									'<div class="table-td note-tr-time">'+ datar[i].dealTime +'</div>'+
									'<div class="table-td note-tr-amount"> '+ datar[i].total+' </div>'+
									'<div class="table-td note-tr-status">';
							if (datar[i].accounted==1) {
								htmlT += '<@spring.messageText "succeed" "成功"/>';
							} else{
								htmlT += '<@spring.messageText "withdrawal.text15" "待确认"/>';
								rechargeNoteTitleI ++;
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
