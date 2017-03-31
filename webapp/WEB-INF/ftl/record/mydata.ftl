<#include "common/base-v2.ftl" />
<#macro title>
	<@spring.messageText "record.text1" "业绩总览"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/record-data.css" />
</#macro>

<#macro body>
<#assign nav_page="record" >
<#assign nav_sub_page="record_mydata" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
    	<div class="bd-inner">
	    	<div class="page-title">
	    		<!-- <span><img src="/static/images/tip.png" /><@spring.messageText "record.mydata.text50" "每日平衡系数（每次转化MN数）:"/> ${equilibrium}</span> -->
                <h2><@spring.messageText "record.text1" "业绩总览"/></h2>
	    	</div>
	    	<div class="page-content deal-page-content clearfix">
	    		<div class="col-m">
	    			<div class="m-wrap">
	    				<div class="archieve-title clearfix">
	    					<div class="archieve-title-item archieve-title-output active">
	    						<h5><@spring.messageText "record.mydata.text61" "MG产量"/></h5>
	    						<p>${mgAmount}</p>
	    						<div class="archieve-title-link-bg"></div>
	    						<span class="icon-active"></span>
	    					</div>
	    					<div class="archieve-title-item archieve-title-capacity">
	    						<h5><@spring.messageText "record.mydata.text3" "累计产能"/></h5>
	    						<p>${capacity}%</p>
	    						<p class="archieve-title-link"><a href="###" class="btn-add-productivity"><@spring.messageText "record.mydata.text4" "增加产能"/></a></p>
	    						<div class="archieve-title-link-bg"></div>
	    						<span class="icon-active"></span>
	    					</div>
	    					<div class="archieve-title-item archieve-title-relax">
	    						<h5><@spring.messageText "record.mydata.text5" "平均放松度"/></h5>
	    						<p>${avgMeditation}</p>
	    						<span class="icon-active"></span>
	    					</div>
	    				</div>
	    				<div class="archieve-content">
	    					<div class="archieve-content-item archieve-content-output">
	    						<div class="archieve-data clearfix">
	    							<div class="archieve-data-item">
	    								<h5><@spring.messageText "record.mydata.text6" "持有智慧包（MP）"/><span>${MPInfo[2]!(0)}</span><a href="/deal/buy"><@spring.messageText "record.mydata.text7" "购买"/></a></h5>
	    								<p><@spring.messageText "record.mydata.text111" "未解包（MP）"/><span>${MPInfo[1]!(0)}</span>
	    								<#if MPInfo[1]?exists && MPInfo[1] gt 0 >
	    									<a href="/deal/buy#open"><@spring.messageText "record.mydata.text8" "去解包"/></a>
	    								</#if>
	    								</p>
	    								<p><@spring.messageText "record.mydata.text9" "已解包（MP）"/><span>${MPInfo[0]!(0)}</span></p>
	    							</div>
	    							<div class="archieve-data-item">
	    								<h5><@spring.messageText "record.mydata.text10" "持有智慧晶核（MN）"/><span>${MNInfo[0]!(0)}</span></h5>
	    								<p><@spring.messageText "record.mydata.text11" "已激活（MN）"/><span>${MNInfo[1]!(0)}</span>
	    								<p><@spring.messageText "record.mydata.text12" "未激活（MN）"/><span>${MNInfo[2]!(0)}</span></p>
	    							</div>
	    							<div class="archieve-data-item archieve-data-item-noborder">
	    								<h5><@spring.messageText "deduct.query.text32" "可用" />（MG）<span>${MGInfo[1]!(0)}</span></h5>
	    								<p><@spring.messageText "deduct.query.text15" "冻结中" />（MG）<span>${MGInfo[2]!(0)}</span></p>
	    								<p><@spring.messageText "deduct.query.text6" "已扣除" />（MG）<span>${MGInfo[3]!(0)}</span></p>
	    							</div>
	    						</div>
	    						<p>(<@spring.messageText "remark" "备注"/>：<@spring.messageText "timeframe" "统计时间为格林尼治时间"/>)</p>
	    						<div class="archieve-charts">
	    							<div id="charts-0" style="width: 870px;height:300px;"></div>
	    						</div>
	    					</div>
	    					<div class="archieve-content-item archieve-content-capacity" style="display: none;">
	    						<div class="archieve-data clearfix">
	    							<div class="archieve-data-item">
	    								<p><@spring.messageText "record.mydata.text16" "最近推荐时间"/><span>${recruitmentMap['recent.recruitment.time']}</span></p>
	    								<p><@spring.messageText "record.mydata.text17" "最近推荐人数"/><span>${recruitmentMap['recently.headcount']}</span></p>
	    							</div>
	    							<div class="archieve-data-item">
	    								<p><@spring.messageText "record.mydata.text18" "累计直接推荐"/><span>${recruitmentMap['total.direct.recruitment']!(0)}</span></p>
	    								<p><@spring.messageText "record.mydata.text19" "累计增加产能"/><span>${recruitmentMap['cumulative.increase.productivity']!(0)}%</span></p>
	    							</div>
	    							<div class="archieve-data-item archieve-data-item-noborder">
	    								<p><@spring.messageText "record.mydata.text20" "累计间接推荐"/><span>${recruitmentMap['cumulative.indirect.headcount']!(0)}</span></p>
	    								<p><@spring.messageText "record.mydata.text21" "累计增加产能"/><span>${recruitmentMap['cumulative.indirect.productivity']!(0)}%</span></p>
	    							</div>
	    						</div>
	    						<p>(<@spring.messageText "remark" "备注"/>：<@spring.messageText "timeframe" "统计时间为格林尼治时间"/>)</p>
	    						<div class="archieve-charts">
	    							<div id="charts-1" style="width: 870px;height:300px;"></div>
	    						</div>
	    					</div>
	    					<div class="archieve-content-item archieve-content-relax" style="display: none;">
	    						<div class="archieve-data clearfix">
	    							<div class="archieve-data-item">
	    								<p><@spring.messageText "record.mydata.text22" "最新深度放松"/>
											<span>${meditationMap['meditation.depth']!(0)}<@spring.messageText "record.mydata.text60" "秒"/></span>
										</p>
	    								<p><@spring.messageText "record.mydata.text23" "累计深度放松"/>
											<span>${meditationMap['meditation.gt.depth']!(0)}<@spring.messageText "record.mydata.text60" "秒"/></span>
										</p>
	    							</div>
	    							<div class="archieve-data-item">
	    								<p><@spring.messageText "record.mydata.text24" "最新轻度放松"/><span>${meditationMap['meditation.mild']!(0)}<@spring.messageText "record.mydata.text60" "秒"/></span></p>
	    								<p><@spring.messageText "record.mydata.text25" "累计轻度放松"/><span>${meditationMap['meditation.gt.mild']!(0)}<@spring.messageText "record.mydata.text60" "秒"/></span></p>
	    							</div>
	    							<div class="archieve-data-item archieve-data-item-noborder">
	    								<p><@spring.messageText "record.mydata.text26" "最新未放松"/><span>${meditationMap['meditation.not']!(0)}<@spring.messageText "record.mydata.text60" "秒"/></span></p>
	    								<p><@spring.messageText "record.mydata.text27" "累计未放松"/><span>${meditationMap['meditation.gt.not']!(0)}<@spring.messageText "record.mydata.text60" "秒"/></span></p>
	    							</div>
	    						</div>
	    						<p>(<@spring.messageText "remark" "备注"/>：<@spring.messageText "timeframe" "统计时间为格林尼治时间"/>)</p>
	    						<div class="archieve-charts">
	    							<div id="charts-2" style="width: 870px;height:300px;"></div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    		<div class="col-s">
	    			<#include "common/record_side_nav.ftl" >
	    		</div>
	    	</div>
	    </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
<div class="equilibrium-tip" style="display: none;">
	<p><@spring.messageText "record.mydata.text28" "说明："/></p>
	<p><@spring.messageText "record.mydata.text29" "1、平衡数是每日您能量核心下直接和间接邀请好友的平均值。"/></p>
	<p><@spring.messageText "record.mydata.text30" "2、由于是平衡数是以昨天数据为依据，所以不能保证今天数据和昨天一直，仅作为参考值使用。"/></p>
	<p><@spring.messageText "record.mydata.text31" "3、您可在APP中把MN数设置设为每日平衡系即可保证MN的转化数量。"/></p>
</div>
<div class="productivity-tip" style="display: none;">
	<p><@spring.messageText "record.mydata.text32" "说明："/></p>
	<p><@spring.messageText "record.mydata.text33" "进入智慧矿场进行推荐邀请，被邀请者成功注册并购买智慧包（或别人转移）即视为成功。成功邀请后您的个人产能即MG的产出速度将提高。"/></p>
</div>
</#macro>

<#macro footerjs>
<script src="/static/js/echarts.min.js"></script>
<script>
$(function(){
	$('.archieve-title-item').on('click', function(){
		var index = $(this).index();
		$('.archieve-title-item').removeClass('active').eq(index).addClass('active');
		$('.archieve-content-item').hide().eq(index).show();
	});
	
	$('.page-title img').on('mouseover', function(){
		var offset = $(this).offset();
		$('.equilibrium-tip').css({
			left: offset.left + 50,
			top: offset.top - 50
		}).show();
	});
	$('.page-title img').on('mouseout', function(){
		$('.equilibrium-tip').hide();
	});
	$('.btn-add-productivity').on('mouseover', function(){
		var offset = $(this).offset();
		var _selfWidth = $(this).width(); 
		$('.productivity-tip').css({
			left: offset.left + _selfWidth,
			top: offset.top - 50
		}).show();
	});
	$('.btn-add-productivity').on('mouseout', function(){
		$('.productivity-tip').hide();
	});
	var archieveSpan = $(".archieve-content-relax").find('.archieve-data-item').find('span');
	for (var i = archieveSpan.length - 1; i >= 0; i--) {
		//console.log(archieveSpan.eq(i).text());
		archieveSpan.eq(i).text(timeF(archieveSpan.eq(i).text()))
	};
	function timeF(time){
		time = time.split("秒")[0]
		var text = "";
		if (Math.floor(time/60)>0) {
			text += Math.floor(time/60) + "分"
		};
		if (time%60>0) {
			text += time%60 + "秒"
		};
		return text ;
	}
	var chartsData = [
		{
			legend: ['<@spring.messageText "record.mydata.text1" "本世纪累计产量"/>'],
			xAxis: [],
			series: [
				{
					name: '<@spring.messageText "record.mydata.text1" "本世纪累计产量"/>',
					type: 'line',
					data: []
				}
			],
			color: ['#00ABAC','#2f4554','#c23531']
		},
		{
			legend: ['<@spring.messageText "record.mydata.text37" "累计产能"/>'],
			xAxis: [],
			series: [
				{
					name: '<@spring.messageText "record.mydata.text38" "累计产能"/>',
					type: 'line',
					data: []
				}
			],
			color: ['#0E8BEC','#2f4554','#c23531'],
			dataZoom: [
		        {   
		            type: 'slider', 
		            start: 80,     
		            end: 100 
		        },
		        {   
		            type: 'inside', 
		            start: 80,    
		            end: 100  
		        }
		    ]
		},
		{
			legend: [ '<@spring.messageText "record.mydata.text41" "未放松"/>','<@spring.messageText "record.mydata.text40" "轻度放松"/>','<@spring.messageText "record.mydata.text39" "深度放松"/>' ],
			xAxis: [],
			series: [
				{
					name: '<@spring.messageText "record.mydata.text44" "未放松"/>',
					type: 'line',
					data: []
				}
				,
				{
					name: '<@spring.messageText "record.mydata.text43" "轻度放松"/>',
					type: 'line',
					data: []
				},
				{
					name: '<@spring.messageText "record.mydata.text42" "深度放松"/>',
					type: 'line',
					data: []
				}
				],
			color: ['#61a0a8','#f04880','#6e0ec0'],
			dataZoom: [
		        {   
		            type: 'slider', 
		            start: 80,     
		            end: 100 
		        },
		        {   
		            type: 'inside', 
		            start: 80,    
		            end: 100  
		        }
		    ]
		}
	];
	<#list mgHistoryList as item>
		chartsData[0].xAxis.push('${item.txdate}');
		chartsData[0].series[0].data.push(${item.summg!(0)});
	</#list>
	<#list CAPhistoryList as item>
		chartsData[1].xAxis.push('${item.txdate}');
		chartsData[1].series[0].data.push(${item.sumcapacity!(0)});
	</#list>
	<#list meditationHistoryList as item>
		chartsData[2].xAxis.push('${item.txdate}');
		
		chartsData[2].series[0].data.push((${item.sumnonetime!(0)}/60000).toFixed(4));
		chartsData[2].series[1].data.push((${item.sumshallowtime!(0)}/60000).toFixed(4));
		chartsData[2].series[2].data.push((${item.sumdeeptime!(0)}/60000).toFixed(4));
	</#list>
	
	var chartHeightArr = new Array(maxData(chartsData[2].series[0].data),maxData(chartsData[2].series[1].data),maxData(chartsData[2].series[2].data));
	// var chartHeight = Math.ceil(maxData(chartHeightArr)/15)*15;
	// if(chartHeight>300){
	// 	$("#charts-2").height(chartHeight);
	// }
	// else{
	// 	$("#charts-2").height(300);
	// }
    function maxData(arData){
		var max = Math.max.apply(null, arData);
		return max;
	}

    for(var i = 0; i < 3; i++){
    	var option = {
    		legend: {
    			bottom: 10,
    			data: chartsData[i].legend
    		},
		    tooltip: {
		        trigger: 'axis'
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: chartsData[i].xAxis
		    },
		    yAxis: {
		        type: 'value'
		    },
		    // dataZoom: chartsData[i].dataZoom,
		    color: chartsData[i].color,
		    series: chartsData[i].series
		};
		// if (i==2) {
		// 	option.yAxis.interval= 15;
		// 	option.yAxis.interval= 15;	
  //       };
		var myChart = echarts.init(document.getElementById('charts-' + i));
		myChart.setOption(option);
    }    
});
</script>
</#macro>
